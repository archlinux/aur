# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.27.6
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
sha512sums=('268b5bd84800c37ce0e311cadf13c275a538d612844cc8687107549fe6341a6c3115560e3b9162836843016213d225f62db130bc251bf8aff50c69b9bd58e638'
            '46c5536d7b8d8b08f97a7352d89df8c12ee9c3b28cd49bd29f91d6136bdb56481f93eb2ceb9c0391dc1284c43f36f384f7b749483b64aebb4f84c6a2cd9077d5'
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
