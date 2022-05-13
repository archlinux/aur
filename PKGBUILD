# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=apriltag-trackers-git
_name="${pkgname%-git}"
pkgver=r424.27d3098
pkgrel=2
pkgdesc="Full-body tracking in VR using AprilTag markers."
arch=('x86_64')
url="https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker"
license=('MIT')
depends=('opencv-git' 'openvr' 'apriltag' 'wxgtk3')
makedepends=('cmake' 'git' 'wxgtk3-dev')
provides=("${_name}")
conflicts=("${_name}")
install="${pkgname%-git}.install"
source=("${_name}::git+https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker"
		"bridge-driver::git+https://github.com/ju1ce/Simple-OpenVR-Bridge-Driver"
		"https://raw.githubusercontent.com/sgorsten/linalg/main/linalg.h"
		"${_name}.patch"
		"bridge-driver.patch"
		"${_name}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            'b67b4c9000da87525d897be3cbd82bc333026c818fb9fd6edba3372568419a40'
            'bd802d24fc738eeb787092c8c3a0d9f15cbc519aa9b5e87be6dd5984838f677a'
            'aa2da0e7c3f97bbb5da2d9c6637d8802d5c46f54fd48be464387ff13154d3bd1'
            '32bfe37436cab8b85360077d5cf1b331d5436d54fa0d15c78df6b686786fee7c')

pkgver() {
	cd "$srcdir/${_name}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_name}"
	
	patch -p1 -i "$srcdir/${_name}.patch"

	cd "$srcdir/bridge-driver"
	sed -n '/MIT License/,/ IN THE SOFTWARE./p' README.md > LICENSE.md

	patch -p1 -i "$srcdir/bridge-driver.patch"

	cp "$srcdir/linalg.h" libraries/linalg/
}

build() {
	cd "$srcdir/${_name}"

	cmake -B build -S "$srcdir/${_name}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
		-DSKIP_BUILD_DEPS=true \
        -Wno-dev
	DESTDIR="./fakedir" cmake --build build
	rm -rf ./fakedir

	cd "$srcdir/bridge-driver"

	cmake -B build -S "$srcdir/bridge-driver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	cmake --build build
}

package() {
	cd "$srcdir/${_name}"
	# DESTDIR="$pkgdir" cmake --install build

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm755 "$srcdir/${_name}.sh" "$pkgdir/usr/bin/${_name}"
	install -Dm755 build/AprilTagTrackers/AprilTagTrackers -t "$pkgdir/usr/lib/apriltagtrackers/"

	install -d "$pkgdir/usr/share/apriltagtrackers/bindings/"
	cp -r bindings/** "$pkgdir/usr/share/apriltagtrackers/bindings/"

	cd "$srcdir/bridge-driver"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Bridge-Driver.md"

	install -Dm644 build/apriltagtrackers/bin/linux64/driver_apriltagtrackers.so -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/bin/linux64/"
    install -Dm644 build/apriltagtrackers/driver.vrdrivermanifest -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/"
	install -d "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"

	cp -r build/apriltagtrackers/resources/** "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"
}
