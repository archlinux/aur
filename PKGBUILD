# Maintainer: Young Acinonyx <young.acinonyx [at] gmail [dot] com>

pkgname=ckmame-git
pkgver=r2575.5aae78b0
pkgrel=2
pkgdesc="A program to check ROM sets for MAME, the Multiple Arcade Machine Emulator. Git version."
arch=('any')
url="https://nih.at/ckmame/"
license=('custom')
depends=('zlib>=1.1.2' 'libzip>=1.8.0' 'sqlite')
checkdepends=('perl')
optdepends=('libxml2: for M.A.M.E. -listxml and detectors'
	    'libarchive: for reading from 7z archives')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nih-at/ckmame.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Include missing header to avoid compilation errors, but test whether the change needs to be made, just in case it has already been fixed upstream
	cd "${srcdir}/${pkgname%-git}/src"
	if [[ -z $(grep '#include "limits"' check_game_files.cc) ]]
		then
		sed -i "s/\($(cat check_game_files.cc | grep -iE '#include ".*"' | tail -n 1)\)/\1\n#include \"limits\"/" check_game_files.cc
	fi
}

build() {
	cmake -B "${pkgname%-git}/build" -S "${srcdir}/${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
	        -Wno-dev
	cd "${srcdir}/${pkgname%-git}/build"
	make
}

check() {
	cd "${pkgname%-git}/build"
	make -k check
}

package() {
	cd "${pkgname%-git}/build"
	make DESTDIR="${pkgdir}/" install
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
