# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="FlyingCarpet"
pkgname="flying-carpet"
pkgver=9.0.9
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/spieglt/${_name}"
license=(
  'GPL-3.0-only'
)
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
)
replaces=(
  'flyingcarpet-cli'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('6b42cac4c8ad4002067c19fb285e90eba86e099c25e85f5876740f44a1b97f52a5d4e27dcea489d0d023da179e2c7989fba6c080e6dca0ec8ab836ee3718a7fa')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=arm64;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=amd64; fi

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source
  
  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  # cargo build --frozen --release --all-features

  cd "Flying Carpet/src-tauri"
  cargo tauri build -b deb --ci -- --frozen --all-features
}

# check() {
#   _source
# 
#   cd "${srcdir}/${_pkgsrc}"
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  # install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  cd "Flying Carpet/src-tauri/target/release/bundle/deb/${_name}_"*"_${_arch}"
  cp -vaT --no-preserve=ownership "data" "${pkgdir}"
}
