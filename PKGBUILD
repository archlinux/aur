# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=dfttest2
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v5.5.gb8c8c81
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-dfttest2'
license=('GPL2')
depends=('vapoursynth' 'cuda')
makedepends=('git' 'cmake' 'ninja' 'gcc')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/shssoichiro/vs-dfttest2#branch=gcc13-support")
sha256sums=('SKIP')
options=('debug')

_site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"
  git submodule update --init --recursive
}

build() {
  # This is based on what the project's CI is doing
  export CC=gcc
  export CXX=g++
  cmake \
    -B "build" \
    -S "${_plug}" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_C_COMPILER="${CC}" \
    -D CMAKE_CXX_COMPILER="${CXX}" \
    -D CMAKE_CXX_FLAGS_RELEASE="-ffast-math -march=native" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ENABLE_CUDA=1 \
    -D USE_NVRTC_STATIC=ON \
    -D ENABLE_CPU=1 \
    -W no-dev
  cmake --build "build" --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
