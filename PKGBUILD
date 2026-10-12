# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=novelwriter-bin
_pkgname=novelWriter
pkgver=26.1.2
pkgrel=1
pkgdesc="A markdown-like document editor for writing novels.(Prebuilt version)"
arch=('x86_64')
url="https://novelwriter.io/"
_ghurl="https://github.com/vkbo/novelWriter"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'python-setuptools'
    'python-pyenchant'
    'python-importlib-metadata'
    'python-pyqt6'
    'qt6-svg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_all.deb"
)
sha256sums=('af44e4571280a27e25ca94cab4834aa560d2df29659d86a2679f0078910d4589')

_get_pyver() {
    python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
}
prepare() {
    bsdtar -xf "${srcdir}/data."*
    [[ -d "${srcdir}/usr/lib/python3/dist-packages" ]] || return 1
}
package() {
    local _pyver
    _pyver="$(_get_pyver)"
    msg "Using Python version: ${_pyver}"
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    cp -a "${srcdir}/usr/lib/python3/dist-packages/"* "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}