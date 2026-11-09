# Maintainer: lzsnyy <710080675@qq.com>
_appname=qoder-cn
pkgname="${_appname}-ide"
_pkgname='Qoder IDE'
pkgver=1.39.2
_electronversion=42
pkgrel=1
pkgdesc="面向真实软件开发的 AI 原生 Qoder CN IDE。"
arch=('x86_64')
url="https://qoder.cn"
license=('LicenseRef-custom')
conflicts=('qoder-cn-ide-bin')
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
    "qoder-cn-ide-${pkgver}.rpm::https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/lastest/qoder-cn-ide_${CARCH}.rpm"
    "LICENSE.html"
    "qoder-cn-ide.js"
    "qoder-cn-ide.sh"
    "qoder-cn-ide-512.png"
)
sha256sums=('939796d35784fcfff5b8e9080ef567887316a60d43c7c4681e83d06b1784c310'
            'd93359b3ca57aec94960975eec23b6412dc8fc0c5b5fcbce57bee0931e01ec61'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21'
            '0d420542509408c41b56a0c6de783344e9514b5531393d291606875f23e34570')
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
        s/@appname@/qoder-cn-ide/g
    " "${srcdir}/qoder-cn-ide.sh" "${srcdir}/qoder-cn-ide.js"
    sed -i "s/\/usr\/share\/qoder-cn-ide\///g" "${srcdir}/usr/share/applications/qoder-cn-ide"*.desktop
    find "$(_get_app_dir)/resources/app" -type d \( -name "*win32*" -o -name "*darwin*" -o -name "*arm*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/qoder-cn-ide.sh" "${pkgdir}/usr/bin/qoder-cn-ide"
    install -Dm755 "${srcdir}/qoder-cn-ide.js" -t "${pkgdir}/usr/lib/qoder-cn-ide"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/qoder-cn-ide/"
    install -Dm644 "${srcdir}/qoder-cn-ide-512.png" "${pkgdir}/usr/share/pixmaps/qoder-cn-ide.png"
    install -Dm644 "${srcdir}/usr/share/applications/qoder-cn-ide"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/qoder-cn-ide.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/qoder-cn-ide-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    [[ -x /usr/bin/bash ]] && install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/qoder-cn-ide"
    [[ -x /usr/bin/zsh ]] && install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_qoder-cn-ide"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
