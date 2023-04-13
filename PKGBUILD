# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=v4l-utils-git
pkgver=1.24.1.r32.g399d70f1
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux"
arch=('i686' 'x86_64')
url="https://linuxtv.org/"
license=('GPL' 'LGPL')
depends=('gcc-libs' 'hicolor-icon-theme' 'libjpeg-turbo' 'sysfsutils')
makedepends=('git' 'alsa-lib' 'qt5-base')
provides=("v4l-utils=$pkgver")
conflicts=('v4l-utils')
options=('staticlibs')
source=("git+https://git.linuxtv.org/v4l-utils.git")
sha256sums=('SKIP')


pkgver() {
  cd "v4l-utils"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v4l-utils-//'
}

build() {
  cd "v4l-utils"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --sbindir="/usr/bin"
  make
}

check() {
  cd "v4l-utils"

  #make check
}

package() {
  cd "v4l-utils"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/ivtv-ctl"
}
