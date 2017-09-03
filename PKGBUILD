# Maintainer: jackos2500 <jackos1998 at gmail dot com>
pkgname=ntopng-git
_pkgname=ntopng
pkgver=3.0.r307.gc4789741
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686' 'armv7h')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'geoip' 'libmariadbclient' 'json-c')
makedepends=('git' 'glib2' 'automake' 'libtool' 'geoip' 'libpcap' 'wget' 'libxml2' 'sqlite' 'curl' 'libmariadbclient')
provides=('ntopng')
conflicts=('ntopng')
source=("git+https://github.com/ntop/nDPI" "git+https://github.com/ntop/ntopng" "ntopng.service" "ntopng.conf")

sha256sums=('SKIP'
            'SKIP' 
            'f2269843460307ef58037fa1a194c26650ced0f1d194fb9af6817917b109fe8c'
            '8ec08499b1783c3e933429a3a9a4d0d32fb903bbd0b7c3fef82f0233748e3737')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nDPI"
  ./autogen.sh
  make

  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make geoip
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/man $pkgdir/usr/share/
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m644 "$srcdir/ntopng.service" "$pkgdir/usr/lib/systemd/system"
  mkdir -p $pkgdir/etc
  install -m644 "$srcdir/ntopng.conf" "$pkgdir/etc"
}
