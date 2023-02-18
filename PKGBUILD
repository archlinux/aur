# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-alphabetical-grid-extension-git
pkgver=27.0.r21.g1c4330f
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
_source=alphabetical-grid-extension
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${_source}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_source}"
  make package
}

package() {
  _uuid='AlphabeticalAppGrid@stuarthayhurst'

  cd "$srcdir/${_source}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/$_uuid.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
  
  install -Dm644 "extension/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}
