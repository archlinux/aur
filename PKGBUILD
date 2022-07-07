# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=apriltag-trackers-git
_name="${pkgname%-git}"
pkgver=r538.e7cde55
pkgrel=2
pkgdesc="Full-body tracking in VR using AprilTag markers."
arch=('x86_64')
url="https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker"
license=('MIT')
depends=('opencv-git' 'openvr' 'apriltag' 'wxgtk3')
makedepends=('cmake' 'git')
provides=("${_name}")
conflicts=("${_name}")
install="${pkgname%-git}.install"
source=(
		"${_name}::git+https://github.com/ju1ce/April-Tag-VR-FullBody-Tracker"
		"bridge-driver::git+https://github.com/ju1ce/Simple-OpenVR-Bridge-Driver"
		"git+https://github.com/sgorsten/linalg"
		"${_name}.patch"
		"bridge-driver.patch"
		"${_name}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '7e7ead4354a582ae3eeacea3ed7dfe3aee157122f825313db0442c7baa555dc8'
            '4393499c484670ce1392e73533efd49b9809055c53b3df5b92cd54b45396748a'
            '9cc3bf832456119b2f9f978eb3aad0dfd644f2a899333214268b3b9620c257e0')

pkgver() {
	cd "$srcdir/${_name}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_name}"

	patch -p1 -i "$srcdir/${_name}.patch"

	git submodule init BridgeDriver
	git config submodule.BridgeDriver.url "$srcdir/bridge-driver"
	git submodule update BridgeDriver

	cd "BridgeDriver"

	patch -p1 -i "$srcdir/bridge-driver.patch"
	sed -n '/MIT License/,/ IN THE SOFTWARE./p' README.md > LICENSE.md

	git submodule init 'deps/linalg'
	git config submodule.'deps/linalg'.url "$srcdir/linalg"
	git submodule update 'deps/linalg'
}

build() {
	cd "$srcdir"

	export WX_CONFIG="/usr/bin/wx-config-gtk3"

	cmake -B build -S "$srcdir/${_name}" \
        -DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/' \
		-DDEPS_SKIP_BUILD=true \
        -Wno-dev
	DESTDIR="$srcdir/build/" cmake --build build
	DESTDIR="$srcdir/build/" cmake --install build
}

package() {
	cd "$srcdir"

	install -Dm644 "${_name}/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -Dm755 "${_name}.sh" "$pkgdir/usr/bin/${_name}"
	install -Dm755 build/AprilTagTrackers/AprilTagTrackers -t "$pkgdir/usr/lib/apriltagtrackers/"

	install -d "$pkgdir/usr/share/apriltagtrackers/bindings/"
	install -d "$pkgdir/usr/share/apriltagtrackers/images-to-print/"
	install -d "$pkgdir/usr/share/apriltagtrackers/locales/"

	cp -r build/bindings/** "$pkgdir/usr/share/apriltagtrackers/bindings/"
	cp -r build/images-to-print/** "$pkgdir/usr/share/apriltagtrackers/images-to-print/"
	cp -r build/locales/** "$pkgdir/usr/share/apriltagtrackers/locales/"

	install -Dm644 "${_name}/BridgeDriver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Bridge-Driver.md"

	install -Dm644 build/BridgeDriver/driver_apriltagtrackers.so -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/bin/linux64/"
    install -Dm644 build/driver_files/apriltagtrackers/driver.vrdrivermanifest -t "$pkgdir/usr/lib/steamvr/apriltagtrackers/"
	install -d "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"

	cp -r build/driver_files/apriltagtrackers/resources/** "$pkgdir/usr/lib/steamvr/apriltagtrackers/resources/"
}
