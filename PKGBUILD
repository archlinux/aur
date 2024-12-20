# Maintainer: Premysl Srubar <premysl.srubar at gmail com>
# Maintainer: Hu Butui <hot123tea123@gmail.com>

pkgname=python-mediapipe-git
pkgver=0.10.18.r137.0cd1f15d5
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

source=("${pkgname}::git+https://github.com/google/mediapipe.git"
        "0004-use-opencv4-headers.patch"
)
sha256sums=('SKIP'
            '0f05849960ae21db7d3c1059f2c27a3358ba992f634a03b58b75b61f5031d345')

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
  bazel --version | sed 's/bazel //' > "${srcdir}/${pkgname}/.bazelversion"
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/0004-use-opencv4-headers.patch"
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
