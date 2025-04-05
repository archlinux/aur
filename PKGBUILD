# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="FlyingCarpet"
pkgname="flying-carpet"
pkgver=9.0.3
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=('x86_64' 'aarch64')
url="https://github.com/spieglt/${_name}"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'cargo-tauri')
replaces=('flyingcarpet-cli')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('193d3302cdc59a96ec7a6201befbbb6dd96f614ea19e2afaeb449fd0cb7361366743c122196010b953bdd91a731c7f615f723b7cfff873e78bc834e04231f177')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # cargo build --frozen --release --all-features

  cd "Flying Carpet/src-tauri"
  cargo tauri build -b deb --ci -- --frozen --all-features
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  # install -vDm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  cd "Flying Carpet/src-tauri/target/release/bundle/deb/${_name}_"*"/data/usr"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
