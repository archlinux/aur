# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=audiotk
pkgname="${_pkgname}-git"
pkgver=2.1.1.r1728.ca00f43
pkgrel=1
pkgdesc="A C++ library plus Python 3 bindings with a set of audio filters (git version)"
arch=('i686' 'x86_64')
license=('BSD')
url='https://github.com/mbrucher/AudioTK'
depends=('eigen' 'fftw' 'libsndfile' 'python')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+https://github.com/mbrucher/AudioTK.git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  local version="$(grep ^PROJECT_NUMBER Doxyfile | awk '{ print $3 }')"
  local revision=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build
  git checkout develop
  git pull
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  local py_ver=$(python -c 'import sys; print("%s.%s.%s" % sys.version_info[:3])')
  local py_maj_ver=$(python -c 'import sys; print("%s.%s" % sys.version_info[:2])')
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISABLE_EIGEN_WARNINGS=1 \
    -DENABLE_PYTHON=1 \
    -DPYTHON_VERSION=${py_maj_ver} \
    -DPYTHON=python${py_maj_ver} \
    -DPython_ADDITIONAL_VERSIONS=${py_ver} \
    -DPYTHON_INSTALL_FOLDER=/usr/lib/python${py_maj_ver} \
    -DENABLE_TESTS=1 \
    -DBUILD_DOC=1 \
    -DENABLE_GPL=1
  make
}

check() {
  cd "${srcdir}/${_pkgname}/build"

  return 0  # Skip tests for now
  make test
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  #cp -r Examples "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r Doxygen/html "${pkgdir}/usr/share/doc/${pkgname}/API"
}

# vim:set ts=2 sw=2 et:
