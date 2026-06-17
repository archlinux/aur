# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=github-desktop
_appname="GitHub Desktop"
pkgname="${_pkgname}-zh-bin"
pkgver=3.4.13_linux1
#_zhpkgver="${pkgver%_linux2}"
_zhpkgver=3.4.13
_electronversion=32
pkgrel=14
pkgdesc="GUI for managing Git and GitHub.Chinese SC Version.(Use system-wide electron).Github Desktop 汉化版."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://desktop.github.com"
_ghurl="https://github.com/shiftkey/desktop"
_ghzhurl="https://github.com/robotze/GithubDesktopZhTool"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'git'
    'git-lfs'
    'libsecret'
    'perl'
    'curl'
    'expat'
)
options=('!strip')
source_aarch64=("${_pkgname}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-aarch64-${pkgver//_/-}.rpm")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-armv7l-${pkgver//_/-}.rpm")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/release-${pkgver//_/-}/${_appname// /}-linux-x86_64-${pkgver//_/-}.rpm")
source=(
    "${_pkgname}-${_zhpkgver}-zh.7z::${_ghzhurl}/releases/download/${_zhpkgver}/${_appname// /}.7z"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/shiftkey/desktop/release-${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7bba3fe1b3661c0f20afbc053245a2aa41a6ce6ec19c95eb8ce16fb191a752da'
            '891d678cd6aa67c0712f663b5fee690f24d11d360795300814f7bf2eb91ba530'
            '8e6c4cbaca9b58db3bb85fbbdb529c9bbea6378ab66f432b3f916e7f822417b6')
sha256sums_aarch64=('8914f985013da02e36de63b65fc252dc86fd9326497f0cf3f49402017fe1006f')
sha256sums_armv7h=('e7245fc83d8f7a4be854e43e6441c6932d7d4702dfa3b38cf16c56442ed295a1')
sha256sums_x86_64=('ad83b9b5b036a404ede0d5f0a147d46967dd0605a428da6b1876bdb37555d963')
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    local _main_exe=""
    if [[ -n "${_app_dir}" ]]; then
        _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
    fi
    if [[ -n "${_main_exe}" ]]; then
        local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
        if [[ -n "${_elec_ver}" ]]; then
            if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
                echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
            else
                echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
            fi
        fi
    else
        echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
    fi
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    # Fix Pt() function in main.js: find actual protocol URL instead of taking argv[0]
    sed -i 's/!e.endsWith("github-desktop")&&!e.startsWith("--")/e.startsWith("x-github-")/' "${srcdir}/GithubDesktop汉化工具/Linux/main.js"
    install -Dm644 "${srcdir}/GithubDesktop汉化工具/Linux/"* -t "${srcdir}/usr/lib/${_pkgname}/resources/app"
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        5i\Name[zh_CN]=Github桌面版
        6i\Comment[zh_CN]=从桌面对Github进行简单协作
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    # Replace bundled git (~99MB) with symlinks to system packages
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/app/git"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/bin"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/libexec"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/share/git-core"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/ssl"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/etc"
    ln -s /usr/bin/git "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/bin/git"
    ln -s /usr/bin/scalar "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/bin/scalar"
    ln -s /usr/lib/git-core "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/libexec/git-core"
    ln -s /usr/share/git-core/templates "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/share/git-core/templates"
    touch "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/etc/gitconfig"
    ln -s /etc/ssl/certs/ca-certificates.crt "${pkgdir}/usr/lib/${pkgname%-bin}/app/git/ssl/cacert.pem"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
