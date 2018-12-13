# Maintainer: Score_Under <seejay.11@gmail.com>
# Original PKGBUILD (for python 3): Eric Bélanger <eric@archlinux.org>

pkgname=python2-wxpython4
_pkgname=wxPython
pkgver=4.0.3
pkgrel=4
pkgdesc="Phoenix wxWidgets GUI toolkit for Python 2"
arch=('x86_64')
license=('custom:wxWindows')
url="https://www.wxpython.org"
depends=('wxgtk3' 'python2-setuptools' 'python2-six')
makedepends=('mesa' 'glu' 'webkit2gtk')
#checkdepends=('xorg-server-xvfb' 'python2-pytest' 'python2-numpy')
provides=(python2-wxpython-phoenix)
conflicts=(${provides[@]})
source=("https://files.pythonhosted.org/packages/source/w/wxPython/wxPython-${pkgver}.tar.gz")
sha512sums=('911dd98d15b0cbc2551f1b22a21fdae4450656ca59cc93216b7c6a8a00e399b929b78484637992d78cecffb098b8d8dc408c24795549827e2f90ce42740c3bf9')

prepare() {
  sed -i "s|WX_CONFIG = 'wx-config'|WX_CONFIG = 'wx-config-gtk3'|" $_pkgname-$pkgver/build.py
}

build() {
  cd $_pkgname-$pkgver

  python2 build.py build --use_syswx --release
}

# Check function doesn't work without pypubsub for python 2
#check() {
#  cd $_pkgname-$pkgver
#
#  xvfb-run python2 build.py test
#}

package() {
  cd $_pkgname-$pkgver

  python2 build.py install --destdir="$pkgdir"

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  find "$pkgdir/usr/lib" -type f | xargs chmod 644
  rm -f "$pkgdir/usr/bin"/*
}
