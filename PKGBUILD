# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-forge-git
_uuid=forge@jmmaranan.com
pkgver=77.r44.g06777a7
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'less')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/forge-ext/forge.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/forge"
  git describe --long --tags | sed 's/^v44-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/forge"

  # Causing build failure
  git revert -n cbe78c739fa7efc11e70d8c26f5738d61b8047f3
}

build() {
  cd "$srcdir/forge"
  make build
}

package() {
  cd "$srcdir/forge"
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
