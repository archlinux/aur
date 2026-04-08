# Maintainer:  sfs <sfslinux@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=lxrandr-wlr
_pkgname=lxrandr
pkgver=0.3.3
pkgrel=6
pkgdesc='Monitor configuration tool for wlroots-based compositors'
arch=(x86_64)
url='https://github.com/lxde/lxrandr'
license=(GPL-2.0-or-later)
groups=(lxde)
depends=(
  glib2
  glibc
  gtk3
  wlr-randr
)
makedepends=(
  git
  intltool
)
conflicts=(lxrandr-gtk3)
replaces=(lxrandr-gtk3)
source=(
  "git+https://github.com/lxde/lxrandr.git#tag=$pkgver"
  lxrandr-notshowin.patch
  lxrandr-x11-only.patch
)
b2sums=(
  2a38a2c41f1e45e6bd0cee2e648c477222ec853a091ff410a358788440fa4ea4efe3fafa08aefc9e78e19dc725c1452694b18deb6704b04b05ace82f000c4524
  4dd8657dd2e11345255b5ebda399720623956f2935aa1d5e74674fc55f7c315f217f8652944563edeef41af7080d2d0dd7d98d415a75bc7fe0ada0b4c4702b33
  41d472511a25994d3454b0e111f9382cb302ae599224715fb640c95b8f740f5a03dc8ef2ce18a33e48dca887eadb7583fb50506bfafe3e4392ec2991b292a0d3
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxrandr/pull/7
  git apply -3 ../lxrandr-notshowin.patch

  # https://github.com/lxde/lxrandr/pull/8
  git apply -3 ../lxrandr-x11-only.patch

  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk3
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
