# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
pkgname=lyx
pkgver=2.5.1
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
source=(https://ftp.lip6.fr/pub/${pkgname}/stable/${pkgver::4}x/${pkgname}-${pkgver}.tar.xz{,.sig}
	lyxrc.dist)
validpgpkeys=('FE66471B43559707AFDAD955DE7A44FAC7FB382D') # LyX Release Manager (Signing LyX tarballs and binaries) <sanda@lyx.org>
sha512sums=('77c3bd1deeb2c6d174d21ee9620654ac82d0695fbeba22b653819129d2d27f2a999e28cdff444c1e9fd64a0a7fae5ce0effa69818bce2aea1b708f7a27858e54'
            'SKIP'
            'eef777cf6033a7b1e04700f33068b07309f8d5c6931c16927305dafb3a00fd46d4b536149349ab56b7455e7dea195c8889da2b6fbf9caa9e76bc0557f9358bc3')

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
