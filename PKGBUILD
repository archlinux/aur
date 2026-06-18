# Maintainer: taotieren <admin@taotieren.com>

pkgname=candle-git
pkgver=11.2.r8.ga4798f6
pkgrel=1
pkgdesc="GRBL controller application with G-Code visualizer written in Qt"
arch=($CARCH)
url="https://github.com/Denvi/Candle"
license=('GPL-3.0-only')
depends=(
	glibc
	libgcc
	libstdc++
	hicolor-icon-theme
	qt5-base
	qt5-multimedia
	qt5-script
	qt5-serialport
	qt5-tools
	qt5-websockets
)
makedepends=(
	cmake
	ninja
	git
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
    "${pkgname%-git}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	(
        set -o pipefail
        git describe --exclude=nightly --long --tag --abbrev=7 2>/dev/null |sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

# prepare() {
# 	cd "${srcdir}/${pkgname%-git}"
# }

build() {
	cd "${srcdir}/${pkgname%-git}"
	# see：https://wiki.archlinux.org/title/CMake_package_guidelines
	cmake -DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr/share/candle \
		-Wno-dev \
		-B build \
		-G Ninja

	ninja -C build
}

# check() {
# 	cd "${srcdir}"/${pkgname%-git}/
# 	ninja -C build test
# }

package() {
	cd "${srcdir}"/${pkgname%-git}/
	DESTDIR="${pkgdir}" ninja -C build install
	install -vdm755 ${pkgdir}/usr/bin/
	ln -sf /usr/share/candle/candle ${pkgdir}/usr/bin/candle
	install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -vDm644 src/candle/images/icon.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/candle.svg
	install -vDm644 deploy/linux/usr/share/applications/candle.desktop -t  "${pkgdir}/usr/share/applications/"
}
