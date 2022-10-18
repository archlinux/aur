# Maintainer: WoofinaS <woofina.s.love@gmail.com>

# This is a edited version of vapoursynth-plugin-dfttest2-git
# with only cpu support

# Changes made
# Removed cuda as a requirement
# Removed undeeded cmake flags
# Removed c compiler flags overide

_plug=dfttest2
pkgname=vapoursynth-plugin-dfttest2-cpu-git
pkgver=v4.0.gbb5bad6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: dfttest2-cpu (GIT Version)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-dfttest2'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git' 'cmake' 'ninja' 'gcc11')
provides=("vapoursynth-plugin-dfttest2-cpu")
conflicts=("vapoursynth-plugin-dfttest2" "vapoursynth-plugin-dfttest2-git")
source=("${_plug}::git+https://github.com/AmusementClub/vs-dfttest2")
sha256sums=('SKIP')
options=('debug' '!strip')

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
  export CXX=g++-11
  cmake \
    -B "build" \
    -S "${_plug}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_COMPILER="${CXX}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS_RELEASE="-ffast-math -march=native" \
    -DENABLE_CUDA=0 \
    -Wno-dev
  cmake --build "build" --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
