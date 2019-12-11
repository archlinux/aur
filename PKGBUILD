# Maintainer: jaelpark@outlook.com
pkgname=chamfer-git
_pkgname=chamfer
pkgver=r263
pkgrel=1
pkgdesc="A tiling X11 window manager with Vulkan compositor."
arch=("x86_64")
url="https://github.com/jaelpark/chamferwm"
license=("BSD")
depends=(
	'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-cursor' 'vulkan-icd-loader' 'glm' 'boost' 'python' 'python-xlib' 'python-psutil'
)
makedepends=(
    'git' 'meson' 'ninja' 'vulkan-headers' 'shaderc'
)
#optdepends=(
#	'python-psutil': launch processes'
#)
source=(
	"${_pkgname}"::'git+https://github.com/jaelpark/chamferwm.git'
)
md5sums=("SKIP")
options=(!buildflags)

pkgver() {
    cd "${srcdir}/${_pkgname}"
	echo r$(git rev-list --count master)
}

build() {
    cd "${srcdir}/${_pkgname}"
	if [ -d build ]; then
		rm -rf build
	fi
	meson --buildtype=release build
    ninja -C build
}

package() {
    cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/usr/bin
	cp build/chamfer ${pkgdir}/usr/bin/.
	mkdir -p ${pkgdir}/usr/share/chamfer/{shaders,config}
	cp build/*.spv ${pkgdir}/usr/share/chamfer/shaders/.
	cp config/* ${pkgdir}/usr/share/chamfer/config/.
	mkdir -p ${pkgdir}/usr/share/xsessions
	cp share/* ${pkgdir}/usr/share/xsessions/.
}

