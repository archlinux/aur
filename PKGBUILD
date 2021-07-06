# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icecast-git
pkgver=2.5.0.beta.2.r644.g2ef043de
pkgrel=1
pkgdesc="A streaming media (audio/video) server"
arch=('i686' 'x86_64')
url="https://www.icecast.org/"
license=('GPL2')
depends=('glibc' 'curl' 'libxslt' 'libtheora' 'libvorbis' 'speex' 'libkate')
makedepends=('git')
provides=('icecast')
conflicts=('icecast')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=("git+https://gitlab.xiph.org/xiph/icecast-server.git"
        "icecast.logrotate::https://github.com/archlinux/svntogit-community/raw/packages/icecast/trunk/icecast.logrotate"
        "icecast.service::https://github.com/archlinux/svntogit-community/raw/packages/icecast/trunk/icecast.service"
        "icecast.sysusers::https://github.com/archlinux/svntogit-community/raw/packages/icecast/trunk/icecast.sysusers"
        "icecast.tmpfiles::https://github.com/archlinux/svntogit-community/raw/packages/icecast/trunk/icecast.tmpfiles")
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
