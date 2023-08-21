pkgname=motionplus-git
_srcdir=${pkgname%-git}
pkgver=0.1.0.r44.gc001cff
pkgrel=1
pkgdesc="Monitor and record video signals from many types of cameras"
arch=('x86_64')
license=('GPL')
url="https://github.com/Motion-Project/motionplus"
depends=('sqlite' 'ffmpeg' 'libmicrohttpd' 'libwebp' 'postgresql-libs' 'mariadb-libs')
optdepends=('gettext: native language support')
backup=('etc/motionplus/motionplus.conf')
source=("git+https://github.com/Motion-Project/motionplus"
        'motionplus.service')
b2sums=('SKIP'
        'baf8c1cd1b742b834e3faa45315d7187e89d2e439751ee8a99fbde117fd504830d5990540be96c9672ec03efdc9c8fd2b87bd507ab74fe73a30cf16826a3f4f6')

pkgver() {
  cd "$_srcdir"
  git describe --long --tags --abbrev=7 | sed -e 's/^release-//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_srcdir

  export TEMP_LDFLAGS="$LDFLAGS"
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package(){
  cd $_srcdir
  make DESTDIR="$pkgdir" install
  install -Dm644 data/motionplus-dist.conf "$pkgdir"/etc/motionplus/motionplus.conf
  install -Dm644 "$srcdir"/motionplus.service "$pkgdir"/usr/lib/systemd/system/motionplus.service
}
