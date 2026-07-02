# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-git
_pkgname=Ghost-Downloader
pkgver=4.0.1.r0.g82b6536
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide.多线程下载器 协程下载器."
arch=('any')
url="https://github.com/XiaoYouChR/Ghost-Downloader-3"
license=('GPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'xcb-util-cursor'
    'xcb-util-renderutil'
    'xcb-util-keysyms'
    'xcb-util-wm'
    'xcb-util-image'
    'gtk3'
    'libxkbcommon-x11'
    'qt6-base'
    'ffmpeg'
    'libtorrent-rasterbar'
    'libimagequant'
    'python-loguru'
    'libraqm'
    'libavif'
    'libxslt'
)
makedepends=(
    'git'
    'python-pip'
    'gendesk'
    'patchelf'
    'libtorrent-rasterbar'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'b0592310f06c0ad828c080f34159209e8bb04d2228faf8f3461502de0d4d41ff')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    python -m venv --system-site-packages ./
    source ./bin/activate
    sed -i '/^libtorrent/d' requirements.txt
    pip install --timeout=300 -r requirements.txt
    pip install -U nuitka
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    source ./bin/activate
    python scripts/deploy.py
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/plugins"
    cp -a "${srcdir}/${pkgname%-git}.git/dist/${_pkgname}-3.dist/"* "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/app/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}