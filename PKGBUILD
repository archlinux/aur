# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
pkgname=lyx
pkgver=2.5.0
pkgrel=1
pkgdesc="An advanced WYSIWYM document processor & LaTeX front-end"
arch=(x86_64)
url="https://www.${pkgname}.org"
depends=(qt6-svg python imagemagick enchant hunspell libmythes
  file hicolor-icon-theme desktop-file-utils)
makedepends=(boost bc)
optdepends=('rcs: built-in version control system'
  'texlive-latexextra: float wrap support'
  'python: support for python scripts')
license=(GPL-2.0-or-later)
backup=('etc/lyx/lyxrc.dist')
options=('emptydirs' '!lto')
source=(https://ftp.lip6.fr/pub/${pkgname}/stable/${pkgver::4}x/${pkgname}-${pkgver}.tar.gz{,.sig}
	lyxrc.dist
  qt6.patch::https://codeberg.org/LyX-org/${pkgname}/commit/e98b6ad533360500528b48043e20c79f5cb67b07.patch)
validpgpkeys=('FE66471B43559707AFDAD955DE7A44FAC7FB382D') # LyX Release Manager (Signing LyX tarballs and binaries) <sanda@lyx.org>
sha512sums=('5f8ceb88425e371890456f717ca5120d99670398fcf6baf5f30b38383ab6ab9401f722963de99566bc9bc0b84c1e8ed3b3ca113247da514da69322747e65deb9'
            'SKIP'
            'eef777cf6033a7b1e04700f33068b07309f8d5c6931c16927305dafb3a00fd46d4b536149349ab56b7455e7dea195c8889da2b6fbf9caa9e76bc0557f9358bc3'
            '35bca413ecf098d3665c10617cb8e12854fc7d9668bc3bf7671e04abbffa3fddc04fcdd934abed47a491a1ba602779d3063151a0a54537ab684dd3aadf008026')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../qt6.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-qt6 \
    --without-included-boost \
    --without-included-mythes
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install default config file
  install -Dm644 "${srcdir}/lyxrc.dist" "${pkgdir}/etc/lyx/lyxrc.dist"
  ln -sf /etc/lyx/lyxrc.dist "${pkgdir}/usr/share/lyx/lyxrc.dist"
}
