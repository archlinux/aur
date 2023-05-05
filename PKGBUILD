# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-blur-my-shell-git
_pkgname=blur-my-shell
pkgver=46.r0.gc5b7f16
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/aunetx/blur-my-shell.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  _uuid="${_pkgname}@aunetx"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf build/${_uuid}.shell-extension.zip \
    -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "schemas/org.gnome.shell.extensions.${_pkgname}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  install -d "$pkgdir/usr/share/locale"
  cp -r "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale/"* \
    "$pkgdir/usr/share/locale/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"{locale,schemas}
}
