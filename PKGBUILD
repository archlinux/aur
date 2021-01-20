# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=comictagger
pkgver=1.1.31.rc1.r38.be698a1
pkgrel=1
pkgdesc='Application for writing metadata to digital comics, written in Python and PyQt'
arch=(any)
url='https://github.com/lordwelch/comictagger/'
license=(Apache)
makedepends=('git' 'python-setuptools')
depends=('python'
    'python-beautifulsoup4'
    'python-configparser'
    'python-natsort'
    'python-pathvalidate'
    'python-pillow'
    'python-requests'
    'python-unrar-cffi'
    'python-pyqt5'
)
_commit=be698a17d68cb037e5874313f222b90b315918f1
source=(git+https://github.com/lordwelch/comictagger.git#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd comictagger
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd comictagger
  python setup.py build
}

package() {
  cd comictagger
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  sed -e 's|/usr/local/share/comictagger/app.png|/usr/share/icons/comictagger.png|g' \
      -e 's|%%CTSCRIPT%% %F|/usr/bin/comictagger|g' \
      -i desktop-integration/linux/ComicTagger.desktop

  install -Dm644 desktop-integration/linux/ComicTagger.desktop \
    "$pkgdir"/usr/share/applications/comictagger.desktop
  install -Dm644 comictaggerlib/graphics/app.png \
    "$pkgdir"/usr/share/icons/comictagger.png
}
