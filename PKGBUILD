# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: naxuroqa <naxuroqa at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=toxcore-git
pkgver=0.2.18.r36.g172f279dc
pkgrel=1
pkgdesc="Peer to peer (serverless) instant messenger core"
arch=('i686' 'x86_64')
url="https://tox.chat/"
license=('GPL3')
depends=('glibc' 'libconfig' 'libsodium' 'libvpx' 'msgpack-c' 'opus')
makedepends=('git' 'cmake')
provides=("toxcore=$pkgver" 'tox')
conflicts=('toxcore' 'tox')
backup=('etc/tox-bootstrapd.conf')
options=('staticlibs')
source=("git+https://github.com/TokTok/c-toxcore.git"
        "toxcore.conf::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/toxcore/trunk/toxcore.conf"
        "toxcore.tmpfiles::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/toxcore/trunk/toxcore.tmpfiles")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "c-toxcore"

  sed -i "s|/usr/local|/usr|" "other/bootstrap_daemon/tox-bootstrapd.service"
}

pkgver() {
  cd "c-toxcore"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "c-toxcore"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "c-toxcore"

  make -C "_build" test
}

package() {
  cd "c-toxcore"

  make -C "_build" DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/toxcore.conf" -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm644 "$srcdir/toxcore.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/toxcore.conf"
  install -Dm644 "other/bootstrap_daemon/tox-bootstrapd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "other/bootstrap_daemon/tox-bootstrapd.conf" -t "$pkgdir/etc"
}
