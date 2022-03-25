# Maintainer: Mark Wagie <markt dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=gnome-shell-extension-transparent-top-bar-git
pkgver=r46.f0814f6
pkgrel=1
pkgdesc="GNOME Shell extension that brings back the transparent top bar when free-floating"
arch=('any')
url="https://github.com/lamarios/gnome-shell-extension-transparent-top-bar"
license=('unknown')
depends=('gnome-shell')
makedepends=('git' 'ruby-sass' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/lamarios/gnome-shell-extension-transparent-top-bar.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's/com.ftpix/ftpix.com/g' Makefile
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  _uuid='transparent-top-bar@ftpix.com'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvzf "build/$_uuid.zip" -C  "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 src/schemas/ftpix.com.transparentbar.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
