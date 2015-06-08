# Maintainer: Shalygin Konstantin (k0ste@opentech.ru)

pkgname='spice-xpi'
pkgver='2.8.90'
pkgrel='9'
pkgdesc='XPI client for interacting with SPICE servers. This package contains a mozilla browser client for interacting with SPICE servers.'
arch=('any')
url='http://spice-space.com/'
license=('GPL')
depends=('firefox' 'spice')
provides=('browser-plugin-spice')
conflicts=('browser-plugin-spice')
makedepends=('git' 'python2' 'xulrunner')
source=("git://anongit.freedesktop.org/spice/spice-xpi"
	"git://anongit.freedesktop.org/spice/spice-protocol")
sha256sums=('SKIP'
	    'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | python2 -c "import sys; print sys.stdin.read().split('-')[2]"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.spice-protocol.url "$srcdir/spice-protocol"
  git submodule update
  ./autogen.sh
  make clean
}

build() {
  cd "$srcdir/$pkgname"
  
  PYTHON=/usr/bin/python2 \
  ./configure \
  --prefix=/usr \
  --sbindir=/usr/bin \
  --bindir=/usr/bin \
  --sysconfdir=/etc \
  --localstatedir=/var/lib \
  --enable-xpi
  make
}

package() {
  pushd "$srcdir/$pkgname"
  make DESTDIR="$srcdir/xpi-temp" install
  popd
  install -Dm 755 "$srcdir/xpi-temp/usr/lib/mozilla/plugins/npSpiceConsole.so" "$pkgdir/usr/lib/mozilla/plugins/npSpiceConsole.so"
}
