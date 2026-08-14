# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="FlyingCarpet"
pkgname="flying-carpet"
pkgver=10.0.1
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
declare -Ag _arch=(
  ['aarch64']='arm64'
  ['x86_64']='amd64'
)
arch=(
  "${!_arch[@]}"
)
url="https://github.com/spieglt/${_name}"
license=(
  'GPL-3.0-only'
)
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
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
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('d1cdca0755e4814ddcdb69d7f1d23079211be045863df4f389e5d03390a2a2575f9b7fee66cf0aa687e824048edc351bdb9dbe07b20e4411a6e9b572e9043a80')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source
  
  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}/Flying Carpet/src-tauri"
  cargo tauri build -b deb --ci -- --frozen --all-features
}

# check() {
#   _source
# 
#   cd "${srcdir}/${_pkgsrc}"
#   cargo test --frozen --all-features
# }

package() {
  _source

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "Flying Carpet/src-tauri/${CARGO_TARGET_DIR}/release/bundle/deb/FlyingCarpet_${pkgver}_${_arch[${CARCH}]}"
  cp -vaT --no-preserve=ownership "data" "${pkgdir}"
}
