# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>
pkgname=kmscon
pkgver=8
pkgrel=4
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=(x86_64)
url='http://www.freedesktop.org/wiki/Software/kmscon/'
license=('MIT')
depends=(systemd libdrm mesa libgl pango libxkbcommon xkeyboard-config libtsm)
makedepends=(libxslt docbook-xsl linux-api-headers)
source=(http://www.freedesktop.org/software/kmscon/releases/kmscon-${pkgver}.tar.xz)
md5sums=('90d39c4ef53a11c53f27be4a7e9acee4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e '302s/SIGUNUSED/SIGSYS/' src/pty.c
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/systemd/system"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  cp docs/kmscon{,vt@}.service "$pkgdir/usr/lib/systemd/system/"
}
