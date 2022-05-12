# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=lyx
pkgver=2.3.6.1
pkgrel=6
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
arch=('x86_64')
url="https://www.lyx.org"
depends=('qt5-svg' 'texlive-core' 'python' 'imagemagick' 'enchant' 'hunspell'
  'libmythes' 'file' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('boost' 'bc')
optdepends=('rcs: built-in version control system'
  'texlive-latexextra: float wrap support'
  'python: support for python scripts')
license=('GPL')
backup=('etc/lyx/lyxrc.dist')
options=('emptydirs')
source=(https://ftp.lip6.fr/pub/lyx/stable/2.3.x/lyx-$pkgver.tar.gz{,.sig}
  lyxrc.dist)
validpgpkeys=('FE66471B43559707AFDAD955DE7A44FAC7FB382D') # LyX Release Manager (Signing LyX tarballs and binaries) <sanda@lyx.org>
sha512sums=('b2f24d32c3716144fc19a5187d59dce86c718e9180b3b33826a04477c5deeed8238c31e0569b8c218164726ab10b66c76c22dc7e0610ca18a7b7e651a3525cbd'
  'SKIP'
  'eef777cf6033a7b1e04700f33068b07309f8d5c6931c16927305dafb3a00fd46d4b536149349ab56b7455e7dea195c8889da2b6fbf9caa9e76bc0557f9358bc3')

prepare() {
  # Expand the automake compatibility version
  sed -i 's/2.6\[5-9\]/2.7\[1-9\]/' "${pkgname}-${pkgver}"/autogen.sh
  # Add missing headers for work with GCC 12.1.0 or later
  sed -i '54 a #include <iterator>' "${pkgname}-${pkgver}"/src/lyxfind.cpp
  sed -i '45 a #include <cstring>' "${pkgname}-${pkgver}"/src/insets/InsetListings.cpp
}

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-qt5 \
    --without-included-boost \
    --without-included-mythes
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # install appdata
  install -Dm644 lib/appdata.xml "$pkgdir"/usr/share/metainfo/lyx.appdata.xml

  # install default config file
  install -Dm644 "${srcdir}/lyxrc.dist" "${pkgdir}/etc/lyx/lyxrc.dist"
  ln -sf /etc/lyx/lyxrc.dist "${pkgdir}/usr/share/lyx/lyxrc.dist"
}
