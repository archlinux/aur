# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="flying-carpet"
pkgver=8.0.2
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi"
arch=('x86_64' 'aarch64')
url="https://github.com/spieglt/FlyingCarpet"
license=('GPL-3.0-only')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libsoup' 'webkit2gtk')
makedepends=('cargo' 'cargo-tauri')
replaces=('flyingcarpet-cli')
_pkgsrc="FlyingCarpet-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c1cac65eb4697151c11068f6a6de77f147c45c803e4980882e2cf36e43058786c0d430766208aba6fbf8272df7e98dd61cf64d790aee4553f9781df6b5ad90e1')

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

  cd "Flying Carpet/src-tauri/target/release/bundle/deb/${pkgname}_"*"/data/usr"
  find "bin"   -type f -exec install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;
}
