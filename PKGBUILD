# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=libtomcrypt
pkgver=1.18.0
pkgrel=1
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
arch=('i686' 'x86_64')
url="http://www.libtom.net/LibTomCrypt/"
license=('custom:PublicDomain')
depends=('libtommath' 'gmp')
source=("https://github.com/libtom/${pkgname}/releases/download/v${pkgver}/${pkgname#libtom}-${pkgver}.tar.xz"{,.asc})
sha256sums=('da9df56a314afaab71963aa71bb6a075ea6bdee3d4db4af045f6bfe23e88b87a'
            'SKIP')
validpgpkeys=('C4386A237ED43A475541B9427B2CD0DD4BCFF59B') # Steffen Jaeckel <s_jaeckel@gmx.de>

build() {
  cd "${pkgname}-${pkgver}"

  export CPPFLAGS+=" -DLTM_DESC -DGMP_DESC -DUSE_LTM"
  export EXTRALIBS="-ltommath -lgmp"
  make -f makefile.shared IGNORE_SPEED=1 library test
}

check() {
  cd "${pkgname}-${pkgver}"
  ./test
}

package() {
  cd "${pkgname}-${pkgver}"

  make -f makefile.shared DESTDIR="${pkgdir}" PREFIX="/usr" INSTALL_GROUP="root" INSTALL_OPTS="" install

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
