# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=apriltag-trackers-git
_name="${pkgname%-git}"
pkgver=r241.a7bf334
pkgrel=1
pkgdesc="Full-body tracking in VR using AprilTag markers."
arch=('x86_64')
url="https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker"
license=('MIT')
depends=('opencv-git' 'openvr' 'apriltag' 'wxgtk3')
makedepends=('cmake' 'git' 'wxgtk3-dev')
provides=("${_name}")
conflicts=("${_name}")
install="${pkgname%-git}.install"
source=("${_name}::git+https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker#branch=linux"
		"bridge-driver::git+https://github.com/ju1ce/Simple-OpenVR-Bridge-Driver#branch=linux"
		"https://raw.githubusercontent.com/sgorsten/linalg/main/linalg.h"
		"cmake.patch"
		"trackers.patch"
		"driver.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'b67b4c9000da87525d897be3cbd82bc333026c818fb9fd6edba3372568419a40'
            'b564a70f77293520bbc20b65858428785fc6d711848a554db0a027503130064f'
            'f0426aa8e254e4590f73812bc8a0ddf28195df0395654ab0acf78aec6b478941'
            'c0b90491f06c6768ba912c5e8850a60625b4d97066d67678bc91096588c7e163')

pkgver() {
	cd "$srcdir/${_name}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_name}"
	# patch --binary -p1 -i "$srcdir/${_name}.patch"

	patch -p1 -i "$srcdir/trackers.patch"
	patch --binary -p1 -i "$srcdir/cmake.patch"

	cd "$srcdir/bridge-driver"
	patch -p1 -i "$srcdir/driver.patch"

	cp "$srcdir/linalg.h" libraries/linalg/
}

build() {
	cd "$srcdir/${_name}"

	cmake -B build -S "$srcdir/${_name}/AprilTagTrackers" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	cmake --build build

	cd "$srcdir/bridge-driver"

	cmake -B build -S "$srcdir/bridge-driver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	cmake --build build
}

package() {
	# DESTDIR="$pkgdir" cmake --install build # Doesn't do anything
	cd "$srcdir/${_name}"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm755 build/AprilTagTrackers "$pkgdir/usr/bin/apriltag-trackers"

	cd "$srcdir/bridge-driver"

	install -Dm644 build/apriltagtrackers/bin/linux64/driver_apriltagtrackers.so -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/bin/linux64/"
    install -Dm644 build/apriltagtrackers/driver.vrdrivermanifest -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/"
	install -d "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"

	cp -r build/apriltagtrackers/resources/ "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"
}
