# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>
pkgname=gnome-shell-extension-multi-monitors-add-on-git
_pkgname=multi-monitors-add-on
pkgver=23.r0.g0cec99d
pkgrel=4
pkgdesc="Adds panels and thumbnails for additional monitors."
arch=('any')
url="https://github.com/spin83/multi-monitors-add-on"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/spin83/multi-monitors-add-on.git'
        'https://github.com/spin83/multi-monitors-add-on/pull/163.patch')
sha256sums=('SKIP'
            'e157f4ed3afec752c5ccd623efbc3ddb9e8971ab20606adb8f1e0133da7bbdbe')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Added Partial Support for Gnome 41
  patch -Np1 -i $srcdir/163.patch
}

package() {
  cd "$srcdir/$_pkgname"

  _uuid="$_pkgname@spin83"
  _schema="org.gnome.shell.extensions.$_pkgname.gschema.xml"

  rm "$_uuid/$_pkgname.pot"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "$_uuid/" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas/"
}

