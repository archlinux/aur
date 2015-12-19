# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=tvheadend-git
_gitname='tvheadend-git'
pkgver=4.1.r1235.gd822a74
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://tvheadend.org/"
license=('GPL3')
depends=('avahi' 'openssl' 'python2' 'uriparser' 'ffmpeg' 'linuxtv-dvb-apps')
makedepends=('git')
optdepends=('xmltv: For an alternative source of programme listings')
provides=('tvheadend')
conflicts=('tvheadend' 'hts-tvheadend' 'hts-tvheadend-svn' 'tvheadend-git')
install=tvheadend.install

source=("${_gitname}::git+https://github.com/tvheadend/tvheadend.git#branch=master"
	'tvheadend.service')

md5sums=('SKIP'
         'b546f4486f0d28bea13ad1fb676acb27')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    ./configure --prefix=/usr --mandir=/usr/share/man/man1 --python=python2 --release --enable-libsystemd_daemon
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="$pkgdir/" install
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}

