# Maintainer: Jozef Riha <jose1711@gmail.com>
# Contributor: karnath
pkgname=logintop10
pkgver=1.9
pkgrel=3
pkgdesc="Command-line utility that creates several top-10 lists from the wtmp (usually in /var/log/) on your system"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.vanheusden.com/logintop10/"
source=(http://www.vanheusden.com/logintop10/logintop10-${pkgver}.tgz
        locale_path.patch)
depends=('glibc')
install=$pkgname.install
md5sums=('e816ad4eb9f18b0f779241df1c4d971a'
         '35db8797752b55042e5b4f28b14c40b1')

prepare() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p0 < ${srcdir}/locale_path.patch 
}

build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i "/LOCALE_PATH/s/\b\/local\b//" Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/{bin,share/locale/{nl,fr,es,ar,de}/LC_MESSAGES,share/man/man1}
  for lang in nl fr es ar de
  do
    install -Dm644 logintop10-${lang}.mo ${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/logintop10.mo
  done
  install -Dm644 logintop10.1 ${pkgdir}/usr/share/man/man1/logintop10.1
  gzip -9 ${pkgdir}/usr/share/man/man1/logintop10.1
  install -Dm755 logintop10 ${pkgdir}/usr/bin/logintop10
}
