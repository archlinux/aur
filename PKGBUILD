# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=maki-git
pkgver=r126.91ac415
pkgrel=1
epoch=
pkgdesc="Maki is a Quick File Previewer for KDE Plasma."
arch=('x86_64')
url="https://invent.kde.org/system/maki"
license=('GPL-3.0-or-later' 'BSD-2-Clause')
groups=()
depends=('kcoreaddons' 'mpvqt' 'libstdc++' 'kirigami' 'kdbusaddons' 'ki18n'
	 'kio' 'kfilemetadata' 'hicolor-icon-theme' 'karchive' 'syntax-highlighting'
	 'kservice' 'glibc' 'qt6-base' 'qt6-declarative' 'kirigami-addons'
	)
makedepends=('extra-cmake-modules' 'git' 'ninja' 'cmake' 'vulkan-headers' 'appstream'
	     'qt6-webengine'
	)
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname::-4}"
}

build() {
	cd "$srcdir"

	cmake -B build \
	-S "${pkgname::-4}" \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_SKIP_INSTALL_RPATH=ON \
	-DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "$srcdir/${pkgname::-4}/LICENSES/BSD-2-Clause.txt" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
