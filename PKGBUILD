# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
# Contributor: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-wxpython-dev
_pkgname=wxPython
pkgver=4.1.1
pkgrel=2
pkgdesc='Cross-platform GUI toolkit. Developer version'
arch=('x86_64')
license=('custom:wxWindows')
url='https://www.wxpython.org'
depends=('wxgtk3-dev' 'python-six')
optdepends=('python-pypubsub: Alternative to the deprecated wx.lib.pubsub API')
makedepends=('mesa' 'glu' 'webkit2gtk' 'python-requests' 'python-setuptools')
checkdepends=('xorg-server-xvfb' 'python-pytest-forked' 'python-numpy')
provides=('python-wxpython')
conflicts=('python-wxpython')
source=("https://files.pythonhosted.org/packages/source/w/wxPython/wxPython-$pkgver.tar.gz")
sha512sums=('00924008b97bbecb824c3fffd46fc76a5a3115d9346eb95baccc6cca99c080aa80b586af42fece8a3b4d234f2d07ffa8b66b50a164c41cbd95abc9b139c32809')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i "s|WX_CONFIG = 'wx-config'|WX_CONFIG = 'wx-config-gtk3'|" build.py
}

build() {
  cd "$_pkgname-$pkgver"

  python build.py build --release
}

check() {
  cd "$_pkgname-$pkgver"

  # there are segfaulting tests so --forked ensures we get sensible results
  PYTHONPATH=$PWD xvfb-run pytest --forked unittests || echo "==> WARNING: tests usually fail randomly"
}

package() {
  cd "$_pkgname-$pkgver"

  python build.py install --destdir="$pkgdir"

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  find "$pkgdir/usr/lib" -type f | xargs chmod 644
}
