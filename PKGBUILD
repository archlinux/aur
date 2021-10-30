# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-blur-my-shell-git
_pkgname=blur-my-shell
pkgver=25.r2.gcc973e8
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
  _schema="org.gnome.shell.extensions.$_pkgname.gschema.xml"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  cp -r build/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
