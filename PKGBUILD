# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
pkgname=brightness-controller-git
pkgver=2.4.r5.g7c4a27e
pkgrel=3
pkgdesc="Control Brightness of your Primary and Secondary Display in Linux"
arch=('x86_64')
url="https://github.com/LordAmit/Brightness"
license=('GPL')
depends=('ddcutil' 'python-pyqt5' 'python-qtpy' 'xorg-xrandr')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/LordAmit/Brightness.git"
        "$url/raw/releases/usr/share/man/man1/${pkgname%-git}.1.gz"
        "${pkgname%-git}.desktop"
        'brightness-reset.sh')
sha256sums=('SKIP'
            '7a01713032d8a44e828c4d7fe4d7445501ebbec6071ee8041faaafa5bac77a91'
            'b717c81ee4f996b18c74931c9ee9a3dc5c7cb571aade25a5be52905b7afc8860'
            '995a513671b4d1bac4be5a2a542372155f4224fcae8e5f847ba87a8029d9dad1')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}-linux"
  mv README.md readme.md
}

build() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}-linux"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}/${pkgname%-git}-linux"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../img/brightness.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm755 "$srcdir/brightness-reset.sh" "$pkgdir/usr/bin/brightness-reset"
}
