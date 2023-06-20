# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-forge-git
_uuid=forge@jmmaranan.com
pkgver=70.r5.g27620b8
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
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

  # msgfmt: found 3 fatal errors
  rm po/it.po
}

build() {
  cd "$srcdir/forge"
  make build
}

package() {
  cd "$srcdir/forge"
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  cp -r temp/locale "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale"

  install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
