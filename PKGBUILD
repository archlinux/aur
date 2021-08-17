# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>
pkgname=gnome-shell-extension-multi-monitors-add-on-git
_pkgname=multi-monitors-add-on
pkgver=23.r0.g0cec99d
pkgrel=2
pkgdesc="Adds panels and thumbnails for additional monitors."
arch=('any')
url="https://github.com/spin83/multi-monitors-add-on"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/spin83/multi-monitors-add-on.git'\
        'https://github.com/spin83/multi-monitors-add-on/pull/159.patch')
sha256sums=('SKIP'
            'e9f7f7c71c52fa88b7a231804e2bc877bff6799c65b339d7f818c921d1b3a354')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Partial support for GNOME 40
  patch -Np1 -i $srcdir/159.patch
}

package() {
  _uuid="$_pkgname@spin83"

  cd "$srcdir/$_pkgname"

  for locale in "$_uuid"/locale/*/; do
    install -Dm644 -t "$pkgdir/usr/share/${locale}/LC_MESSAGES" \
      "${locale}/LC_MESSAGES"/*.mo
  done

  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -a "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale"
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/$_pkgname.pot"

  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.$_pkgname.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas"
}

