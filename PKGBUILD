# Maintainer: Kimiblock Moe
pkgname=(wechat-uos-bwrap wechat-uos-qt wechat-key-block)
pkgver=4.0.0.21
pkgrel=2
epoch=
pkgdesc="WeChat Qt, the so-called universal version"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com/"
license=('LicenseRef-proprietary')
groups=()
options=(!debug !strip lto)

makedepends+=(
		"ninja"
		"cmake"
	)

depends=(
	"xdg-user-dirs"
	"xorg-xhost"
	"findutils"
	"zenity"
	"xdg-dbus-proxy"
	"nss"
	"bubblewrap"
	"xcb-util-renderutil"
	"xcb-util-keysyms"
	"xcb-util-image"
	"xcb-util-wm"
	"libxkbcommon-x11"
	"libxkbcommon"
	"libxcb"
	"util-linux"
	"openssl-1.1"
	"libxcb"
	"gcc-libs"
	"nspr"
	"bzip2"
	"glibc"
	"zlib"
	"libxcomposite"
	"glib2"
	"wayland"
	"libxrender"
	"libxext"
	"alsa-lib"
	"dbus"
	"libxrandr"
	"fontconfig"
	"pango"
	"freetype2"
	"libxfixes"
	"cairo"
	"libx11"
	"expat"
	"at-spi2-core"
	"libxdamage"
	"libdrm"
	"mesa"
	"hicolor-icon-theme"
	"bash"
	"lsb-release"
	"psmisc"
	"wmctrl"
	"flatpak-xdg-utils"
)

optdepends=(
	'wechat: The meta package'
	'ttf-twemoji: An emoji font that will work with WeChat'
	'at-spi2-core: accessibility'
	'orca: screen reader'
)

makedepends+=(
	"libarchive"
)

checkdepends=()
replaces=("wechat-universal-bwrap" "wechat-beta-bwrap")

source=(
	wechat.sh
	wechat-uos-qt.desktop
	wechat-uos-qt.svg
	open.sh
	license.tar.gz
	user-dirs.dirs
	wechat.env
	keyBlocker.cpp
	CMakeLists.txt
	mimeapps.list
	flatpak-info
)

source_x86_64=(
	wechat-x86-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_amd64.deb"
)

source_aarch64=(
	wechat-arm-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_arm64.deb"
)

source_loong64=(
	wechat-loong64-${pkgver}.deb::"https://pro-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_${pkgver}_arm64.deb"
)


md5sums=('af2eca562c27faab90c5cd7534b86354'
         '5c4a2dd36966cecc3ac48a07a4e98cc5'
         '468e0367346707c026e577e7bf3e3a82'
         'b48d860c2d03ddb4ffa609fcd5fe6857'
         '6b159c6e9d21a98925489bc37a9aea43'
         '38e98220da64adc1d8f9dc17d04b3a39'
         '4e5386d52d5cac26cf48a24ea0d5e859'
         '6206b9cfc311c4763876419aaf78acad'
         '83c934cd928c7411c3b8e7d4e86fb52c'
         'e821fd2d05d6d39c7ecf118916922414'
         'e472d6dd49522bc90fdaf0b4adcdb744')
md5sums_x86_64=('b2df207e4a27c1a2930c1b07a62332d0')
md5sums_aarch64=('6e34513d6781c7698ea53c7efcf216a8')
md5sums_loong64=('6e34513d6781c7698ea53c7efcf216a8')

function build() {
	cd "${srcdir}"
	mkdir key-block -p
	cd key-block
	cp "${srcdir}"/{keyBlocker.cpp,CMakeLists.txt} "${srcdir}"/key-block/
	cmake -S . -B build -G "Ninja"
	cmake --build build
}

function package_wechat-key-block() {
	license=("CC-BY-SA-4.0")
	url="https://alampy.com/2024/07/15/block-hotkeys-for-wechat-uos/"
	pkgdesc="Block WeChat's hotkeys"
	install -Dm755 "${srcdir}"/key-block/build/keyBlocker.so \
		"${pkgdir}/usr/lib/wechat-uos-qt/keyBlocker.so"
}

function package_wechat-uos-qt() {
	conflicts=()
	replaces+=(wechat-universal-bwrap wechat-beta-bwrap wechat-uos-bwrap)
	tar -xf data.tar.xz ./opt/apps/com.tencent.wechat
	mkdir -p "${pkgdir}"/opt
	cp -r opt/apps/com.tencent.wechat \
		"${pkgdir}"/opt/wechat-uos-qt
	install -Dm644 wechat-uos-qt.desktop \
		"${pkgdir}/usr/share/applications/wechat-uos-qt.desktop"
	install -Dm755 wechat.sh \
		"${pkgdir}/usr/bin/wechat-uos-qt"
	install -Dm644 user-dirs.dirs \
		"${pkgdir}/usr/lib/wechat-uos-qt/user-dirs.dirs"
	install -Dm755 open.sh \
		"${pkgdir}/usr/lib/wechat-uos-qt/open"
	install -Dm644 wechat.env \
		"${pkgdir}/usr/lib/wechat-uos-qt/envs"
	install -Dm644 wechat-uos-qt.svg \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-uos-qt.svg"
	install -Dm644 mimeapps.list \
		"${pkgdir}/usr/lib/wechat-uos-qt/mimeapps.list"
	mkdir -p \
		"${pkgdir}/usr/share/wechat-uos-qt/license"
	install -d "${pkgdir}/usr/lib/license"
	chmod 0755 "${pkgdir}/usr/lib/license" -R
	cp "${srcdir}/license"/* -r "${pkgdir}/usr/share/wechat-uos-qt/license"
	chmod 0755 -R "${pkgdir}/usr/share/wechat-uos-qt/license"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" \
		>"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
	install -Dm644 "${srcdir}/flatpak-info" \
		"${pkgdir}/usr/lib/wechat-uos-qt/flatpak-info"
}

function package_wechat-uos-bwrap() {
	conflicts=()
	depends+=(wechat-uos-qt)
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	echo "https://www.wechat.com/us/service_terms.html" >"${pkgdir}/usr/share/licenses/${pkgname}/ToS.txt"
}
