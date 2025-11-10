# Maintainer: sfs sfslinux@gmail.com

pkgname=wdisplays-persistent-gettext
pkgver=1.1.2
pkgrel=4
pkgdesc="GUI display configurator for wlroots compositors (with kanshi config saving)"
url="https://github.com/zipproth/wdisplays"
license=(GPL3)
arch=(x86_64)
install=$pkgname.install
depends=(
  gtk3
  libepoxy
  wayland
  wayland-protocols
  kanshi
)
provides=('wdisplays' 'wdisplays-persistent')
conflicts=('wdisplays' 'wdisplays-persistent')
replaces=('wdisplays' 'wdisplays-persistent')
makedepends=(
  meson
)
_commit="402b3fc6689de28abed518425a0a41526890c185"
source=(
  "wdisplays-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "outputs_noop.patch"
  "https://github.com/zipproth/wdisplays/pull/1.patch"
)
sha512sums=('f7dc95782d4cecd36651ba296bf0869bbddb1dc61f626f74a6b98cdf20d52177cfc61f8e9fb3fb89fc35aa2cb23ef457ba7b3cff6b74f340650926a8004d3c88'
            'SKIP'
            'SKIP')

prepare() {
  cd "wdisplays-$_commit"
  patch -Np1 -i ../outputs_noop.patch
  patch -Np1 -i ../1.patch
}

build() {
  cd "wdisplays-$_commit"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "wdisplays-$_commit"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  # Create empty kanshi config file for new users
  # For this package, the config file is typically exclusively updated by wdisplays,
  # unlike the usual kanshi workflow where users manually write the config.
  # wdisplays will not create/write to the config if the file doesn't exist initially,
  # and kanshi fails to start without an existing config file. Users still need to add
  # kanshi to their compositor's autostart configuration.
  install -Dm644 /dev/null "$pkgdir/etc/skel/.config/kanshi/config"
}
