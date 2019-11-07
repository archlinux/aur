# Maintainer: Vincent Davis <vdavis2495@gmail.com>
# Contributor: Vincent Davis <vdavis2495@gmail.com>
pkgname='lucurious-git'
pkgver=0.0.1
pkgrel=1
license=('MIT')
pkgdesc='[Desktop Engine, Library] for building and styling 2D/3D Vulkan Wayland Compositors'
url='https://github.com/EasyIP2023/lucurious'
arch=('x86_64')
depends=('shaderc' 'vulkan-driver' 'vulkan-icd-loader' 'cglm' 'wayland')
makedepends=('meson' 'ninja' 'git' 'wayland-protocols' 'vulkan-headers' 'check')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "${pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	rm -rf build
	meson build
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
