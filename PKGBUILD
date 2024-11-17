# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=motionplus
pkgver=0.2.2
pkgrel=1
pkgdesc='Monitor and record video signals from many types of cameras'
arch=(x86_64)
license=(GPL-3.0-or-later)
url='https://github.com/Motion-Project/motionplus'
depends=(
  sqlite
  ffmpeg
  libmicrohttpd
  libwebp
  postgresql-libs
  mariadb-libs
  libjpeg-turbo
  alsa-lib
  libpulse
  glibc
  gcc-libs
  fftw
)
optdepends=('gettext: native language support')
backup=('etc/motionplus/motionplus.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz"
        $pkgname.service)
b2sums=('0a1be21e97a88008e9002e9a54e6257681f1e3bbcd670319fec24aa1d4bb1bed94670fcc88380dd9fa57694531102c626d81eaa7f1dcfbf742d211da140bd571'
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

# vim:set ts=2 sw=2 et:
