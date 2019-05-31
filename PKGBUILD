# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icecast-git
pkgver=2.5.0.beta.2.r438.gde3a075
pkgrel=2
pkgdesc="A streaming media (audio/video) server"
arch=('i686' 'x86_64')
url="http://www.icecast.org/"
license=('GPL2')
depends=('glibc' 'curl' 'libxslt' 'libtheora' 'libvorbis' 'speex' 'libkate')
makedepends=('git')
provides=('icecast')
conflicts=('icecast')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=("git+https://gitlab.xiph.org/xiph/icecast-server.git"
        "icecast.logrotate::https://git.archlinux.org/svntogit/community.git/plain/trunk/icecast.logrotate?h=packages/icecast"
        "icecast.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/icecast.service?h=packages/icecast")
sha256sums=('SKIP'
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
  install -d -g99 -o99 "$pkgdir/var/log/icecast"
}
