# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
# Maintainer: Hu Butui <hot123tea123@gmail.com>

pkgname=python-mediapipe-git
pkgver=0.10.9.r331.377f7d77b
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
  bazel
  git
  patchelf
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname}::git+https://github.com/google/mediapipe.git"
        "0001-update-rules_apple.patch"
        "0002-delete-unused-com_google_protobuf_fixes.diff.patch"
        "0003-fix-building-for-gcc-13-add-cstdint.patch"
        "0004-use-opencv4-headers.patch"
        "0005-add-arg-experimental_allow_proto3_optional-to-protoc.patch"
)
sha256sums=('SKIP'
            'a6b63bd50d32e2d8ac50a84173931d0d1ad66f3f4e5f9017cc43ffdda2369de8'
            '1c1577095c85a24e491292aab7cccda98632297c732147a80ba1d8a30d398674'
            '213bd6cf43516a83b40af1dedfd8010b80284ea917f13ca797f4fbc9ea201559'
            '0f05849960ae21db7d3c1059f2c27a3358ba992f634a03b58b75b61f5031d345'
            '827ed2dc593f2659b6092c22c13fa4fb4d3b72ae6a3a08b7e3fcacbbcc3be7bd')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  bazel --version | sed 's/bazel //' > "${srcdir}/${pkgname}/.bazelversion"
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/0001-update-rules_apple.patch"
  patch -p1 -i "${srcdir}/0002-delete-unused-com_google_protobuf_fixes.diff.patch"
  patch -p1 -i "${srcdir}/0003-fix-building-for-gcc-13-add-cstdint.patch"
  patch -p1 -i "${srcdir}/0004-use-opencv4-headers.patch"
  patch -p1 -i "${srcdir}/0005-add-arg-experimental_allow_proto3_optional-to-protoc.patch"
  # set __version__
  formatted_version=$(echo $pkgver | sed 's/^v//; s/r\([0-9]*\)\./post\1+/')
  sed -i "s/^__version__ = .*/__version__ = '$formatted_version'/" setup.py
  # sed -i "s/__version__ = 'dev'/__version__ = '$pkgver'/" setup.py
  # set link_opencv to True
  sed -i "s/self.link_opencv = False/self.link_opencv = True/g" setup.py
}

build() {
  cd "${srcdir}/${pkgname}"
  # enable building with GPU support, using opengl-driver
  # opengl-driver is provided by mesa or nvidia-utils
  MEDIAPIPE_DISABLE_GPU=0 \
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # remove rpath and fix permission
  find ${pkgdir} -type f -name "*.so" -exec patchelf --remove-rpath {} \;
  find ${pkgdir} -type f -name "*.so" -exec chmod 755 {} \;
}
# vim:set ts=2 sw=2 et:
