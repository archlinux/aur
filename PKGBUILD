# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luke Street <luke.street@encounterpc.com>
pkgname=gnome-shell-extension-gamemode-git
pkgver=17.0.r2.g6848872
pkgrel=1
pkgdesc="GameMode Status Indicator for GNOME Shell"
arch=('any')
url="https://github.com/trsnaqe/gamemode-shell-extension"
license=('LGPL-2.1-or-later')
depends=(
  'gamemode'
  'gnome-shell'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/trsnaqe/gamemode-shell-extension.git'
        'schema.patch')
sha256sums=('SKIP'
            '1534366a331b7821243b8dfff7494ec9a1d1ede98de1a186e6f77990bc79dc49')

pkgver() {
  cd gamemode-shell-extension
  git describe --long --tags --abbrev=7 | sed 's/^V//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gamemode-shell-extension

  # Don't compile schema
  patch -Np1 -i ../schema.patch
}

build() {
  arch-meson gamemode-shell-extension build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
