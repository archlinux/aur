# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=motionplus
pkgver=0.2.0
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
b2sums=('196d6ea51cb76428986be84463616c4136c63de12eb9e2f0dd8b43dd37533cd6a83aef363441dd254fbcc2d3dd256589e8bda090e2861e2844a611a6ef17ff32'
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
