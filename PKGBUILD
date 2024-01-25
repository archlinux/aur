# Maintainer: Colbie Dison <cdison at protonmail dot com>

_pkgname=cyberether
pkgname="$_pkgname"-git
pkgdesc="Multi-platform GPU-accelerated interface for compute-intensive pipelines"
pkgver=r387.1bb1bbb
pkgrel=2
install="$_pkgname".install
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
	'python-yaml: Preloaded examples metadata'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/luigifcruz/CyberEther"
license=('MIT')
source=(
	'CyberEther::git+'"$url"'.git'
	'cyberether.desktop'
)
sha256sums=(
	'SKIP'
	'1d8aca0a76e8c963ed372136eb1d0fc08624b21a4800b1af950f71187160efe3'
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
	ninja $NINJAFLAGS -C build
}

package() {
	cd "$srcdir/CyberEther"

	DESTDIR="$pkgdir" ninja -C build install
	# remove fmt files
	cd "$pkgdir"
	rm -rf usr/include/fmt
	rm -rf usr/lib/pkgconfig/fmt.pc

	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/CyberEther/LICENSE"

	install -m644 -Dt "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps" "${srcdir}/CyberEther/resources/cyberether.png"
	install -m644 -Dt "${pkgdir}/usr/share/applications" "${srcdir}/cyberether.desktop"
}
