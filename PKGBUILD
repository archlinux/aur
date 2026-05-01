# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=openmvs
pkgver=2.4.0
pkgrel=2
pkgdesc="open Multi-View Stereo reconstruction library with simple and automatic set of tools"
arch=(i686 x86_64)
url="https://cdcseacave.github.io"
license=(AGPL-3.0-only)
depends=(eigen openmp opencv boost-libs)
makedepends=(git cmake boost ceres-solver cgal nanoflann libjxl)
optdepends=(ceres-solver glfw libjxl)
options=()
# vcglib version: 2025.07
source=("${pkgname}::git+https://github.com/cdcseacave/openMVS.git#commit=58117204c86bbb11a0b25b26a8987676cf11274d"
        "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git#commit=c94ef4e12e9ea3ae986d9af91005be8328d13719"
        0001-Fix-boost-and-python3.patch
        )
sha256sums=('dcacfbd320b12dbc97ec05f6289f71e4ef084f54a2f39136e8bc0d6a0f24682e'
            '256dc102a2a55bb7362181871674c4561e2964e82545838a4efb7312547d4a51'
            '1eefced29c2b48d8376277c1b83ee2962d025aea2cfa6ad2b0bfde3e2264529b')

_use_cuda="${BUILD_CUDA:-OFF}"
if [ "$_use_cuda" = "ON" ]
then
  makedepends+=(cuda)
  optdepends+=(cuda)
fi

prepare() {
  cd "$pkgname"
  git apply "$srcdir/0001-Fix-boost-and-python3.patch"
}

build() {
  extra_opts=()
  if [ "$_use_cuda" = "ON" ]
  then
    extra_opts+=(-DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc)
  fi

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVCG_DIR="${srcdir}/vcglib" \
    -DOpenMVS_USE_CERES=ON \
    -DOpenMVS_USE_BREAKPAD=OFF \
    -DOpenMVS_USE_CUDA="${_use_cuda}" \
    "${extra_opts[@]}" \
    -S "$srcdir/$pkgname" \
    -B "$srcdir/build"
  make -C "$srcdir/build"
}

check() {
  make -C "$srcdir/build" test
}

package() {
  DESTDIR="$pkgdir/" make -C "$srcdir/build" install
  mv "$pkgdir"/usr/bin/OpenMVS/* "$pkgdir"/usr/bin
  rm "$pkgdir"/usr/bin/Tests
  rmdir "$pkgdir"/usr/bin/OpenMVS
}

