# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=motionplus
pkgver=0.1.1
pkgrel=3
pkgdesc="Monitor and record video signals from many types of cameras"
arch=('x86_64')
license=('GPL')
url="https://github.com/Motion-Project/motionplus"
depends=('sqlite' 'ffmpeg' 'libmicrohttpd' 'libwebp' 'postgresql-libs' 'mariadb-libs')
optdepends=('gettext: native language support')
backup=('etc/motionplus/motionplus.conf')
source=("https://github.com/Motion-Project/motionplus/archive/refs/tags/release-0.1.1.tar.gz"
        'motionplus.service')
b2sums=('7fcc10bc87948108141acb3f3b4d8ca1759b365c3a220e0eb8c0ff92cf0091e50737ac6a70ee0b18263f3c012b9ae197d026ece049fc2c79ff194b96fc9a8dfc'
        'baf8c1cd1b742b834e3faa45315d7187e89d2e439751ee8a99fbde117fd504830d5990540be96c9672ec03efdc9c8fd2b87bd507ab74fe73a30cf16826a3f4f6')

build() {
  cd $pkgname-release-$pkgver

  export TEMP_LDFLAGS="$LDFLAGS"
  autoreconf -fi
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package(){
  cd $pkgname-release-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 data/motionplus-dist.conf "$pkgdir"/etc/motionplus/motionplus.conf
  install -Dm644 "$srcdir"/motionplus.service "$pkgdir"/usr/lib/systemd/system/motionplus.service
}
