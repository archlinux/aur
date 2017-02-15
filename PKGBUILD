# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=libtomcrypt
pkgver=1.17
pkgrel=14
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
arch=('i686' 'x86_64')
url="http://www.libtom.net/LibTomCrypt/"
license=('custom:PublicDomain')
depends=('libtommath' 'gmp')
source=("https://github.com/libtom/${pkgname}/releases/download/${pkgver}/${pkgname#libtom}-${pkgver}.tar.bz2")
sha256sums=('e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Fix permissions on header files
  sed -i -e '/$(HEADERS)/s/install/\0 -m 0644/' makefile.shared
}

build() {
  cd "${pkgname}-${pkgver}"

  export CFLAGS+=" -DLTM_DESC -DGMP_DESC"
  export EXTRALIBS="${LDFLAGS} -ltommath -lgmp"
  make -f makefile.shared
}

package() {
  cd "${pkgname}-${pkgver}"

  make -f makefile.shared DESTDIR="${pkgdir}" INSTALL_GROUP="root" install

  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
