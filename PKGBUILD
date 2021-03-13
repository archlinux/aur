# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Kristóf Marussy <kristof@marussy.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=delegate
pkgver=9.9.13
pkgrel=4
pkgdesc="Caching and converting multyprotocol proxy. For example, you may use it as NNTP web interface"
arch=('x86_64')
url="http://www.delegate.org/"
license=('GPL')
depends=('libnsl' 'pam')
optdepends=('openssl-1.0: TLS support' 'zlib: Zlib support')
options=(strip)
install=delegate.install
source=(ftp://ftp:ps790809%40inbox%2Eru@ftp.delegate.org/pub/DeleGate/delegate$pkgver.tar.gz
	ssl3.patch
	readycc.patch) # Patch from https://stackoverflow.com/a/62457597 by SatoxITS (author of delegate)
sha384sums=('3118c948643431c9cd232091a23ad6eca05fbe32c42537d3e8178cebce4a4916e51544874c19b509a4f5158d00198932'
            '589f1c9c086340d4e5b3d111b176925951a656007495aed0100d7cd7c5051cfb8800f4283a01cfbb2de6e78baea6472a'
            '6f549bedaa8bb840759ab043aa9e71befd40841b440d3d5ba78a1a3efe3449038064883def995af82508da2c2cbab62c')

prepare() {
  cd "$srcdir"/$pkgname$pkgver
  patch -p1 <"$srcdir"/ssl3.patch
  patch -p1 <"$srcdir"/readycc.patch
}

build() {
  cd "$srcdir"/$pkgname$pkgver
  make ADMIN="root@localhost" CFLAGS="$CFLAGS -Wno-narrowing"
}

package() {
  cd "$srcdir"/$pkgname$pkgver

  install -D -m0755 src/delegated "$pkgdir"/usr/bin/delegated

  install -D -m0755 subin/dgbind "$pkgdir"/usr/bin/dgbind
  install -D -m0755 subin/dgchroot "$pkgdir"/usr/bin/dgchroot
  install -D -m0755 subin/dgcpnod "$pkgdir"/usr/bin/dgcpnod
  install -D -m0755 subin/dgpam "$pkgdir"/usr/bin/dgpam

  install -D -m0644 doc/Manual.htm "$pkgdir"/usr/share/delegate/manual.htm
  install -D -m0644 doc/tutor-en.htm "$pkgdir"/usr/share/delegate/tutor-en.htm
}
