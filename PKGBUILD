# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=codevis-db-git
pkgver=r768.98f5081
pkgrel=1
pkgdesc="an analysis and visualization tool designed to assist in code maintenance for C++ codebases"
arch=('x86_64')
url="https://invent.kde.org/sdk/codevis"
license=('Apache-2.0')
depends=('soci' 'qt5-base' 'lcov' 'clang' 'boost-libs' 'qt5-webengine' 'python' 'qt5-svg' 'llvm-libs' 'kparts5' 'knotifications5' 'kcrash5' 'kxmlgui5' 'ktexteditor5' 'karchive5' 'knewstuff5' 'kconfigwidgets5' 'kcoreaddons5' 'kcmutils5' 'kconfig5' 'ki18n5' 'kwidgetsaddons5' 'python-jinja-time' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'llvm' 'boost' 'extra-cmake-modules' 'kdoctools5' 'backward-cpp')
checkdepends=('catch2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://invent.kde.org/sdk/codevis.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-db-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-db-git}"
# patch by Eidokan
#   Make sure we don't use the bundled versions of Soci and backward-cpp
    rm -rf ./thirdparty/soci ./submodules/backward-cpp

#   Find packaged version of backward-cpp instead of including the bundled one
    patch ./desktopapp/CMakeLists.txt <<PATCH
4c4
< include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/../submodules/backward-cpp)
---
> find_package(Backward REQUIRED)
PATCH

#   Find packaged version of SOCI instead of including the bundled one
    patch ./thirdparty/CMakeLists.txt <<PATCH
16c16
< add_subdirectory(soci \${SOCI_BINARY_DIR})
---
> find_package(SOCI REQUIRED)
PATCH

#   Fix names of SOCI libraries to match those of the AUR package
    sed -i -e 's/Soci::core/soci_core/' ./lvt{ldr,mdb}/CMakeLists.txt
    sed -i -e 's/Soci::sqlite3/soci_sqlite3/' ./lvt{ldr,mdb}/CMakeLists.txt
}

build() {
	cmake -B build -S "${pkgname%-db-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCOMPILE_TESTS='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
QT_QPA_PLATFORM='offscreen' ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
