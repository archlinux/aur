# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=tidal-dl-git
_pkgname=Tidal-Media-Downloader
pkgver=2022.01.11.1.r0.g1b3afaa
pkgrel=3
pkgdesc="Download videos and tracks from Tidal."
arch=('any')
url="https://github.com/yaronzz/Tidal-Media-Downloader"
license=('Apache')
depends=('python-aigpy' 'python-lyricsgenius' 'python-pycryptodome' 
         'python-pydub' 'python-prettytable' 'python-setuptools' 'python-psutil'
         'python-importlib-metadata')
makedepends=('git')
provides=('tidal-dl')
conflicts=('tidal-dl')
source=(git+"${url}.git"
        "c78fcbc08a7072b1cbc650f75c1d58b97af721fb.patch")
sha256sums=('SKIP'
            '52f98e573cb4602da3ecae0de8797d82001775ab4cd42608ad109fd9e91ba1bc')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i "../c78fcbc08a7072b1cbc650f75c1d58b97af721fb.patch"
  rm -rf "TIDALDL-PY/tidal_gui"
}

build() {
  cd "${_pkgname}/TIDALDL-PY"
  python setup.py build
}

package() {
  cd "${_pkgname}/TIDALDL-PY"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
