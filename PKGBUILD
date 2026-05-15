# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flyenv-bin
_pkgname=FlyEnv
pkgver=4.15.1
_electronversion=39
pkgrel=1
pkgdesc="All-In-One Full-Stack Environment Management Tool.Help developers quickly set up a local development environment.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.flyenv.com/"
_ghurl="https://github.com/xpf0000/FlyEnv"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
    'xsel'
)
optdepends=(
    'ollala'
    'apache'
    'caddy'
    'consul'
    'nginx'
    'tomcat10'
    'bun'
    'deno'
    'erlang'
    'go'
    'jdk-openjdk'
    'nodejs'
    'perl'
    'php'
    'python'
    'ruby'
    'rust'
    'mariadb'
    'mysql'
    'mongodb'
    'postgresql'
    'etcd'
    'memcached'
    'rabbitmq'
    'redis'
    'mailpit'
    'dnsmasq'
    'bind'
    'pure-ftpd'
    'minio'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/xpf0000/PhpWebStudy/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.rpm")
sha256sums=('01d77fe9ffb39b0a9507ca8d1cae189f56efd625078c3b13b59ce7aae42a4f7d'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('7621c8059380b96df9798834259b084966ef169eff8b88d5227a10c27747fc3a')
sha256sums_x86_64=('a39a070649afb68abcf240f0a3d57a968697503fc73a8589cb8f560007b54811')
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,ia32},mac} \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/node-pty/prebuilds/"{darwin-*,win32-*}
    ln -sf "/usr/bin/xsel" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/clipboardy/fallbacks/linux/xsel"
    case "${CARCH}" in
        'aarch64')
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64" \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/node-pty/prebuilds/linux-x64"
            ln -sf "/usr/bin/7za" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64/7za"
            ;;
        'x86_64')
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64" \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/node-pty/prebuilds/linux-arm64"
            ln -sf "/usr/bin/7za" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
