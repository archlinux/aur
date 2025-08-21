# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: TheAssassin

pkgname=appimagelauncher-git
pkgver=r1334.8f80428
pkgrel=1
pkgdesc="A Helper application for running and integrating AppImages."
arch=(x86_64)
url="https://github.com/TheAssassin/AppImageLauncher"
license=(MIT)
depends=(qt5-base qt5-declarative fuse2

         # namcap implicit depends
         glibc gcc-libs glib2 zstd cairo librsvg xz libarchive zlib
         )
makedepends=(git cmake boost qt5-tools libxpm lib32-glibc lib32-gcc-libs xxd patchelf argagg nlohmann-json)
provides=(appimagelauncher)
conflicts=(appimagelauncher)
source=("git+https://github.com/TheAssassin/AppImageLauncher.git"
        'appimage-binfmt-remove.hook')
sha256sums=('SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd AppImageLauncher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Fails to build with CMAKE_BUILD_TYPE=None
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  local _flags=(
    -DBUILD_TESTING=OFF
    -DFETCHCONTENT_QUIET=OFF
    -DCPR_FORCE_USE_SYSTEM_CURL=ON
  )

  cmake -B build -S "AppImageLauncher" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd AppImageLauncher
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../appimage-binfmt-remove.hook "$pkgdir"/usr/share/libalpm/hooks/appimage-binfmt-remove.hook
}
