# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.28.2
pkgrel=2
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
        "https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}-SHA-256.txt"{,.asc}
        "${pkgname}-fix-precompiled-header-build-error.patch")
sha512sums=('225f6d3eb56d41c449a32f7c3e0f8f3ffafbbf45474e29ad86e965a87f8d95e55e87affc62ef0a7b25c9fb070c6fca08e9838539e5f7011dc3ee83787025151b'
            '7337877f928b22e227e27c7ceff10b953c008ad35ee532d83290db3844f46607f79d48931676ad5203147bae4b2caec0520b146c4a2949db94da0b2ed85a0990'
            'SKIP'
            '87aefe0798af3729001bd91db681d0d5d4ee555cba5b6b1c01f8168f9ec8055476afe280038dc906905a4a1caed960a467f2639cdd7038ea266872294c477c1c')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

prepare() {
  # upstream does not provide signed tarballs, only signed checksums
  sha256sum -c --ignore-missing "${pkgname}-${pkgver}-SHA-256.txt"

  cd ${pkgname}-${pkgver}
  # Fixes regression of 3.28.2 that causes unity-related builds to fail,
  # see for instance blender
  # https://projects.blender.org/blender/blender/commit/cf4365e555a759d5b3225bce77858374cb07faad
  # Relevant upstream issue is
  # https://gitlab.kitware.com/cmake/cmake/-/issues/25650
  patch -Np1 -i ../${pkgname}-fix-precompiled-header-build-error.patch
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
