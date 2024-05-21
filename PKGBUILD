# Maintainer: robertfoster
# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=mediapipe
pkgname=python-mediapipe
pkgver=0.10.14
pkgrel=1
pkgdesc="A cross-platform, customizable ML solutions for live and streaming media"
arch=('x86_64')
url="https://github.com/google/mediapipe"
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

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/google/mediapipe/archive/refs/tags/v${pkgver}.tar.gz"
  "0001-update-rules_apple.patch"
  "0002-delete-unused-com_google_protobuf_fixes.diff.patch"
  "0004-use-opencv4-headers.patch"
  "0005-add-arg-experimental_allow_proto3_optional-to-protoc.patch"
)
sha256sums=('9d46fa5363f5c4e11c3d1faec71b0746f15c5aab7b5460d0e5655d7af93c6957'
            '407eed253257d32c210589109067911a7f32d27155527919b6de7ea2a78d5d6b'
            'a2626c181e854ffd56b72b8ca96ef728272c510c9ae9bdd9d55388ac7d786484'
            '55adaa6a74015f160b0dbf45d997c004cd7ecded501940a32c69c512956b0524'
            'aec0c8dbd0b370cc33f4c919f7881ed36b1c8674a0f64d2a4c4bda46f944f23a')

prepare() {
  # build with bazel 7.0.0
  # bazel in the ArchLinux is not working
  mkdir -p ${srcdir}/bin
  bazel_version=7.0.0
  wget https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-linux-x86_64 -O ${srcdir}/bin/bazel
  chmod +x ${srcdir}/bin/bazel
  export PATH=${srcdir}/bin:${PATH}
  bazel --version | sed 's/bazel //' >"${srcdir}/${_pkgname}-${pkgver}/.bazelversion"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-update-rules_apple.patch"
  patch -p1 -i "${srcdir}/0002-delete-unused-com_google_protobuf_fixes.diff.patch"
  patch -p1 -i "${srcdir}/0004-use-opencv4-headers.patch"
  patch -p1 -i "${srcdir}/0005-add-arg-experimental_allow_proto3_optional-to-protoc.patch"
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
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # remove rpath and fix permission
  find ${pkgdir} -type f -name "*.so" -exec patchelf --remove-rpath {} \;
  find ${pkgdir} -type f -name "*.so" -exec chmod 755 {} \;
}
# vim:set ts=2 sw=2 et:

