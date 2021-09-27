# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact
pkgname=tlpui-git
pkgver=1.4.0.r1.g2148706
pkgrel=1
epoch=2
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/d4nj1/TLPUI.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'c07939b2e8c08e649579b9f3b3144b927834229f09a8f77f7f627f789c875b99')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^tlpui.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"

  for icon_size in 16 32 48 64 128 96 128 256; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d "$pkgdir/$icons_dir"
    install -m644 "${pkgname%-git}/icons/themeable/hicolor/${icon_size}x${icon_size}/apps/${pkgname%-git}.png" -t \
      "$pkgdir/$icons_dir"
  done

  install -Dm644 "${pkgname%-git}/icons/themeable/hicolor/scalable/apps/${pkgname%-git}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
