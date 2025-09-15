# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=neur0map
_pkgname=manx
pkgname=${_pkgname}
pkgver=0.5.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Blazing-fast CLI tool for developers to find documentation, code snippets, and answers instantly"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

options=('!lto')
provides=("${_pkgname}")

makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'openssl')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c22c8abb64d56342f2fc6ea0ad6b4558c3c2a1c5fa25b3509a3e3664fb6da45a')

case "${CARCH}" in
  x86_64|i686|aarch64)
    _target="${CARCH}-unknown-linux-gnu" ;;
  arm)
    _target="${CARCH}-unknown-linux-gnueabi" ;;
    *)
    printf 'Architecture %s is not supported\n' "${CARCH}" >&2
    exit 1 ;;
esac


prepare() {
  cd "${pkgname}-${pkgver}" || exit

  cargo fetch --manifest-path ./Cargo.toml --target "${_target}"
}


build() {
  cd "${pkgname}-${pkgver}" || exit

  CARGO_TARGET_DIR='target' RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix ${srcdir}=src" cargo build --manifest-path ./Cargo.toml --frozen --release
}


package() {
  cd "${pkgname}-${pkgver}" || exit

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "docs/about_manx.md" "${pkgdir}/usr/share/doc/${pkgname}/ABOUT.md"
  install -Dm644 "docs/AI_FEATURES.md" "${pkgdir}/usr/share/doc/${pkgname}/AI_FEATURES.md"
  install -Dm644 "docs/COMMANDS.md" "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.md"
  install -Dm644 "docs/CONFIGURATION.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"
  install -Dm644 "docs/EMBEDDING_SETUP.md" "${pkgdir}/usr/share/doc/${pkgname}/EMBEDDING_SETUP.md"
  install -Dm644 "docs/NEURAL_SEARCH.md" "${pkgdir}/usr/share/doc/${pkgname}/NEURAL_SEARCH.md"
  install -Dm644 "docs/RAG_GUIDE.md" "${pkgdir}/usr/share/doc/${pkgname}/RAG_GUIDE.md"
  install -Dm644 "docs/SETUP_GUIDE.md" "${pkgdir}/usr/share/doc/${pkgname}/SETUP_GUIDE.md"
  install -Dm644 "docs/SIMPLE_EMBEDDING_SETUP.md" "${pkgdir}/usr/share/doc/${pkgname}/SIMPLE_EMBEDDING_SETUP.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
