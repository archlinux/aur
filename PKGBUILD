# Maintainer: robertfoster
# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=mediapipe
pkgname=python-mediapipe # renovate: datasource=github-tags depName=google-ai-edge/mediapipe
pkgver=0.10.26
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google-ai-edge/mediapipe"
license=("Apache-2.0")
depends=(
  absl-py
  gcc-libs
  glibc
  libglvnd
  opencv
  opengl-driver
  python-attrs
  python-flatbuffers
  python-matplotlib
  python-numpy
  python-opencv
  python-pillow
  python-protobuf
  python-scipy
  python-six
  python-sounddevice
  python-tensorflow
)
makedepends=(
  patchelf
  python-build
  python-installer
  python-setuptools
  python-wheel
  wget
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/google-ai-edge/mediapipe/archive/refs/tags/v${pkgver}.tar.gz"
  "0004-use-opencv4-headers.patch"
)
sha256sums=('ae0abfc544a37a46f46e20f73010ddbe43cf12b0853701b763d3df1ab986dd36'
  '55adaa6a74015f160b0dbf45d997c004cd7ecded501940a32c69c512956b0524')

prepare() {
  # bazel in the ArchLinux is not working
  mkdir -p ${srcdir}/bin
  bazel_version=$(cat ${srcdir}/${_pkgname}-${pkgver}/.bazelversion)
  wget https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-linux-x86_64 -O ${srcdir}/bin/bazel
  chmod +x ${srcdir}/bin/bazel
  export PATH=${srcdir}/bin:${PATH}
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0004-use-opencv4-headers.patch"
  # set __version__
  sed -i "s/__version__ = 'dev'/__version__ = '$pkgver'/" setup.py
  # set link_opencv to True
  sed -i "s/self.link_opencv = False/self.link_opencv = True/g" setup.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # enable building with GPU support, using opengl-driver
  # opengl-driver is provided by mesa or nvidia-utils
  MEDIAPIPE_DISABLE_GPU=0 \
    python -m build --wheel --no-isolation
  #$(readlink -f /usr/bin/python) -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # remove rpath and fix permission
  find ${pkgdir} -type f -name "*.so" -exec patchelf --remove-rpath {} \;
  find ${pkgdir} -type f -name "*.so" -exec chmod 755 {} \;
}
# vim:set ts=2 sw=2 et:
