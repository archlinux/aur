# Maintainer: heavysink <winstonwu91@gmail.com>
_pkgname=eka2l1
pkgname="${_pkgname}-git"
pkgver=5645.9a54eb66f
pkgrel=2
pkgdesc="Experimental Symbian OS emulator (GIT version)"
arch=('x86_64')
url="https://github.com/EKA2L1/EKA2L1"
license=('GPL2')
makedepends=(
	'boost'
	'cmake'
	'git'
	'ccache'
    'glfw'
    'vulkan-headers'
    'python'
    'qt6-tools'
    'imagemagick'
    'clang'
)
depends=(
	'boost-libs'
  'qt6-base'
  'qt6-svg'
  'qt6-declarative'
    'freetype2'
    'pango'
	'vulkan-icd-loader'
  'gtk3'
  'sdl2'
)
install="eka2l1-git.install"
provides=('eka2l1')
conflicts=('eka2l1')
source=(
	"${_pkgname}-git::git+https://github.com/EKA2L1/EKA2L1.git"
  "eka2l1_qt"
)
md5sums=('SKIP'
         '904f15dfd859ab3c10d7f1b9a78db41d')

pkgver() {
	cd "${_pkgname}-git"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}-git"
	git submodule update --recursive --init
    sed -i 's/-Werror//g' src/external/mbedtls/CMakeLists.txt
    #sed -i 's/constexpr size_t signal_stack_size = std::max(SIGSTKSZ/const size_t signal_stack_size = std::max<size_t>(SIGSTKSZ/g' src/external/dynarmic/src/backend/x64/exception_handler_posix.cpp 
}

build() {
	cd "${srcdir}/${_pkgname}-git"

    cmake -B build -DCMAKE_BUILD_TYPE=Release -DEKA2L1_NO_TERMINAL=ON -DEKA2L1_ENABLE_UNEXPECTED_EXCEPTION_HANDLER=ON -DEKA2L1_BUILD_VULKAN_BACKEND=OFF -DEKA2L1_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/opt/eka2l1 .

    cd build

    make
}

package() {
	cd "${srcdir}/${_pkgname}-git/build"

 install -d -m 755 "${pkgdir}/opt"
 install -d -m 777 "${pkgdir}/opt/eka2l1"
 install -d -m 755 "${pkgdir}/usr/bin"
 cp -R "${srcdir}/${_pkgname}-git/build/bin/." "${pkgdir}/opt/eka2l1"
 install -m 755 ${srcdir}/eka2l1_qt "${pkgdir}/usr/bin/eka2l1_qt"
 for s in 16 24 32 48 64 96 128 512; do
    install -d -m 755 "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps"
    convert "${srcdir}/${_pkgname}-git/src/emu/qt/duck_tank.ico" -resize ${s}x${s} "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/duck_tank.png"
 done
 install -d -m 755 "${pkgdir}/usr/share/applications"
 install -m 644 "${srcdir}/${_pkgname}-git/src/emu/qt/eka2l1.desktop" "${pkgdir}/usr/share/applications/eka2l1.desktop"
}
