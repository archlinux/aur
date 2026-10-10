# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xpipe-bin
_pkgname=XPipe
pkgver=24.6
pkgrel=1
pkgdesc="Access your entire server infrastructure from your local desktop."
arch=(
    'aarch64'
    'x86_64'
)
url="https://xpipe.io/"
_ghurl="https://github.com/xpipe-io/xpipe"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libx11'
    'alsa-lib'
    'ffmpeg4.4'
    'ffmpeg'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-installer-linux-x86_64.rpm")
sha256sums=('235061e14a5ba0983364e506bdf824ea11f6c987d9b116af7ce6ce8967ef5603')
sha256sums_aarch64=('86458b1d7841b8eaf9d9c6ac27e1bacf01ca8aaedd9eef37d810fc18ffe77e36')
sha256sums_x86_64=('42be74e44cb25ff35ea521d520372adee8e2d3a26db166322c02a72f1a2b3623')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/TryExec=\/opt\/${pkgname%-bin}\/bin\/${pkgname%-bin}d/TryExec=\/usr\/lib\/${pkgname%-bin}\/bin\/${pkgname%-bin}d/g
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${pkgname%-bin}/Exec=${pkgname%-bin}/g
        s/Path=\/opt\/${pkgname%-bin}/Path=\/usr\/lib\/${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    #install -Dm644 "${srcdir}/etc/bash_completion.d/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    #install -Dm644 "${srcdir}/usr/share/man/man1/"* -t "${pkgdir}/usr/share/man/man1"
}
