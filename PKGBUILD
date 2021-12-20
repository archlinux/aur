# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Clarence <xjh.azzbcc@gmail.com>
_pkgname=sofia-sip
pkgname=(${_pkgname}-fs ${_pkgname}-docs)
pkgver=1.13.6
pkgrel=1
pkgdesc="An open-source SIP User-Agent library (FreeSWITCH version)"
arch=('x86_64' 'i686')
url="https://github.com/freeswitch/sofia-sip"
makedepends=(doxygen)
license=('LGPL')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/freeswitch/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6f3cb48a35929abd3454087b32ad4c75fa5fe50fab8a9cc6f98559e6fd1bd64b')

prepare() {
  cd $_pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  # Fight unused direct deps
  sed -i -e "s/ -shared / $LDFLAGS\0 /g" libtool
  make
}

package_sofia-sip-fs() {
  depends=('glib2' 'openssl' 'gawk')
  optdepends=('sofia-sip-docs: Documentation')
  provides=('sofia-sip')
  conflicts=('sofia-sip')

  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

package_sofia-sip-docs() {
  arch=('any')
  pkgdesc="An open-source SIP User-Agent library documentation (FreeSWITCH version)"

  cd "$_pkgname-$pkgver"

  make doxygen
  install -dm755 "${pkgdir}/usr/share/doc/$_pkgname"
  cp -frv "libsofia-sip-ua/docs/html" "${pkgdir}/usr/share/doc/$_pkgname"
  cp -frv "libsofia-sip-ua-glib/docs/html" "${pkgdir}/usr/share/doc/$_pkgname"
  find "${pkgdir}/usr/share/doc/$_pkgname" -name "*.map" | xargs rm -fv
}
