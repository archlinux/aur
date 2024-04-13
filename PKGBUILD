# Maintainer: Alexis Peypelut <iroalexis@outlook.fr>
# Based on the work of Robin Candau for packaged fastfetch
#
# Inspired by https://github.com/Frogging-Family/neofrog-git

pkgname=fastfrog-git
_pkgname=fastfetch
pkgver=2.9.1
pkgrel=1
pkgdesc="Like Neofetch, but much faster because written in C"
arch=('x86_64')
url="https://github.com/fastfetch-cli/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('glibc')
makedepends=(
  'chafa'
  'cmake'
  'dbus'
  'dconf'
  'ddcutil'
  'directx-headers'
  'git'
  'imagemagick'
  'libnm'
  'libpulse'
  'libxcb'
  'libxrandr'
  'mesa'
  'ocl-icd'
  'opencl-headers'
  'vulkan-headers'
  'vulkan-icd-loader'
  'wayland'
  'xfconf'
  'zlib'
)
optdepends=(
  'chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'ddcutil: Brightness detection of external displays'
  'directx-headers: GPU detection in WSL'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Wifi detection'
  'libpulse: Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'hwdata: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol'
  'libdrm: Displays detection'
)
source=("${pkgname}::git+${url}.git#branch=master"
        "frog.patch")
sha256sums=('SKIP'
            '9e9d26e7df431299e84c92dda99a17cb471ee15b29a280adc34fb247891e8ca5')

pkgver() {
	git -C "$pkgname" describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
	git -C "${pkgname}" am "${srcdir}"/frog.patch
}

build() {
	cmake -B build -S "${pkgname}" \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DBUILD_TESTS='OFF' \
		-DENABLE_SQLITE3='OFF' \
		-DENABLE_RPM='OFF' \
		-DENABLE_IMAGEMAGICK6='OFF' \
		-DENABLE_DDCUTIL='ON' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
