# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=openmvs
pkgver=2.4.0
pkgrel=3
pkgdesc="open Multi-View Stereo reconstruction library with simple and automatic set of tools"
arch=(i686 x86_64)
url="https://cdcseacave.github.io"
license=(AGPL-3.0-only)
depends=(eigen openmp opencv boost-libs imgui-full glfw)
makedepends=(git cmake boost ceres-solver cgal nanoflann libjxl vcpkg)
optdepends=(ceres-solver libjxl)
options=()
# vcglib version: 2025.07
# portable-file-dialogs version: 0.1.0
# vcpkg version: 2026.04.27
source=("${pkgname}::git+https://github.com/cdcseacave/openMVS.git#commit=58117204c86bbb11a0b25b26a8987676cf11274d"
        "vcglib::git+https://github.com/cnr-isti-vclab/vcglib.git#commit=c94ef4e12e9ea3ae986d9af91005be8328d13719"
        "portable-file-dialogs::git+https://github.com/samhocevar/portable-file-dialogs.git#commit=8ccf2a93f70d021842e72fd950eac2a0bb244eec"
        "vcpkg::git+https://github.com/microsoft/vcpkg.git#commit=56bb2411609227288b70117ead2c47585ba07713"
        0001-Fix-boost-python3-and-imgui.patch
        )
sha256sums=('dcacfbd320b12dbc97ec05f6289f71e4ef084f54a2f39136e8bc0d6a0f24682e'
            '256dc102a2a55bb7362181871674c4561e2964e82545838a4efb7312547d4a51'
            'e45638d4d25ecc8433099cf1ad4bc71f43fe794fb8a015297f24f04ecd508d47'
            'a5d305a05a147bcd81df22683cf5a7191fec045141e0717e41187adf7e262098'
            'dd1ef14d23b8df5a2549ac14f0a884aaafa2bef1a568825d5d9f8179a3e38b72')

_use_cuda="${BUILD_CUDA:-OFF}"
if [ "$_use_cuda" = "ON" ]
then
  makedepends+=(cuda)
  optdepends+=(cuda)
fi

prepare() {
  VCPKG_ROOT="$srcdir/vcpkg" vcpkg install --x-install-root="$srcdir/glad" glad
  cd "$pkgname"
  git apply "$srcdir/0001-Fix-boost-python3-and-imgui.patch"

}

build() {
  extra_opts=()
  if [ "$_use_cuda" = "ON" ]
  then
    extra_opts+=(-DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc)
  fi
  local glad_dir="$(dirname "$(find "$srcdir/glad" -name "gladConfig.cmake")")"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVCG_DIR="${srcdir}/vcglib" \
    -Dglad_DIR="$glad_dir" \
    -DPORTABLE_FILE_DIALOGS_INCLUDE_DIRS="$srcdir/portable-file-dialogs" \
    -DOpenMVS_USE_CERES=ON \
    -DOpenMVS_USE_BREAKPAD=OFF \
    -DOpenMVS_USE_CUDA="${_use_cuda}" \
    -DMIME_UPDATE_CMD="" \
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

