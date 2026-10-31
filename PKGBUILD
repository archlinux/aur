# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

# Builds efr from the GitHub tag tarball, with the ghostty screen backend. The
# efr-code-bin package installs the prebuilt release of the same version.
#
# The ghostty screen needs a build of libghostty-vt by Zig 0.17.0 exactly
# (docs/ghostty-pin.md). The Zig of the Arch repositories moves on to 0.18 and
# later, so this package does not use it: it downloads the official Zig 0.17.0
# build from ziglang.org, pinned by its checksum, and uses it only for the
# build. The ghostty source is the commit that the libghostty-vt pin names.
# All downloads happen in the sources and in prepare(); build() needs no network.
pkgname=efr-code
pkgver=0.0.7
pkgrel=1
pkgdesc='Terminal-first AI agent harness that lives in zsh, with a daemon that owns the state'
arch=('x86_64')
url='https://github.com/eggfriedrice24/eggfriedrice.code'
license=('MIT')
depends=('glibc' 'libgcc' 'zsh')
makedepends=('cargo')
# check() runs the tests with nextest, as CI does; the scope tests run git.
checkdepends=('cargo-nextest' 'git')
optdepends=('bubblewrap: the kernel sandbox of the auto mode (also needs Linux 7.1 or newer)'
            'fzf: the live search picker of ,resume (0.46 or newer)'
            'git: project roots and the git facts of a turn'
            'xdg-dbus-proxy: read-only system queries in the auto mode (0.1.9 or newer)'
            'xdg-utils: let efr login openai open the browser with EFR_OPEN_BROWSER=1')
conflicts=("$pkgname-bin")
install=efr-code.install
# The -flto of makepkg.conf makes GCC write LTO bytecode into the C objects of
# aws-lc-sys, which the lld of rustc cannot link. The Cargo profile has its own LTO.
options=('!lto')
# The ghostty commit of the libghostty-vt pin, and the Zig release it needs.
# Change them together with docs/ghostty-pin.md.
_ghostty=521cf2c5d30bd48028ca61546c64e7913764073d
_zig=0.17.0
_src="eggfriedrice.code-$pkgver"
_zigdir="zig-$CARCH-linux-$_zig"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "ghostty-$_ghostty.tar.gz::https://github.com/ghostty-org/ghostty/archive/$_ghostty.tar.gz"
        "https://ziglang.org/download/$_zig/$_zigdir.tar.xz")
# The first sum is filled in for each release by .github/workflows/aur.yml from
# the tag tarball. The other two are pinned: the ghostty archive of the commit,
# and the Zig tarball whose SHA-256 ziglang.org publishes in
# https://ziglang.org/download/index.json
# (1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026).
b2sums=('51cf56a003fc7b958e055a8b69e079a3aee77e180eeb92e306e5639ffbc7749291eacf55bb4ee39bf45cfa73855e90f86ee9f909bfe376e5b253bbce96bcb4fa'
        '693dc989777edf1bd0bd7280bd393a93c5910409b8b9df3e57b2938954eb64b2c3d8d8e686657cbca2608ea592b8a39caabedff345ecb027033616e7c50ad692'
        '384b04872c92132ffeaee2c5201dff61ea10e00e8b3d42c6745246f79b847e54b05262ff89cd850d30e32957a82cb1b15722511e9535db6e9126912b182a3a61')

# Keep debug info in the binaries so makepkg can split it into the -debug package.
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# aws-lc-sys (under rustls) must build its jitter entropy source with -O0 and fails
# with any other level. cc appends CFLAGS last, so the -O2 of makepkg.conf would win.
# Without a -O in CFLAGS, cc takes the level of the Cargo profile, so the rest of the
# C code stays optimized.
_drop_cflags_optimization() {
  local flag kept=()
  for flag in $CFLAGS; do
    [[ $flag == -O* ]] || kept+=("$flag")
  done
  export CFLAGS="${kept[*]}"
}

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # The Zig packages of the ghostty build. Zig 0.17 fetches them into zig-pkg/ of
  # the ghostty source, where build() finds them. A lazy package is fetched only
  # when the build asks for it, and --help asks for the ones of these options, so
  # they must stay the options that libghostty-vt-sys's build.rs passes at the
  # pinned rev; zig build --fetch=all would fetch about 550 MB instead of 30 MB.
  # Zig 0.17 has no --global-cache-dir for zig build; the variable sets it.
  cd "$srcdir/ghostty-$_ghostty"
  ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache" "$srcdir/$_zigdir/zig" build \
    -Demit-lib-vt=true -Doptimize=ReleaseFast -Dcpu=baseline \
    -Demit-xcframework=false -Dapp-runtime=none --help > /dev/null
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # libghostty-vt-sys runs zig from PATH and builds this ghostty source with the
  # packages from prepare(); docs/ghostty-pin.md lists its variables.
  export PATH="$srcdir/$_zigdir:$PATH"
  export GHOSTTY_SOURCE_DIR="$srcdir/ghostty-$_ghostty"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
  export LIBGHOSTTY_VT_SYS_CPU=baseline
  _drop_cflags_optimization
  # The packages and the feature of `just build-release`.
  cargo build --frozen --release -p efr-daemon -p efr-cli -p efr-sbx \
    --features efr-daemon/screen-ghostty

  # A build with the sandbox's test seams lets a test replace the launcher and the
  # probe; it must never ship.
  if [[ "$(target/release/efrd --test-seams)" != off ]]; then
    echo "target/release/efrd has the test-sandbox-fake feature" >&2
    return 1
  fi
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The leaf crates of the justfile, as `just test-leaf` runs them. The other tests
  # need a real zsh session, bubblewrap and a kernel sandbox, which a build chroot
  # does not have. nextest runs each test in a process of its own, as the tests
  # expect: some of them install a log subscriber for their thread only.
  local crate crates args=()
  read -ra crates <<<"$(sed -nE 's/^leaf_crates := "(.*)"$/\1/p' justfile)"
  if (( ${#crates[@]} == 0 )); then
    echo "no leaf_crates in the justfile" >&2
    return 1
  fi
  for crate in "${crates[@]}"; do
    args+=(-p "$crate")
  done
  _drop_cflags_optimization
  INSTA_UPDATE=no cargo nextest run --frozen "${args[@]}" --lib --tests
}

package() {
  cd "$_src"
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/efr target/release/efrd
  # efrd finds its sandbox launcher in ../lib/efr/ next to its own directory. It is
  # never on PATH.
  install -Dm0755 -t "$pkgdir/usr/lib/efr/" target/release/efr-sbx
  install -Dm0644 -t "$pkgdir/usr/share/zsh/plugins/efr/" shell/zsh/efr.plugin.zsh
  # The unit of `just install` with the daemon in /usr/bin.
  install -dm0755 "$pkgdir/usr/lib/systemd/user"
  sed 's|^ExecStart=%h/\.local/bin/efrd$|ExecStart=/usr/bin/efrd|' systemd/efrd.service \
    > "$pkgdir/usr/lib/systemd/user/efrd.service"
  grep -qx 'ExecStart=/usr/bin/efrd' "$pkgdir/usr/lib/systemd/user/efrd.service"
  # Each background job runs in a cgroup of its own below efrd's (ADR 0021).
  grep -qx 'Delegate=yes' "$pkgdir/usr/lib/systemd/user/efrd.service"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/" README.md \
    docs/config.md docs/permissions.md docs/sandbox.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/examples/" crates/efr-config/examples/config.toml
}
