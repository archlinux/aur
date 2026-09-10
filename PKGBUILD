pkgname=python-pdf-inspector
pkgver=1.19.0
pkgrel=1
pkgdesc="Python bindings for PDF classification and Markdown extraction with OCR"
arch=('x86_64' 'aarch64')
url="https://github.com/firecrawl/pdf-inspector"
license=('MIT' 'BSD-3-Clause')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'python')
makedepends=('cargo' 'python-build' 'python-installer' 'python-maturin')
optdepends=('libpdfium: PDF page rendering for OCR'
            'onnxruntime>=1.27.0: CPU OCR inference')
# The ring dependency cannot link with GCC LTO.
options=('!debug' '!lto')
source=("pdf-inspector-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c39940101c86e64f52199102522beea5a6f846adbf5c98a185bc818b5c8cef9f')

prepare() {
  cd "pdf-inspector-${pkgver}"
  # Load installed CMaps instead of files in the build directory.
  sed -i 's|Path::new(env!("CARGO_MANIFEST_DIR"))|Path::new("/usr/share/python-pdf-inspector")|; /\.join("external")/d' src/tounicode.rs
  cargo fetch
}

build() {
  cd "pdf-inspector-${pkgver}"
  CARGO_NET_OFFLINE=true python -m build --wheel --no-isolation \
    --config-setting="build-args=--locked --compatibility linux"
}

package() {
  cd "pdf-inspector-${pkgver}"
  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
  install -Dm644 external/bcmaps/*.bcmap -t "${pkgdir}/usr/share/${pkgname}/bcmaps/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 external/bcmaps/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-bcmaps"
  install -Dm644 docs/ocr-runtime.md "${pkgdir}/usr/share/doc/${pkgname}/ocr-runtime.md"
}
