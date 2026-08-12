# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-bin
_pkgname=Ghost-Downloader
pkgver=4.2.6
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide (Prebuilt version)多线程下载器,协程下载器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/XiaoYouChR/Ghost-Downloader-3"
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
    'libxkbcommon-x11'
    'python'
    'python-loguru'
    'ffmpeg'
    'libtorrent-rasterbar'
)
optdepends=(
    'n-m3u8dl-re'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-Linux-x86_64.deb")
sha256sums=('b0592310f06c0ad828c080f34159209e8bb04d2228faf8f3461502de0d4d41ff')
sha256sums_aarch64=('e3f9907aa03f42f631cdcdcc2cb8fa67a8f948a5adfd41722ad326e97747cda5')
sha256sums_x86_64=('bc2993d48bc3fde01c678eecadd0d6b0f007781fd5976baa08a3c31de5915dec')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_pkgname}-3/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
