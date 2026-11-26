# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sshuttle_gui
pkgname="${_pkgname//_/-}-bin"
pkgver=0.5
pkgrel=1
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh."
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-gui-bin}"
)
depends=(
    'gtk2'
    'sshuttle'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx10.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('df1fe20cadb1b5d42b4adf6982c6923d7e5e63e9723d0acbdaa4f408c1ca4e56'
            '23f7a8faeadd7dec49591825313577b71852c2822486a99202b9b53e7c65f0a3')
_install_icons() {
	local _s="${1:-$srcdir}" _n="${pkgname%-bin}" _i _e _z
	while IFS= read -r -d '' _i; do
		_e=${_i##*.}
		_z=$(printf %s "${_i%/*}"|grep -oE '[0-9]+x[0-9]+(@[0-9]+x?)?|scalable'|tail -n1)
		[[ $_z ]] || _z=$([[ $_e == svg ]]&&echo scalable||od -An -tx1 -j16 -N8 "$_i"| \
		{ read a b c d e f g h; printf %dx%d 0x$a$b$c$d 0x$e$f$g$h; })
		[[ $_z =~ ^[0-9]+x[0-9]+(@[0-9]+x?)?$ || $_z == scalable ]]||_z=scalable
		install -Dm644 "$_i" "$pkgdir/usr/share/icons/hicolor/$_z/apps/$_n.$_e"
	done < <(find "$_s" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' \
		-o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/usr\/share\/${pkgname%-bin}\/${_pkgname}/\/usr\/bin\/${pkgname%-bin}/g" "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}