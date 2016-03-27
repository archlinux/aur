# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=audiotk
pkgname="${_pkgname}-git"
pkgver=1.1.0.r803.12b0a3a
pkgrel=1
pkgdesc="A C++ library with a set of audio filters (git version)"
arch=('i686' 'x86_64')
license=('BSD')
url='https://github.com/mbrucher/AudioTK'
depends=('fftw' 'libsndfile' 'python')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+https://github.com/mbrucher/AudioTK.git"
        'audiotk-git_h.patch')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
md5sums=('SKIP'
         'bfb36a2eb0f771271cdd96bc9217a777')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  version="$(git describe --tags | sed -e 's/^[^-]*-//;s/-.*//')"
  revision=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  echo $version.r$revision.$hash
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build
  git checkout develop

  patch -p1 -r - -i "${srcdir}/audiotk-git_h.patch"
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  local py_ver=$(python -c 'import sys; print("%s.%s" % sys.version_info[:2])')
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="-std=c++11" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_PYTHON=1 \
    -DPYTHON_INSTALL_FOLDER=/usr/lib/python${py_ver} \
    -DENABLE_TESTS=1
  make DESTDIR="${pkgdir}"
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
