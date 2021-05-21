# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
pkgname=brightness-controller-git
pkgver=2.3.4.r286.ea7434a
pkgrel=1
pkgdesc="Control Brightness of your Primary and Secondary Display in Linux"
arch=('x86_64')
url="https://github.com/LordAmit/Brightness"
license=('GPL')
depends=('python-qtpy' 'xorg-xrandr')
makedepends=('git' 'python-cx-freeze' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/LordAmit/Brightness.git"
        "$url/raw/releases/usr/share/man/man1/${pkgname%-git}.1.gz"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh"
        'brightness-reset.sh')
sha256sums=('SKIP'
            '7a01713032d8a44e828c4d7fe4d7445501ebbec6071ee8041faaafa5bac77a91'
            'b717c81ee4f996b18c74931c9ee9a3dc5c7cb571aade25a5be52905b7afc8860'
            'cc7c78f60ed1b3606411c6a0569e3a13b7dbbbf4dd4fdeb11d0939f9f357ff78'
            'e6a777ca8aca3577754c53efceaa1010b521aaaafd826339baf4bbd109c71d84')

pkgver() {
  cd "$srcdir/${pkgname%-git}/src"
  printf "$(python setup.py --version).r%s.%s" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#build() {
#  cd "$srcdir/${pkgname%-git}/src"
#  python setup.py build
#}

package() {
  cd "$srcdir/${pkgname%-git}/src"
#  export PYTHONHASHSEED=0
#  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 brightness-reset init.py -t "$pkgdir/usr/share/${pkgname%-git}"
  cp -r ui util "$pkgdir/usr/share/${pkgname%-git}"
  rm "$pkgdir/usr/share/${pkgname%-git}/util/debian_install"

  install -Dm644 "icons/${pkgname%-git}.svg" -t "$pkgdir/usr/share/${pkgname%-git}/icons"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s "/usr/share/${pkgname%-git}/icons/${pkgname%-git}.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm755 "$srcdir/brightness-reset.sh" "$pkgdir/usr/bin/brightness-reset"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
