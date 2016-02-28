# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=bglibs
pkgver=2.03
pkgrel=1
pkgdesc="BG Libraries Collection"
arch=('i686' 'x86_64')
url="http://untroubled.org/bglibs"
license=('LGPL')
depends=('perl')
source=("http://untroubled.org/bglibs/archive/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "disable-selftests.patch")
validpgpkeys=('D0B7C8DD365DA39529DA2E2AE96FB2DC699980E8')
md5sums=('dd783759f5f965db82b073c77641b2fa'
         'SKIP'
         '624dca4aff06eb026be80b7826eae441')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Apparently the selftests rely on resources from the internet that have
  # changed since the tests were created
  patch -Np1 < "${srcdir}/disable-selftests.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo "/usr/bin" > conf-bin
  echo "/usr/include" > conf-include
  echo "/usr/lib" > conf-lib
  echo "/usr/share/man" > conf-man
  sed -i "1s/\$/ $(echo -n $CFLAGS | sed 's/[\/&]/\\&/g')/" conf-cc
  sed -i "1s/\$/ $(echo -n $LDFLAGS | sed 's/[\/&]/\\&/g')/" conf-ld
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  install_prefix="${pkgdir}" make install
}

# vim: ts=2 sw=2 et ft=sh
