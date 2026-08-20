# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="zilch"
pkgname="${_pkgname}-git"
pkgver=1.1.0.r48.20260805.48af27a
pkgrel=1
pkgdesc="Small, fast, self-contained android de-bloat tool."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://github.com/lavafroth/zilch"
_url_main_upstream_source="https://github.com/lavafroth/zilch.git"
license=(
  'GPL-3.0-or-later'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
replaces=()
makedepends=(
  "git"
  "cargo"
  "libgcc"
  "libudev"
)
depends=(
  'glibc'
  'libgcc_s.so'  # 'libgcc'
  'libudev.so'   # 'libudev'
)
optdepends=()
source=(
  "${_pkgname}::git+${_url_main_upstream_source}"  # Main upstream source.
)
sha256sums=(
  'SKIP'  # Main upstream source.
)
_cargo_build_options=(
  --frozen
  --release
  --all-features
)
options+=('!lto')  # Needed to workaround linking issue.
#options+=('!lto' 'debug' '!strip')


prepare() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Generating git log ..."
  git log > git.log

  printf '%s\n' " --> Downloading rust dependencies ..."
  cargo fetch --locked --target host-tuple
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-([0-9]+)$|+\1|')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target

  printf '%s\n' " --> Building ..."
  cargo build "${_cargo_build_options[@]}"
}


package() {
  cd "${srcdir}/${_pkgname}"

  export RUSTUP_HOME="${srcdir}/.rustup"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target


  printf '%s\n' " --> Installing main application ..."
  install -Dvm755 -t "${pkgdir}/usr/bin"  target/release/zilch

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/assets" assets/*

  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
