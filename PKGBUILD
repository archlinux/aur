# Maintainer: Colbie Dison <cdison at protonmail dot com>

_pkgname=cyberether
pkgname="$_pkgname"-git
pkgdesc="Multi-platform GPU-accelerated interface for compute-intensive pipelines"
pkgver=r387.1bb1bbb
pkgrel=1
arch=('x86_64')
makedepends=('git' 'cmake' 'pkg-config' 'ninja' 'meson' 'zenity')
depends=(
	'glslang' 'glfw'
	'spirv-cross'
	'vulkan-icd-loader' 'vulkan-utility-libraries' 'vulkan-headers'
	'fmt'
)
optdepends=(
	'soapysdr: SoapySDR block'
	'soapyrtlsdr: SoapySDR block with RTL-SDR support'
	'gstreamer: Remote capabilities'
	'gst-plugins-base: Remote capabilities'
	'gst-plugins-good: Remote capabilities'
	'gst-libav: Remote capabilities'
	'cuda: CUDA compute backend support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/luigifcruz/CyberEther"
license=('MIT')
source=(
	'CyberEther::git+'"$url"'.git'
	'LICENSE'
)
sha256sums=(
	'SKIP'
	'ba3742d029fe929a9f840583f6a84c8c93c0b6955e5eb379f05724dbbf9e167e'
)

pkgver() {
        cd "$srcdir/CyberEther"

        ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" )
}

prepare() {
	cd "$srcdir/CyberEther"

	if [ -d build ]; then
		rm -rf build
	fi
}

build() {
	cd "$srcdir/CyberEther"

	meson setup --reconfigure -Dprefix=/usr -Dbuildtype=release build
	ninja -C build
}

package() {
	cd "$srcdir/CyberEther"

	DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
	# remove fmt files
	cd "$pkgdir"
	rm -rf usr/include/fmt
	rm -rf usr/lib/pkgconfig/fmt.pc

	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
