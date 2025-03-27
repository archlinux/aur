# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="FlyingCarpet"
pkgname="flying-carpet"
pkgver=9.0.0
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
b2sums=('2d3dd275cfb1d861246b65267ef4ae8d5ff813fd6762f1ec13c42a0abc670423d8d06eda29d1979344ff7d0aaad86410ebe6eef810d626183e1422565bb4449f')

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
