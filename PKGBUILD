# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icecast-git
pkgver=2.5.0.beta.1.r179.gfa86f2d
pkgrel=1
pkgdesc="A streaming media (audio/video) server"
arch=('i686' 'x86_64')
url="http://www.icecast.org/"
license=('GPL2')
depends=('glibc' 'openssl' 'curl>=7.10' 'libxml2' 'libxslt' 'libtheora' 'libvorbis>=1.0' 'speex' 'libkate')
makedepends=('git')
provides=('icecast')
conflicts=('icecast')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=("git+https://git.xiph.org/icecast-server.git"
        "icecast.logrotate::https://git.archlinux.org/svntogit/community.git/plain/trunk/icecast.logrotate?h=packages/icecast"
        "icecast.service::https://git.archlinux.org/svntogit/community.git/plain/trunk/icecast.service?h=packages/icecast"
        "start-by-nobody.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/start-by-nobody.patch?h=packages/icecast")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "icecast-server"

  sed -i 's|url = \.\.|url = https://git.xiph.org|' ".gitmodules"
  git submodule sync
  git submodule update --init --recursive

  patch -Np1 -i "$srcdir/start-by-nobody.patch"
}

pkgver() {
  cd "icecast-server"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "icecast-server"

  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc" --localstatedir="/var"
  make
}

package() {
  cd "icecast-server"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/icecast.logrotate" "$pkgdir/etc/logrotate.d/icecast"
  install -Dm644 "$srcdir/icecast.service" "$pkgdir/usr/lib/systemd/system/icecast.service"
  install -d -g99 -o99 "$pkgdir/var/log/icecast"
}
