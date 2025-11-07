# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="FlyingCarpet"
pkgname="flying-carpet"
pkgver=9.0.6
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=('aarch64' 'x86_64')
url="https://github.com/spieglt/${_name}"
license=('GPL-3.0-only')
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
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'cargo-tauri'
)
replaces=(
  'flyingcarpet-cli'
)
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2a82b89d2156f668e0949a363bcedbdbd45fff9363d907b7e1c3ea1f4c7cf978c0fd776b303ef08751479de2c45991c5e9921b35033dd70c9d41b2a0955ceca4')

if   [ "${CARCH}" = 'aarch64' ]; then _arch=arm64;
elif [ "${CARCH}" = 'x86_64'  ]; then _arch=amd64; fi

_srcenv() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _srcenv
  
  cd "${srcdir}/${_pkgsrc}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _srcenv

  cd "${srcdir}/${_pkgsrc}"
  # cargo build --frozen --release --all-features

  cd "Flying Carpet/src-tauri"
  cargo tauri build -b deb --ci -- --frozen --all-features
}

# check() {
#   _srcnev
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
