# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=libtomcrypt
pkgver=1.18.0rc5
_pkgver="${pkgver/rc/-rc}"
pkgrel=1
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
arch=('i686' 'x86_64')
url="http://www.libtom.net/LibTomCrypt/"
license=('custom:PublicDomain')
depends=('libtommath' 'gmp')
source=("https://github.com/libtom/${pkgname}/releases/download/v${_pkgver}/${pkgname#libtom}-${_pkgver}.tar.xz"{,.asc})
sha256sums=('55af6a820e7be83efb99a39a98eb005c188655078e4c1683b4099d89e415ec55'
            'SKIP')
validpgpkeys=('C4386A237ED43A475541B9427B2CD0DD4BCFF59B') # Steffen Jaeckel <s_jaeckel@gmx.de>

build() {
  cd "${pkgname}-${_pkgver}"

  export CPPFLAGS+=" -DLTM_DESC -DGMP_DESC -DUSE_LTM"
  export EXTRALIBS="-ltommath -lgmp"
  make -f makefile.shared IGNORE_SPEED=1 library test
}

check() {
  cd "${pkgname}-${_pkgver}"
  ./test
}

package() {
  cd "${pkgname}-${_pkgver}"

  make -f makefile.shared DESTDIR="${pkgdir}" PREFIX="/usr" INSTALL_GROUP="root" INSTALL_OPTS="" install

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
