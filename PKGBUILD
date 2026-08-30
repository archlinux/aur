# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
# Maintainer: Hu Butui <hot123tea123@gmail.com>

pkgname=python-mediapipe-git
pkgver=1.0.0.r85.251c0cb96
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
  git
  patchelf
  python-build
  python-installer
  python-setuptools
  python-wheel
  wget
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname}::git+https://github.com/google-ai-edge/mediapipe.git"
        "0004-use-opencv-headers.patch"
        "0005-set-hermetic-python-version-and-disable-odml-converter.patch"
        "0006-opencv5-geometry-header.patch"
        "0007-bump-rules-java.patch"
)
sha256sums=('SKIP'
            'd18e88a217a00dc77cf2bfaa1d33b5fbc912deed5df686b0d2455fb0db75a677'
            '62cbd43346e7a7705127656a74bec44852e5bbfc006c4723005fdd23af5258db'
            'fb082d88d9cca47534ae01fca676a3afdb909bfc82d52c97cf0eaedf34571d5f'
            'bdead49ac5370dc84d9facee962bf2def5d9055d7339a37b2ba3f3b4bb02f811')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  # bazel in the ArchLinux is not working
  mkdir -p ${srcdir}/bin
  bazel_version=$(cat ${srcdir}/${pkgname}/.bazelversion)
  wget https://github.com/bazelbuild/bazel/releases/download/${bazel_version}/bazel-${bazel_version}-linux-x86_64 -O ${srcdir}/bin/bazel
  chmod +x ${srcdir}/bin/bazel
  export PATH=${srcdir}/bin:${PATH}
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/0004-use-opencv-headers.patch"
  patch -p1 -i "${srcdir}/0005-set-hermetic-python-version-and-disable-odml-converter.patch"
  patch -p1 -i "${srcdir}/0006-opencv5-geometry-header.patch"
  patch -p1 -i "${srcdir}/0007-bump-rules-java.patch"
  # set __version__
  formatted_version=$(echo $pkgver | sed 's/^v//; s/r\([0-9]*\)\./post\1+/')
  sed -i "s/^__version__ = .*/__version__ = '$formatted_version'/" setup.py
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
