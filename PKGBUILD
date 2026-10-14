# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
#获取版本号及下载地址：
#https://comate-ide.bj.bcebos.com/updates/stable/linux/arm64/latest.json
#https://comate-ide.bj.bcebos.com/updates/stable/linux/x64/latest.json
pkgname=comate-bin
_pkgname=Comate
pkgver=3.11.5
_version=b0a3898a5a5ca92be2dc09a8bb0f91d341925e3a-273608800
_electronversion=39
pkgrel=1
pkgdesc="Code as you like, one step ahead, and understand your intelligent code assistant better."
arch=(
    'aarch64'
    'x86_64'
)
url="https://comate.baidu.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
    'python-fonttools'
    'perl'
    'libxkbfile'
    'libsecret'
    'webkit2gtk-4.1'
    'python-yaml'
    'python-lxml'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://cloud.baidu.com/doc/COMATE/s/glxiygwdx"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}-url-handler.desktop"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::https://comate-ide.cdn.bcebos.com/download/stable/${_version}/${_pkgname}-linux-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://comate-ide.cdn.bcebos.com/download/stable/${_version}/${_pkgname}-linux-x64.tar.gz")
sha256sums=('16d9eed478ac62bd4ea2abd5cc2c291541657baf3d7f25d9b37860efc54a2879'
            '34154f0c3b9fd59edb131d803f1cbba6031c8f45a014b6cbddf1242064937d65'
            '0c8fee636da036e57fcde0385bdc698126c4b179de663ad315e8299d483abc9d'
            '787bf0078b80c66fa5b8191991700afd6e32e9f285cdb32f69791b8894c86fd5'
            'ee3d816992d08490f0d7fe8eb5b3c23006c1c7c280cde73c7dee79a23903aa5c')
sha256sums_aarch64=('dd79acf213f3a523be07f9febdd35e58981571e65daa7701e160f2f20b1fde09')
sha256sums_x86_64=('20315b31fa30fc768f5c38fe308a3b8e3397040af43498689f0286c8f9ace578')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_check_electron_version() {
	local _v=$(strings "$(find "$(_get_app_dir)" -maxdepth 1 -type f \
		-executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)" \
		| grep -oP 'Electron/\K[0-9]+' | head -1)
	[[ -z "$_v" ]] && { echo -e "\033[1;33mNote: Could not check version.\033[0m"; return; }
	(( _v == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m$_v$([[ $c -eq 31 ]] && echo " (expected $_electronversion)")\033[0m"
}
prepare() {
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}.js/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/@ELECTRON@/electron${_electronversion}/g
        s/@name@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.js"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "${srcdir}" -type d \
		\( -name '*darwin*' -o -name "*ia32*" -o -name '*android*' -o -name '*win32*' -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "${srcdir}" -type f \
		\( -name '*darwin*.*' -o -name "*ia32*.*" -o -name '*android*.*' -o -name '*win32*.*' -o -name "*${_archrem}*.*" \) \
		-delete
    rm -rf "$(_get_app_dir)/resources/app/extensions/preview-dev-tools"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/app/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}"*.desktop -t "${pkgdir}/usr/share/applications"
    [ -x "/usr/bin/bash" ] && install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/completions/bash/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    [ -x "/usr/bin/zsh" ] && install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/completions/zsh/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
