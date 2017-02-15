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
  # Fix recursive make
  sed -i -e 's/make -f/$(MAKE) -f/' makefile.shared
  # Pass CPPFLAGS for aes_enc.o
  sed -i -e 's/-DENCRYPT_ONLY/$(CPPFLAGS) \0/' makefile.shared
}

build() {
  cd "${pkgname}-${pkgver}"

  CPPFLAGS+=" -DLTM_DESC -DGMP_DESC" \
  EXTRALIBS="${LDFLAGS} -ltommath -lgmp" \
  make -f makefile.shared IGNORE_SPEED=1
}

check() {
  cd "${pkgname}-${pkgver}"

  CPPFLAGS+=" -DLTM_DESC -DUSE_LTM -I./testprof" \
  EXTRALIBS="${LDFLAGS} -L./.libs -L./testprof/.libs \
    '-Wl,--rpath,\$\${ORIGIN}/.libs:\$\${ORIGIN}/testprof/.libs'" \
  make -f makefile.shared test IGNORE_SPEED=1
  ./test
}

package() {
  cd "${pkgname}-${pkgver}"

  make -f makefile.shared DESTDIR="${pkgdir}" INSTALL_GROUP="root" install

  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
