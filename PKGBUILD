# Contributor: Dan Printzell <wild@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: dsboger <https://github.com/dsboger>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=tilix
pkgver=1.9.6
pkgrel=9
pkgdesc="A tiling terminal emulator for Linux using GTK+ 3"
arch=('x86_64')
url="https://github.com/gnunn1/tilix"
license=('MPL-2.0')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas' 'liblphobos' 'libunwind')
makedepends=('ldc' 'meson' 'appstream')
optdepends=('python-nautilus: for "Open Tilix Here" support in nautilus'
            'libsecret: for the password manager')

source=(
  "$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('be389d199a6796bd871fc662f8a37606a1f84e5429f24e912d116f16c5f0a183')

prepare() {
  # Patch Align to GtkAlign, due to conflicting symbols
  sed -i 's/(Align\./(GtkAlign./g' $pkgname-$pkgver/source/gx/tilix/prefeditor/prefdialog.d
  sed -i 's/(Align\./(GtkAlign./g' $pkgname-$pkgver/source/gx/tilix/terminal/terminal.d
}

build() {
  mkdir build
  cd build

  # Build with LDC
  export DC=ldc
  export LDFLAGS="$(echo -ne $LDFLAGS | sed -e 's/-flto=auto//')"
  export DFLAGS="--flto=full --allinst"

  arch-meson ../$pkgname-$pkgver

  ninja
}

package() {
  cd build

  DESTDIR="$pkgdir" ninja install
}
