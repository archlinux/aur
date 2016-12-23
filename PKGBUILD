# Maintainer: amiguet <contact at matthieuamiguet dot ch>
# Contributor: speps <spepser at aur dot archlinux dot org> 

pkgname=python2-pyo
pkgver=0.8.2
pkgrel=1
pkgdesc="A Python module written in C to help digital signal processing script creation."
arch=('i686' 'x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=('python2' 'portmidi' 'portaudio' 'liblo')
optdepends=('wxpython: wxWidgets GUI')
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo' 'python-pyo')
source=("http://ajaxsoundstudio.com/downloads/pyo_$pkgver-src.tar.bz2"
	"http://ajaxsoundstudio.com/downloads/pyo_$pkgver-doc.tar.bz2")
md5sums=('96d3f6b2b5d7226c8f87f953a99ac6a5'
         '0915081ff53d359fb8646f14deb8b2a5')

build() {
  cd "$srcdir/pyo_$pkgver-src"

  export PYTHON=python2
  python2 setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir/pyo_$pkgver-src"
  python2 setup.py install --use-double \
                           --use-jack \
                           --root="$pkgdir/"

  # examples
  install -d "$pkgdir/usr/share/pyo"
  cp -a examples "$pkgdir/usr/share/pyo"

  # docs
  install -d "$pkgdir/usr/share/doc/pyo"
  cp -a ../pyo_$pkgver-doc/* "$pkgdir/usr/share/doc/pyo"

  # python2 fix
  sed -i "s|env python|&2|g" `grep -rl "env python" "$pkgdir"`
}
