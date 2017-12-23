# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=ctk-widgets-git
pkgver=0.1.0.r5382.f904f960
pkgrel=1
pkgdesc='A collection of Qt Widgets for usage in biomedical imaging applications'
arch=('i686' 'x86_64')
url="https://github.com/commontk/CTK/"
license=('APACHE')
depends=('qt5-tools')
makedepends=('git' 'cmake>=2.8.12')
conflicts=('ctk')
source=('git://github.com/commontk/CTK.git')
sha512sums=('SKIP')

pkgver() {
  cd CTK
  echo "$(grep "set(CTK_MAJOR_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).$(grep "set(CTK_MINOR_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).$(grep "set(CTK_PATCH_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../CTK \
    -DCTK_SUPERBUILD=OFF \
    -DCTK_QT_VERSION=5 \
    -DCTK_LIB_Widgets=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd CTK
  cp \
    CMake/ctkFunctionGeneratePluginUseFile.cmake \
    CMake/ctkFunctionExtractPluginTargets.cmake \
    CMake/ctkFunctionGetAllPluginTargets.cmake \
    CMake/ctkFunctionGetTargetDependencies.cmake \
    CMake/ctkFunctionGetPluginDependencies.cmake \
    CMake/ctkMacroSetupPlugins.cmake \
    ${pkgdir}/usr/lib/ctk-*/CMake
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/ctk-widgets-git/LICENSE
}
