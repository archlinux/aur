# Maintainer: saleh <salehjamaligolzar@gmail.com>
pkgname=docscan
pkgver=0.2.0
pkgrel=1
pkgdesc='Turn photos of documents into clean, straight PDF pages, like Microsoft Lens'
arch=('x86_64' 'aarch64')
url='https://github.com/salehjg/docscan'
license=('GPL-3.0-or-later' 'MIT')
depends=('opencv' 'texlive-basic' 'curl' 'openssl' 'gcc-libs' 'glibc')
makedepends=('cmake' 'cli11')
checkdepends=('catch2')
_uvdoc=4c9b82b537057aff2526e6dd118a847cdd072e82
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "uvdoc-${_uvdoc::7}.pkl::https://github.com/tanguymagne/UVDoc/raw/$_uvdoc/model/best_model.pkl")
sha256sums=('90c8a79d24c47e5327a70b610d8167a102a335ddb745d2685ac964735f9b9d79'
            '7e90861b8a516eb4bc51f84bd889cb77275743d2d1d3ca8091951ec9f2b7da23')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDOCSCAN_UVDOC_MODEL="$srcdir/uvdoc-${_uvdoc::7}.pkl"
  cmake --build build
}

check() {
  cmake -B build -S "$pkgname-$pkgver" -DDOCSCAN_BUILD_TESTS=ON
  cmake --build build
  DOCSCAN_UVDOC_MODEL="$srcdir/uvdoc-${_uvdoc::7}.pkl" ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/third_party/UVDoc/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/UVDoc-LICENSE"
}
