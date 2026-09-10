pkgname=pdf-inspector
pkgver=1.19.0
pkgrel=1
pkgdesc="Native CLI tools for PDF classification and Markdown extraction"
arch=('x86_64' 'aarch64')
url="https://github.com/firecrawl/pdf-inspector"
license=('MIT' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c39940101c86e64f52199102522beea5a6f846adbf5c98a185bc818b5c8cef9f')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Load installed CMaps instead of files in the build directory.
  sed -i 's|Path::new(env!("CARGO_MANIFEST_DIR"))|Path::new("/usr/share/pdf-inspector")|; /\.join("external")/d' src/tounicode.rs
  cargo fetch
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --offline --bin pdf2md --bin detect-pdf
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/pdf2md "${pkgdir}/usr/bin/pdf2md"
  install -Dm755 target/release/detect-pdf "${pkgdir}/usr/bin/detect-pdf"
  install -Dm644 external/bcmaps/*.bcmap -t "${pkgdir}/usr/share/${pkgname}/bcmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 external/bcmaps/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-bcmaps"
}
