# Maintainer: webmeister <aur -dot- 20 -dot- webmeister -at- spamgourmet -dot- com>
# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mu-editor
epoch=1
pkgver=1.0.3
pkgrel=3
pkgdesc='A simple Python editor for beginner programmers'
arch=('any')
url='https://codewith.mu/'
license=('GPL3')
depends=('pigpio' 'python-appdirs' 'python-gpiozero' 'python-guizero'
         'python-matplotlib' 'python-nudatus' 'python-pgzero'
         'python-pycodestyle' 'python-pyflakes' 'python-pyqt5-chart>=5.15'
         'python-pyserial' 'python-qscintilla-qt5' 'python-qtconsole'
         'python-requests' 'python-semver' 'qt5-serialport')
makedepends=('gendesk' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mu-editor/mu/archive/$pkgver.tar.gz")
sha256sums=('d9917794de845231ffea671ceff24824bbe342c9d0da4340b237f7a915c0c358')


prepare() {
  cd "$srcdir/mu-$pkgver"
  # Un-pin all dependencies, so package doesn't break when a dependency is updated
  sed -i -e 's/==/>=/g' setup.py
}

build() {
  cd "$srcdir/mu-$pkgver"
  python setup.py build
  gendesk -f -n \
    --pkgname=$pkgname \
    "--pkgdesc=$pkgdesc" \
    "--name=Mu" \
    "--genericname=Code Editor" \
    "--categories=Application;Development;TextEditor" \
    --exec=$pkgname \
    --terminal=false \
    --startupnotify=true \
    "--mimetypes=text/x-python;text/x-python3"
}

package() {
  cd "$srcdir/mu-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 conf/mu.codewith.editor.png "$pkgdir/usr/share/pixmaps/mu-editor.png"
}

# vim:set ts=2 sw=2 et:
