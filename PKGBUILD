# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qoder
pkgname="${_appname}-ide-bin"
_pkgname='Qoder IDE'
pkgver=1.37.0
_electronversion=42
pkgrel=1
pkgdesc="AI native IDE for real-world software development."
arch=('x86_64')
url="https://qoder.com/"
_ghurl="https://github.com/QoderAI/changelog-zh_CN"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libxkbfile'
    'nodejs'
    'python'
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
    "${pkgname%-bin}-${pkgver}.rpm::https://download.qoder.com/release/latest/${pkgname%-bin}_${CARCH}.rpm"
    "LICENSE.html"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('e7b1860287b2cb43f2d4f8a702a2c3c0454cb8321b8252f01b4cfdab7873b74e'
            'd93359b3ca57aec94960975eec23b6412dc8fc0c5b5fcbce57bee0931e01ec61'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
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
    grep '"version":' "$(_get_app_dir)/resources/app/featureFlags.json" | awk -F'"version": "' '{print $2}' | awk -F',' '{print $1}' | tr -d '"' > "${srcdir}/.pkgver"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}.js/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/\/usr\/share\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop
    find "$(_get_app_dir)/resources/app" -type d \( -name "*win32*" -o -name "*darwin*" -o -name "*arm*" \) -exec rm -rf {} +
    rm -rf \
        "$(_get_app_dir)/resources/app/node_modules/windows-foreground-love" \
        "$(_get_app_dir)/resources/app/node_modules/native-is-elevated"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    [[ -x /usr/bin/bash ]] && install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    [[ -x /usr/bin/zsh ]] && install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
