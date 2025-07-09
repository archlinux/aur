# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: naxuroqa <naxuroqa at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=toxcore-git
pkgver=0.2.21.r3.g679444751
pkgrel=1
pkgdesc="Peer to peer (serverless) instant messenger core"
arch=('i686' 'x86_64')
url="https://tox.chat/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libconfig' 'libsodium' 'libvpx' 'msgpack-c' 'opus')
makedepends=('git' 'cmake')
provides=("toxcore=$pkgver" 'tox')
conflicts=('toxcore' 'tox')
backup=('etc/tox-bootstrapd.conf')
options=('staticlibs')
source=("git+https://github.com/TokTok/c-toxcore.git"
        "toxcore.conf::https://gitlab.archlinux.org/archlinux/packaging/packages/toxcore/-/raw/main/toxcore.conf"
        "toxcore.tmpfiles::https://gitlab.archlinux.org/archlinux/packaging/packages/toxcore/-/raw/main/toxcore.tmpfiles")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "c-toxcore"

  git submodule update --init --recursive
  sed -i "s|/usr/local|/usr|" "other/bootstrap_daemon/tox-bootstrapd.service"
}

pkgver() {
  cd "c-toxcore"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "c-toxcore"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "c-toxcore"

  #cmake --build "_build" --target test
}

package() {
  cd "c-toxcore"

  DESTDIR="$pkgdir" cmake --install "_build"

  install -Dm644 "$srcdir/toxcore.conf" -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm644 "$srcdir/toxcore.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/toxcore.conf"
  install -Dm644 "other/bootstrap_daemon/tox-bootstrapd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "other/bootstrap_daemon/tox-bootstrapd.conf" -t "$pkgdir/etc"
}
