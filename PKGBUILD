# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanogui-git
pkgver=r526.c650530
pkgrel=1
pkgdesc="A minimalistic cross-platform widget library for OpenGL 3+, GLES 2/3, and Metal"
arch=("x86_64")
url="https://github.com/mitsuba-renderer/nanogui"
license=('BSD')
groups=()
depends=('glfw' 'python')
makedepends=('git' 'cmake' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("nanogui::git+https://github.com/mitsuba-renderer/${pkgname%-git}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule update --init --recursive
	sed -i "3i include(CMakePackageConfigHelpers)" CMakeLists.txt	
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_INCLUDEDIR=/usr/include -DCMAKE_INSTALL_PREFIX=/usr -DNANOGUI_BUILD_EXAMPLES=OFF -DNANOGUI_BUILD_GLFW=OFF -B build -S .
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make -C build DESTDIR="$pkgdir/" install
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt
}
