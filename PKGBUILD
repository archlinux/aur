# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-gnome-ui-tune-git
pkgver=1.5.0.r1.ge8cd04d
pkgrel=2
pkgdesc="Tunes the overview UI of GNOME 40"
arch=('any')
url="https://github.com/axxapy/gnome-ui-tune"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/axxapy/gnome-ui-tune.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/gnome-ui-tune
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/gnome-ui-tune
  make gettext
  make schemas
  make dist
}

package() {
  cd $srcdir/gnome-ui-tune
  _uuid='gnome-ui-tune@itstime.tech'
  _schema='org.gnome.shell.extensions.gnome-ui-tune.gschema.xml'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf "$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas"
}
