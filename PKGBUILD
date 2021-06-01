# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: Luke Street <luke.street@encounterpc.com>
pkgname=gnome-shell-extension-gamemode-git
pkgver=4.r7.gac23266
pkgrel=2
pkgdesc="GNOME Shell extension for Feral Interactive's GameMode"
arch=('any')
url="https://github.com/gicmo/gamemode-extension"
license=('GPL2')
depends=('gamemode' 'gnome-shell')
makedepends=('meson' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gicmo/gamemode-extension.git'
        'https://github.com/gicmo/gamemode-extension/pull/38.patch')
sha256sums=('SKIP'
            'c49558889af2f2f991abe9c7c8d48783f7a719a26e1e72c4751dcbe787794f86')

pkgver() {
  cd $srcdir/gamemode-extension
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/gamemode-extension

  # support for gnome-shell40/gtk4
  patch -Np1 -i $srcdir/38.patch
}

build() {
  arch-meson gamemode-extension build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
