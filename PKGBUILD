# Maintainer: Tillmann Severin <tillmann.zipperer@web.de>
pkgname=smolkit-git
pkgver=r117.46bbfd5
pkgrel=1
pkgdesc="A low-footprint drop-in replacement for polkit"
arch=('x86_64')
url="https://github.com/bmwcarit/smolkit"
license=('Apache-2.0')
groups=()
depends=('sdbus-cpp' 'rapidjson' 'glibc' 'systemd-libs' 'libstdc++')
makedepends=('git' 'cmake' 'ninja')
checkdepends=('gtest' 'python-pytest' 'python-dbus')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "polkit")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/bmwcarit/smolkit#commit=46bbfd5c922a8d03a534398ee129ded822dfcafe'
    '0001-Remove-FORTIFY_SOURCE-2-as-arch-uses-FORTIFY_SOURCE-.patch')
noextract=()
sha256sums=('SKIP' '1a4acc4f4037d8f730e53e45279f7466008f757434350adb689998f9845c4520')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    patch -p1 -i "$srcdir/0001-Remove-FORTIFY_SOURCE-2-as-arch-uses-FORTIFY_SOURCE-.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cmake -S . -B build -G Ninja
    cmake --build build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    cmake -S . -B build -G Ninja -DBUILD_TESTING=On
    cmake --build build
    cd build
    ctest --output-on-failure
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cmake --install "$srcdir/${pkgname%-git}/build" --prefix "$pkgdir"
}
