# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
pkgname=lyx
pkgver=2.4.3
pkgrel=4
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
  file://qt6.patch
  file://gcc15.patch)
validpgpkeys=('FE66471B43559707AFDAD955DE7A44FAC7FB382D') # LyX Release Manager (Signing LyX tarballs and binaries) <sanda@lyx.org>
sha512sums=('e6e6f97a32ab14447321d375771947c1968a5ab4e2eceadbb302ae24316020d032b92ec30a07d638b15b8b9325587559a70bc79b29326cef35f82fa0e622e5fd'
            'SKIP'
            'eef777cf6033a7b1e04700f33068b07309f8d5c6931c16927305dafb3a00fd46d4b536149349ab56b7455e7dea195c8889da2b6fbf9caa9e76bc0557f9358bc3'
            '20864625e9e9787348f91a9a7b447fac2a83aad95e34b4cdb3cf870acf299b5230877f5a70bff2aeed7b646166889442d795496a0fe697c7fc191b2a0b6dc062'
            '322ac769fba06f9ef35b9d09d1095dea36cab9e88c6a54028564d7c6eb4b7bc7bf647b263dd9a304668ac8b84bcc8284f8620ae36aa60e953ce666f18aaa166f')

prepare() {
  cd ${pkgname}-${pkgver}
  # Fix compilation with GCC 15
  # https://git.lyx.org/gitweb/?p=lyx.git;a=patch;h=3337f487e107f9e445dd0807434cb4b4b06c959e
  patch -p1 -i ../gcc15.patch
  # Fix compilation with Qt 6.9
  # https://git.lyx.org/gitweb/?p=lyx.git;a=commitdiff;h=69f61f5301673b3df07153b56371eeb1d6e6af37
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
