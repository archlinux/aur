# Maintainer: webmeister <aur -dot- 20 -dot- webmeister -at- spamgourmet -dot- com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=mu-editor
epoch=1
pkgver=1.0.1
pkgrel=1
pkgdesc='A simple Python editor for beginner programmers'
arch=('any')
url='https://codewith.mu/'
license=('GPL3')
depends=('python-appdirs' 'python-gpiozero' 'python-guizero' 'python-matplotlib' 'python-nudatus'
         'python-pigpio' 'python-pgzero' 'python-pycodestyle' 'python-pyflakes' 'python-pyqtchart'
         'python-pyserial' 'python-qscintilla-qt5' 'python-qtconsole' 'python-requests'
         'python-semver' 'qt5-serialport')
makedepends=('gendesk' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mu-editor/mu/archive/$pkgver.tar.gz"
        'webbrowser-issue31014.diff')
sha256sums=('41abc6415ba8c51d62ad6e465dbefec4b0382d586c60d602ebb3d9e373fc5710'
            'ee2b9210ddb25ccc29ff857e450646d7b3cd7336a8532de29c76cd2176cc980e')


prepare() {
  cd "$srcdir/mu-$pkgver"
  # python-pyqt5 and python-qscintilla are not python-setuptools compatible
  # the dependencies are handled by the package
  sed -i -e "s/'pyqt5==[0-9.]*',//" -e "s/'qscintilla==[0-9.]*',//" setup.py
  # Un-pin all other dependencies, so package doesn't break when a dependency is updated
  sed -i -e 's/==/>=/g' setup.py
  patch -Np1 -i "${srcdir}/webbrowser-issue31014.diff"
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
