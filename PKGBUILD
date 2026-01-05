# Maintainer: sfs sfslinux@gmail.com

pkgname=wdisplays-persistent-gettext
pkgver=1.1.2
pkgrel=5
pkgdesc="GUI display configurator for wlroots compositors (with kanshi config saving)"
#url="https://github.com/zipproth/wdisplays"
url="https://github.com/sfs-pra/wdisplays"
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

source=(
    git+$url
)
sha512sums=('SKIP')

build() {
  cd "wdisplays"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "wdisplays"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install

  # Create empty kanshi config file for new users
  # For this package, the config file is typically exclusively updated by wdisplays,
  # unlike the usual kanshi workflow where users manually write the config.
  # wdisplays will not create/write to the config if the file doesn't exist initially,
  # and kanshi fails to start without an existing config file. Users still need to add
  # kanshi to their compositor's autostart configuration.
  install -Dm644 /dev/null "$pkgdir/etc/skel/.config/kanshi/config"
}
