# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Allan Henriksen <allan.henriksen@gmail.com>

pkgname=ipsec-tools
pkgver=0.8.2
pkgrel=9
pkgdesc="KAME IPSec tools ported to Linux"
arch=('x86_64')
url="http://ipsec-tools.sourceforge.net/"
depends=('readline' 'openssl' 'krb5' 'flex')
makedepends=('linux-headers')
license=('GPL')
options=('!makeflags')
source=(https://downloads.sourceforge.net/sourceforge/ipsec-tools/$pkgname-$pkgver.tar.bz2
	racoon.service
	ipsec.service
	ipsec-tools-linux-3.7-compat.patch
	ipsec-tools-openssl-1.1.patch)
sha256sums=('8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d'
            '721ef004a93d16ce1e0c4c6951d65b8bf9bfe0e101d1b9b0756dd7c349e2ccc0'
            '2f10696f93aa0e88fa623318644f42332118dee4c3666948a12eb2fa108e2665'
            '34529108d013f5ad6dce9fa8e2acec7367f29319e4049e82dcb54fb0970ff520'
            'c88edf2f09c1b58d5e453d42381596775478de6a52f94adee521c75298fc474c')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/ipsec-tools-linux-3.7-compat.patch
  patch -p1 <"$srcdir"/ipsec-tools-openssl-1.1.patch
  sed -i 's#-Werror##' configure.ac
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
	--enable-security-context=no --enable-hybrid --enable-dpd --enable-natt \
	--enable-adminport --enable-gssapi \
	--with-kernel-headers=/usr/include
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/racoon.service "$pkgdir"/usr/lib/systemd/system/racoon.service
  install -Dm0644 "$srcdir"/ipsec.service "$pkgdir"/usr/lib/systemd/system/ipsec.service
}
