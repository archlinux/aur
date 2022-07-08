# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icecast-git
pkgver=2.5.0.beta.3.r1.g4628ee97
pkgrel=1
pkgdesc="A streaming media (audio/video) server"
arch=('i686' 'x86_64')
url="https://www.icecast.org/"
license=('GPL2')
depends=('glibc' 'curl' 'libxslt' 'libtheora' 'libvorbis' 'speex' 'libkate')
makedepends=('git')
provides=("icecast=$pkgver")
conflicts=('icecast')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=("git+https://gitlab.xiph.org/xiph/icecast-server.git"
        "icecast.logrotate::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/icecast/trunk/icecast.logrotate"
        "icecast.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/icecast/trunk/icecast.service"
        "icecast.sysusers::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/icecast/trunk/icecast.sysusers"
        "icecast.tmpfiles::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/icecast/trunk/icecast.tmpfiles")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "icecast-server"

  sed -i 's|url = \.\.|url = https://gitlab.xiph.org/xiph|' ".gitmodules"
  git submodule sync
  git submodule update --init --recursive
}

pkgver() {
  cd "icecast-server"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "icecast-server"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --localstatedir="/var"
  make
}

package() {
  cd "icecast-server"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/icecast.logrotate" "$pkgdir/etc/logrotate.d/icecast"
  install -Dm644 "$srcdir/icecast.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/icecast.sysusers" "$pkgdir/usr/lib/sysusers.d/icecast.conf"
  install -Dm644 "$srcdir/icecast.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/icecast.conf"
}
