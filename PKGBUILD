# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-bin
_pkgname=Ghost-Downloader
_debname=com.xychr.ghostdownloader
pkgver=4.6
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide.多线程下载器,协程下载器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://gd.xychr.com/"
_ghurl="https://github.com/XiaoYouChR/Ghost-Downloader-3"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'xcb-util-cursor'
    'xcb-util-renderutil'
    'xcb-util-keysyms'
    'xcb-util-wm'
    'xcb-util-image'
    'gtk3'
    'qt6-base'
    'qt6-declarative'
    'libxkbcommon-x11'
    'python'
    'python-loguru'
    'python-certifi'
    'ffmpeg'
    'libtorrent-rasterbar'
)
optdepends=(
    'n-m3u8dl-re'
)
makedepends=(
    'gendesk'
    'imagemagick'
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.xz")
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.xz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-arm64.tar.xz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.xz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-x86_64.tar.xz")
sha256sums=('1ea8181f36e7a4b37f6fbe8c2c9bda7bd92fcc4e7934cedca97eed1826751b67')
sha256sums_aarch64=('751bcb6fb8fa88ad695c62a7396b54198f48b67fdb3e7097b6d53b7940013041')
sha256sums_x86_64=('71895caee1e462780d96101d52c6824238e6533e9144b6935c4b60f1bcb57655')
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="${srcdir}/usr/lib/${pkgname%-bin}/logo.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-git}.png"
	done
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Network" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}-${CARCH}.tar.xz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib" "${pkgdir}/usr"
    _generate_icons
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}