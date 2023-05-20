# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icecast-git
pkgver=2.4.3.r1091.g57093def
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
        "icecast.logrotate::https://gitlab.archlinux.org/archlinux/packaging/packages/icecast/-/raw/main/icecast.logrotate"
        "icecast.service::https://gitlab.archlinux.org/archlinux/packaging/packages/icecast/-/raw/main/icecast.service"
        "icecast.sysusers::https://gitlab.archlinux.org/archlinux/packaging/packages/icecast/-/raw/main/icecast.sysusers"
        "icecast.tmpfiles::https://gitlab.archlinux.org/archlinux/packaging/packages/icecast/-/raw/main/icecast.tmpfiles")
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

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
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
