# Maintainer: blinry <mail@blinry.org>

pkgname=python-ffmpeg-patched-git
_pkgname='ffmpeg-python'
pkgver=0.2.0.r41.gdf129c7
pkgrel=1
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
source=(
  "git+https://github.com/kkroening/ffmpeg-python.git"
  test_pipe.patch
)
sha256sums=('SKIP'
            'e30a79ab1f13e89cf845360286b1768ccaa63704a069393d603187564810ab79')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
  patch --forward --strip=1 --input="${srcdir}/test_pipe.patch"
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
