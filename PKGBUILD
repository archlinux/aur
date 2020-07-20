# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.6.27
pkgrel=2
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('python' 
         'python-pysimplegui>=4.18' 
         'python-pyperclip' 
         'python-plyer' 
         'python-certifi' 
         'youtube-dl'
         'python-pycurl' 
         'python-pillow')
makedepends=('python-setuptools' 'python-pip')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz")
b2sums=('a697c73d85956920e0ad859dea7bb1f2c4b7dc8a36ccfaabb893553bf037b464945dce482ba2cb8793f25ded2499e9ceaa87e07c250aa764d400d0997a79a20b')

prepare() {
  # Disables updates from the client (it should be updater through AUR)
  sed -i "s/update_frequency = 7/update_frequency = -1/" "$srcdir/PyIDM-$pkgver/pyidm/config.py"
  sed -i "s/update_frequency_map = {'Everyday': 1, 'Every Week': 7, 'Every Month': 30, 'Never': -1}/update_frequency_map = {'Never': -1}/" "$srcdir/PyIDM-$pkgver/pyidm/config.py"
}

build() {
  cd "$srcdir/PyIDM-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/PyIDM-$pkgver"

  # python-pystray does not work in AUR
  pip install pystray

  python setup.py install --root="$pkgdir" --skip-build -O2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
