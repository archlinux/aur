# Maintainer: taotieren <admin@taotieren.com>

pkgname=dtk-candle-git
pkgver=r28.acf33ab
pkgrel=5
pkgdesc="A DTK6/Qt6 desktop application for temporarily preventing automatic screen dimming, locking, and system sleep by simulating NumLock key presses"
arch=($CARCH)
url="https://github.com/HuanSoft-Open-Source-Community/candle"
license=('GPL-3.0-only')
depends=(
	dtk6core
	dtk6log
	dtk6widget
	glib2
	hicolor-icon-theme
	libgcc_s.so
    libstdc++.so
	libxcb
	qt6-base
	libwayland-client.so
)
makedepends=(
	cmake
	ninja
	dtk6gui
	git
	qt6-tools
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
	cd "${srcdir}/${pkgname}"
	sed -i 's|/opt/apps/org.yxzl.candle|/usr|g' CMakeLists.txt
}

build() {
	cd "${srcdir}/${pkgname}"
	# see：https://wiki.archlinux.org/title/CMake_package_guidelines
	cmake -DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		-B build \
		-G Ninja

	ninja -C build
}

# check() {
# 	cd "${srcdir}"/${pkgname}/
# 	ninja -C build test
# }

package() {
	cd "${srcdir}"/${pkgname}/
	DESTDIR="${pkgdir}" ninja -C build install
	install -vDm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -vDm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-candle.rules" << EOF
KERNEL=="uinput", MODE="0660", GROUP="input", TAG+="uaccess"
EOF
	install -vDm644 /dev/stdin "${pkgdir}/usr/share/applications/org.yxzl.candle.desktop" << EOF
[Desktop Entry]
Name=Candle
Name[zh_CN]=秉烛
Comment=Prevent screen dimming and system sleep
Comment[zh_CN]=防止屏幕变暗和系统休眠
Exec=candle
Icon=org.yxzl.candle
Type=Application
Categories=Utility;System;
Terminal=false
StartupNotify=true
EOF
}
