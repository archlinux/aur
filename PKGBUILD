# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=qgpgme-qt5
_pkgbase=gpgme
pkgver=1.23.2
pkgrel=4
pkgdesc="Qt5 bindings for GPGme"
arch=('x86_64')
url='https://www.gnupg.org/related_software/gpgme/'
license=('LGPL')
depends=('gpgme' 'qt5-base')
confligs=('qgpgme-qt6')
makedepends=(
  'gnupg'
  'libgpg-error'
  'qt5-base'
  'swig'
)
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
              'AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD') # Niibe Yutaka (GnuPG Release Key)
source=("https://www.gnupg.org/ftp/gcrypt/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224'
            'SKIP')

prepare() {
  cd ${_pkgbase}-${pkgver}/

  sed -i 's/-unknown//' autogen.sh
  autoreconf -fi
}

build() {
  cd ${_pkgbase}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-fd-passing \
    --disable-static \
    --disable-gpgsm-test \
    --enable-languages=cpp,qt5
  make
}

package() {
  cd ${_pkgbase}-${pkgver}/lang/qt

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/include
}
