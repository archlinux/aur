# Maintainer: robertfoster
# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=mediapipe
pkgname=python-mediapipe # renovate: datasource=github-tags depName=google-ai-edge/mediapipe
pkgver=0.10.35
pkgrel=2
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
  "0004-use-opencv-headers.patch"
  "0005-set-hermetic-python-version-and-disable-odml-converter.patch"
  "0006-opencv5-geometry-header.patch"
)
sha256sums=('6b0e8490ab7f0f783937d4b25486cff469431adfe05c6f0217a5e63f68532113'
            'd18e88a217a00dc77cf2bfaa1d33b5fbc912deed5df686b0d2455fb0db75a677'
            '531dda481a8a06b23e0fe17e9c2f5eaefdfb0bf01bf81c7a8d849562534bf6ab'
            'fb082d88d9cca47534ae01fca676a3afdb909bfc82d52c97cf0eaedf34571d5f')


prepare() {
  # bazel in the ArchLinux is not working
  mkdir -p ${srcdir}/bin
  bazel_version=$(cat ${srcdir}/${_pkgname}-${pkgver}/.bazelversion)
  wget https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-linux-x86_64 -O ${srcdir}/bin/bazel
  chmod +x ${srcdir}/bin/bazel
  export PATH=${srcdir}/bin:${PATH}
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0004-use-opencv-headers.patch"
  patch -p1 -i "${srcdir}/0005-set-hermetic-python-version-and-disable-odml-converter.patch"
  patch -p1 -i "${srcdir}/0006-opencv5-geometry-header.patch"
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
