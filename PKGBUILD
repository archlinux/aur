# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=cfetch-agent
pkgver=0.9.9
pkgrel=1
pkgdesc="Cited, trust-tiered memory for AI coding agents over plain Markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/corbet-labs/cfetch"
license=('LicenseRef-FSL-1.1-ALv2')
provides=('cfetch')
conflicts=('cfetch')
# !lto: the cc-crate builds sqlite3.c with the ambient CFLAGS; under makepkg's global
# lto option that produces GCC-LTO bitcode objects, which rust-lld cannot consume —
# the archive links "successfully empty" and every sqlite3_* symbol goes missing.
options=('!lto')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/corbet-labs/cfetch.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

_cfetch_variant() {
  case "$CARCH" in
    x86_64) printf '%s\n' linux-cfetch-remote-x86_64 ;;
    aarch64) printf '%s\n' linux-cfetch-remote-arm64 ;;
    *) printf 'unsupported cfetch architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac
}

_cfetch_filter_native_cflags() {
  local flag
  local -a filtered=()
  for flag in $1; do
    case "$flag" in
      -march=*|-mcpu=*|-mtune=*) ;;
      *) filtered+=("$flag") ;;
    esac
  done
  printf '%s ' "${filtered[@]}"
}

_cfetch_filter_native_rustflags() {
  local -a flags=()
  local -a filtered=()
  local index
  read -r -a flags <<<"$1"
  for ((index = 0; index < ${#flags[@]}; index++)); do
    case "${flags[index]}" in
      -Ctarget-cpu=*) ;;
      -C)
        if ((index + 1 < ${#flags[@]})) && [[ ${flags[index + 1]} == target-cpu=* ]]; then
          ((index += 1))
        else
          filtered+=("${flags[index]}")
        fi
        ;;
      *) filtered+=("${flags[index]}") ;;
    esac
  done
  printf '%s ' "${filtered[@]}"
}

_cfetch_portable_build_env() {
  local c_target rust_target
  case "$CARCH" in
    x86_64)
      c_target='-march=x86-64 -mtune=generic'
      rust_target='x86-64'
      ;;
    aarch64)
      c_target='-march=armv8-a -mtune=generic'
      rust_target='generic'
      ;;
    *) printf 'unsupported cfetch architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac

  # AUR packages normally inherit the builder's makepkg flags. That is unsafe for
  # cfetch because libsqlite3-sys compiles bundled C: a package built on a newer
  # machine with -march=native can SIGILL on another machine of the same Arch
  # architecture. Keep hardening/optimization flags, but replace CPU selection
  # with the portable baseline promised by arch=(). Do the same for Rust flags so
  # a builder-local target-cpu override cannot leak into the distributed binary.
  export CFLAGS="$(_cfetch_filter_native_cflags "${CFLAGS:-}")$c_target"
  export CXXFLAGS="$(_cfetch_filter_native_cflags "${CXXFLAGS:-}")$c_target"
  export RUSTFLAGS="$(_cfetch_filter_native_rustflags "${RUSTFLAGS:-}")-C target-cpu=$rust_target"
}

build() {
  cd "$pkgname"
  _cfetch_portable_build_env
  CFETCH_VARIANT="$(_cfetch_variant)" cargo build --release --locked
}

check() {
  cd "$pkgname"
  # `option_env!("CFETCH_VARIANT")` is tracked by Cargo. Running tests without
  # the same value recompiles target/release/cfetch as an unidentified developer
  # build, and package() would then install that overwritten binary.
  _cfetch_portable_build_env
  CFETCH_VARIANT="$(_cfetch_variant)" cargo test --release --locked
}

package() {
  cd "$pkgname"
  # The cargo bin target is `cfetch` (the package base differs only because the AUR
  # name was taken); the file must be /usr/bin/cfetch — units and hooks exec that path,
  # and provides=('cfetch') is a virtual name, not a file.
  install -Dm755 target/release/cfetch "$pkgdir/usr/bin/cfetch"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 THIRD-PARTY-LICENSES.txt \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
}
