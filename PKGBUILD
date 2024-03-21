# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.29.0
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'hicolor-icon-theme' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash' 'cppdap')
makedepends=('qt6-base' 'python-sphinx' 'emacs' 'nlohmann-json')
optdepends=(
  'make: for unix Makefile generator'
  'ninja: for ninja generator'
  'qt6-base: cmake-gui'
)
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
        "https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}-SHA-256.txt"{,.asc})
sha512sums=('abcca7a4db221d98864b77220445f0b70f87149626d3162ed49636862b87514b2640318438c0c711bfaafa1aba4d049b55f98e6ac28c44545543986c35fbd062'
            '9a33a74a799e0ae4464a3b084b94617734b36bed2ed70260a0700bd2e8f846b6cddb279d8fa91488b08d29b14ad34d45dcea01afabc720f57a9c90e7700aa205'
            'SKIP')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

prepare() {
  # upstream does not provide signed tarballs, only signed checksums
  sha256sum -c --ignore-missing "${pkgname}-${pkgver}-SHA-256.txt"
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --datadir=/share/cmake \
    --sphinx-man \
    --sphinx-html \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
