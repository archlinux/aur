# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=spcuuid
_pkgname=SPCUUID
pkgver=1.2.5
pkgrel=1
pkgdesc="Implements an API to generate RFC-4122 style UUIDs"
arch=('i686' 'x86_64')
url="https://github.com/spc476/SPCUUID"
license=('LGPL')
depends=('lua51' 'openssl')
source=(https://github.com/spc476/SPCUUID/archive/${pkgver}.tar.gz)
md5sums=('82005848432d957048e759e9734503c2')
sha256sums=('f9b5a5c738b71732eb1e5a7cfc952884d9828e62f86b29297c48c0b587ba4591')
sha384sums=('9df3e14cb9310358faa9ea78d636864e71ca47312e8820103f0a14fdbaa6eccb83652f84543e80aa373eb15e4afaf957')
sha512sums=('ca917e2423fedd09a5c4308e13d6f50dc3c650e108ac55192d6a920cf9504ca8f1084a82b8a0939c9a5848ce889b86ba008582a70f3f86168a94c257266a1d5b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # build a shared object instead of static library
  sed 's/libspcuuid.a/libspcuuid.so/g' -i Makefile
  sed 's/$(CC) $(CFLAGS) -c -o $@ $</$(CC) $(SHARED) $(CFLAGS) -c -o $@ $</g' -i Makefile
  sed 's/$(AR) rscu $@ $?/$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)/g' -i Makefile

  # install to /usr instead of /usr/local
  sed 's#/usr/local#/usr#g' -i Makefile

  make lua
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-lua
}

