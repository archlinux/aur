# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=dupliseek-git
pkgver() { git -C "${pkgname%-git}" describe | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=0.0.2alpha.r55.3ce09f8
pkgrel=1

pkgdesc='Duplicate image finder written in Python/Qt5'
arch=('any')
url="https://gitlab.com/magnusmj/${pkgname%-git}"
license=('MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('python-pyqt5' 'python-numpy' 'python-imutils')
makedepends=('git' 'python-setuptools')

source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname%-git}"

  sed -i "s|\(/usr/share/\)icons\(/${pkgname%-git}\)|\1pixmaps\2.png|;
          s|^\(Categories=.*\)|\1\;Utility|" "${pkgname%-git}.desktop"
  sed -i 's|\(main:main\)|DupliSeek.\1|g' setup.py
}

build() {
  cd "${pkgname%-git}"

  python setup.py build
  install -dm755 build/lib/DupliSeek
  mv build/lib/{GUI,icons,stylesheets,main.py} build/lib/DupliSeek/
}

package() {
  cd "${pkgname%-git}"

  python setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 icons/compare.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "${pkgname%-git}.desktop" -t"$pkgdir/usr/share/applications/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
