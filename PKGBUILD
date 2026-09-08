pkgname=pdf-inspector-ocr
pkgver=1.18.0
pkgrel=1
pkgdesc="Native CLI tools for PDF classification and Markdown extraction with OCR"
arch=('x86_64' 'aarch64')
url="https://github.com/firecrawl/pdf-inspector"
license=('MIT' 'BSD-3-Clause')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'libpdfium' 'onnxruntime>=1.27.0')
makedepends=('cargo')
provides=("pdf-inspector=${pkgver}")
conflicts=('pdf-inspector')
# The ring dependency cannot link with GCC LTO.
options=('!debug' '!lto')
source=("pdf-inspector-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c90af30cfdb8fa0220b5b66bff4d2422847c33634e80bd046a9076bf409200b1')

prepare() {
  cd "pdf-inspector-${pkgver}"
  # Load installed CMaps instead of files in the build directory.
  sed -i 's|Path::new(env!("CARGO_MANIFEST_DIR"))|Path::new("/usr/share/pdf-inspector")|; /\.join("external")/d' src/tounicode.rs
  cargo fetch
}

build() {
  cd "pdf-inspector-${pkgver}"
  cargo build --release --locked --offline --features ocr --bin pdf2md --bin detect-pdf
}

package() {
  cd "pdf-inspector-${pkgver}"
  install -Dm755 target/release/pdf2md "${pkgdir}/usr/bin/pdf2md"
  install -Dm755 target/release/detect-pdf "${pkgdir}/usr/bin/detect-pdf"
  install -Dm644 external/bcmaps/*.bcmap -t "${pkgdir}/usr/share/pdf-inspector/bcmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 external/bcmaps/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-bcmaps"
  install -Dm644 docs/ocr-runtime.md "${pkgdir}/usr/share/doc/${pkgname}/ocr-runtime.md"
}
