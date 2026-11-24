# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=namiwork
pkgname="${_appname}-desktop-bin"
_pkgname=QwenWorkCN
pkgver=2.4.14
_electronversion=43
pkgrel=1
pkgdesc="Produced by 360 · Safe and reliable AI office platform.360出品·安全可靠 AI 办公平台"
arch=(
    'aarch64'
    'x86_64'
)
url="https://work.n.cn"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "LICENSE.html::${url}/agreement/aprotocol.html"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
options=(
    '!strip'
    '!debug'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://gedown.360safe.com/gc/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://gedown.360safe.com/gc/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'b728201bc9b6edc7627aa801bd875d802cffd85035406afe8eae44cca001611e')
sha256sums_aarch64=('7caf8f132ece5d372fe3998dd6687989cd39d7cfd6c2be1108b9a9c0265ef190')
sha256sums_x86_64=('ac9f7a2dd20a783aa192ceb8dfb2cb6f7774a2bcfc31ab6f1f526a9f7a97f465')
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
_install_icons() {
    local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
    while IFS= read -r -d '' _icon; do
        _ext="${_icon##*.}"
        _size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
        [[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
        [[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
        _dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
    done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
_delete_other_arch_files() {
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
    find "$(_get_app_dir)" -mindepth 1 -type d \
        \( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
        -prune -exec rm -rf {} +
    find "$(_get_app_dir)" -mindepth 1 -type f \
        \( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
        -prune -exec rm -rf {} +
    rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_appname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _delete_other_arch_files
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}