# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Mikuro Kagamine <mikurok@forgecrushing.com>

_plug=dfttest2
pkgname=vapoursynth-plugin-${_plug}-hip-git
pkgver=v9.1.g705de7d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} for HIP (GIT Version)"
arch=('x86_64')
url='https://github.com/AmusementClub/vs-dfttest2'
license=('GPL3')
depends=('vapoursynth' 'rocm-hip-runtime' 'rocm-device-libs' 'hip' 'hipfft')
makedepends=('git' 'cmake' 'ninja')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/vs-dfttest2")
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
  cmake \
    -B "build" \
    -S "${_plug}" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffast-math" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_PREFIX_PATH=/opt/rocm \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -D ENABLE_CUDA=0 \
    -D ENABLE_HIP=1 \
    -D ENABLE_CPU=1
  cmake --build "build" --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # The RTC version causes a "corrupted double-linked list" segfault,
  # so disable it for now. By deleting it.
  rm -v "${pkgdir}/usr/lib/vapoursynth/libdfttest2_hiprtc.so"
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
