# Maintainer: Stefan Zipproth <s.zipproth@ditana.org>

pkgname=wdisplays-persistent
pkgver=1.1.1
pkgrel=2
pkgdesc="GUI display configurator for wlroots compositors (with kanshi config saving)"
url="https://github.com/petertheprocess/wdisplays"
license=(GPL3)
arch=(x86_64)
install=wdisplays-persistent.install
depends=(
  gtk3
  libepoxy
  wayland
  wayland-protocols
  kanshi
)
provides=('wdisplays')
conflicts=('wdisplays')
replaces=('wdisplays')
makedepends=(
  meson
)
_commit="d5f0e48443c8aac4357cd411b03f143f23df30ac"
source=(
  "wdisplays-$_commit.tar.gz::$url/archive/$_commit.tar.gz"
  "outputs_noop.patch"
  "kanshi_output_names.patch"
)
sha512sums=('48e1d6addfae876b3f205eb114a0d79a90c9e41dccaca499ee53bab05f8d32efbd4b13c013ab23f7999ee7bc61621e52c25bd12b03d670172ffb9bbca45f0716'
            'SKIP'
            'SKIP')

prepare() {
  cd "wdisplays-$_commit"
  patch -Np1 -i ../outputs_noop.patch
  patch -Np1 -i ../kanshi_output_names.patch
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
