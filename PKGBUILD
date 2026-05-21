# Maintainer: Maxsspeaker <maxkorzun123@gmail.com>

pkgname=obs-linux-openvr
pkgver=1.9.0pre
pkgrel=1
pkgdesc="OpenVR Capture plugin for OBS Studio on Linux"
arch=('x86_64')
url="https://github.com/maxsspeaker/OpenVR-Capture-Linux"
license=('GPL2')
depends=('obs-studio' 'openvr' 'glfw>=3.0.0')
makedepends=(
    'cmake'
    'git'
    'mesa'
)
source=(
    "git+https://github.com/maxsspeaker/OpenVR-Capture-Linux#tag=v1.9.0pre-linux"
    "git+https://github.com/obsproject/obs-studio.git#commit=fb4d98bf88fae5fc85cb"
    "git+https://github.com/ValveSoftware/openvr.git#commit=0924064316de3effbcd1"

)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)


prepare() {
	cd "$srcdir/obs-studio"
	git submodule update --init --recursive

	cp -r "$srcdir/OpenVR-Capture-Linux/plugins/"* \
	      "$srcdir/obs-studio/plugins/"

	cp -r "$srcdir/openvr" \
	      "$srcdir/obs-studio/deps/"

	if ! grep -qxF 'add_obs_plugin(linux-openvr PLATFORMS LINUX)' plugins/CMakeLists.txt; then
        printf '\nadd_obs_plugin(linux-openvr PLATFORMS LINUX)\n' >> plugins/CMakeLists.txt
    fi

}

build() {
	cd "$srcdir/obs-studio"

	cmake -S . -B build_ubuntu -G Ninja

	cmake --build build_ubuntu -j$(nproc) --target linux-openvr
}

package() {

	find "$srcdir/obs-studio/build_ubuntu" -name 'linux-openvr.so'

    install -Dm777 \
        "$srcdir/obs-studio/build_ubuntu/plugins/linux-openvr/linux-openvr.so" \
        "$pkgdir/usr/lib/obs-plugins/linux-openvr.so"

}
