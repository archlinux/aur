# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname=pyidm
pkgver=2020.6.27
pkgrel=4
pkgdesc="Python open source alternative to IDM (Internet Download Manager)"
arch=('any')
url="https://github.com/pyIDM/PyIDM"
license=('LGPL3')
depends=('python>=3.6' 
         'python-pysimplegui>=4.18' 
         'python-pyperclip' 
         'python-plyer' 
         'python-certifi' 
         'youtube-dl'
         'python-pycurl' 
         'python-pillow'
         'ffmpeg')
makedepends=('python-setuptools' 'python-pip')
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyIDM/PyIDM/archive/$pkgver.tar.gz"
        "no_update.patch")
b2sums=('a697c73d85956920e0ad859dea7bb1f2c4b7dc8a36ccfaabb893553bf037b464945dce482ba2cb8793f25ded2499e9ceaa87e07c250aa764d400d0997a79a20b'
        '584ee8e745066428a688d756ed89c67f681b9f974818a800e96f8eb5c93f05748c7a167612f056dc78d9d3b14e5ad0c64a12d2b08d97845357d1271c3e7ace4c')

prepare() {
  cd "$srcdir/PyIDM-$pkgver"
  # Disables updates from the client (it should be updater through AUR)
  patch --strip=1 < ../no_update.patch
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
