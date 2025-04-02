# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=3dfsb
pkgver=1.2.r17.g7c89d1a
pkgrel=1
pkgdesc="3D file browser"
arch=('i686' 'x86_64')
url="https://github.com/3dfsb-dev/3dfsb"
license=('GPL-2.0-or-later')
makedepends=('imagemagick' 'git' 'cmake' 'ninja' 'xxd')
depends=('freeglut' 'file' 'sdl_image' 'glu' 'gstreamer' 'xdotool')
source=("git+https://github.com/3dfsb-dev/3dfsb#commit=7c89d1a3f6b208427725915ca7a725241f12f0f5"
        'fix.patch'
        '3dfsb.desktop')
sha256sums=('9b1a0c8b664347f457af94bb315bef4db90eac1a7c43dc7f9c8e279a772fbd49'
            '12fb674fa6ed0a0880adb673e53a12a87e274e920f6288551ea134ac752d79d1'
            '7c6c88c8e0b1a5492f3537bd851a812a7b8b861da0d9f3a6c12c2c91d5e3d7da')

prepare() {
	cd "$pkgname"
	git apply '../fix.patch'
}

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cmake -S "${pkgname}" -B build -G Ninja \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_POLICY_VERSION_MINIMUM='3.5'
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "$pkgname/images/logo_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/3dfsb.png"
	install -Dm644 '3dfsb.desktop' -t "${pkgdir}/usr/share/applications"
}
