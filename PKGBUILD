# Maintainer: aimileus <me at aimileus dot nl>
pkgname=('python-snowboy-git' 'python2-snowboy-git')
pkgbase=python-snowboy-git
_pkgname=snowboy
pkgver=v1.3.0.r3.g75ef4f5
pkgrel=1
pkgdesc="A hotword detection engine - Python bindings"
arch=('x86_64')
url="https://snowboy.kitt.ai/"
license=('Apache')
makedepends=(
  'git'
  'python-setuptools'
  'python2-setuptools'
  'swig'
  'cblas'
)
conflicts=('python-snowboy')
provides=('python-snowboy')
source=("git+https://github.com/Kitt-AI/snowboy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "${_pkgname}"{,-py2}

  sed -i -e "s|-lf77blas -lcblas -llapack -latlas|-lcblas|g" \
    -e 's| -shared| -Wl,-O1,--as-needed\0|g' \
    "${_pkgname}/swig/Python3/Makefile"
  sed -i -e "s|-lf77blas -lcblas -llapack -latlas|-lcblas|g" \
    -e 's| -shared| -Wl,-O1,--as-needed\0|g' \
    "${_pkgname}-py2/swig/Python/Makefile"
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build

  cd "$srcdir/${_pkgname}-py2"
  python2 setup.py build
}

package_python-snowboy-git() {
  depends=('cblas' 'python-pyaudio')

  cd "${_pkgname}"
  python setup.py install \
	  --root="$pkgdir" \
	  --optimize=1 \
	  --skip-build
}

package_python2-snowboy-git() {
  depends=('cblas' 'python2-pyaudio')

  cd "$_pkgname-py2"
  python2 setup.py install \
	  --root="$pkgdir" \
	  --optimize=1 \
	  --skip-build
}
