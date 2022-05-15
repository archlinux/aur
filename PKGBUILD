# Maintainer: reggiiie <reggiiie@tutanota.de>

pkgname=python-ffmpeg-git
_pkgname='ffmpeg-python'
pkgver=0.2.0.r37.gfc41f4a
pkgrel=2
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=('ffmpeg' 'python-future')
makedepends=('python-setuptools' 'python-pytest-runner' 'git')
checkdepends=('python-pytest' 'python-pytest-mock')
provides=(python-ffmpeg)
conflicts=(python-ffmpeg)
source=("git+https://github.com/kkroening/ffmpeg-python.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
}

check(){
  cd "$srcdir/${_pkgname}"
  pytest
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}