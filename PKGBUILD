# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/codearts-agent-bin
pkgname=codearts-agent-bin
pkgver=26.10.0
pkgrel=1
pkgdesc=AI-powered\ coding\ assistant\ and\ IDE\ by\ Huawei\ Cloud
arch=(x86_64 aarch64 )
url=https://codearts.huaweicloud.com/
license=(custom:huaweicloud )
depends=(alsa-lib at-spi2-core cairo curl glibc gtk3 libnotify libsecret libxkbfile libxss nss shared-mime-info xdg-utils )
makedepends=()
checkdepends=()
optdepends=(libvulkan-driver:\ Vulkan\ support bash-completion:\ Bash\ completion\ support zsh-completions:\ Zsh\ completion\ support )
options=(\!strip )
provides=(codearts-agent )
conflicts=(codearts-agent )
validpgpkeys=()

source=(LICENSE )
sha256sums=('e106bf05e0a1abbbcaa65d1d8f9d67ab1c020ee623dfcab780ff05a8e91ba117')
sha256sums_x86_64=('8dcf38cc36a82d8466d16893a37b82692ad670e1d6bfdbf9f0060b590e1da180')
sha256sums_aarch64=('e374a7a16d3c341e9ff769d60ef538e87482e5e431ed6046fab71ce2fac6d4e1')
source_x86_64=(codearts-agent-bin-26.10.0-x86_64.deb::https://codearts-agent-obs-cdn.huaweicloud.com/codearts/ai/latest/codearts-agent-linux-x64-26.10.0-1abecd4.deb )
source_aarch64=(codearts-agent-bin-26.10.0-aarch64.deb::https://codearts-agent-obs-cdn.huaweicloud.com/codearts/ai/latest/codearts-agent-linux-arm64-26.10.0-1abecd4.deb )

_deb_relocate_usr_local=false
_install_bin_path=/usr/bin/codearts-agent
_binary_source_path=/usr/share/codearts-agent/bin/codearts-agent
_service_file=''
_service_install_path=''
_doc_files=()
_license_files=(LICENSE )


prepare() {
    local _deb_source_file
    case "$CARCH" in
        x86_64) _deb_source_file=codearts-agent-bin-26.10.0-x86_64.deb ;;
        aarch64) _deb_source_file=codearts-agent-bin-26.10.0-aarch64.deb ;;
        *)
            echo "Unsupported architecture: $CARCH" >&2
            return 1
            ;;
    esac

    rm -rf "${srcdir}/_deb_extract" "${srcdir}/_deb_root"
    mkdir -p "${srcdir}/_deb_extract" "${srcdir}/_deb_root"

    bsdtar -xf "${srcdir}/${_deb_source_file}" -C "${srcdir}/_deb_extract"

    local data_archives=("${srcdir}/_deb_extract"/data.tar.*)
    [ -e "${data_archives[0]}" ] || {
        echo "Missing data.tar.* inside Debian package" >&2
        return 1
    }

    bsdtar -xf "${data_archives[0]}" -C "${srcdir}/_deb_root"
}

package() {
    install -d "${pkgdir}"
    cp -a "${srcdir}/_deb_root/." "${pkgdir}/"

    if [ "${_deb_relocate_usr_local}" = true ] && [ -d "${pkgdir}/usr/local" ]; then
        install -d "${pkgdir}/usr"
        cp -a "${pkgdir}/usr/local/." "${pkgdir}/usr/"
        rm -rf "${pkgdir}/usr/local"
    fi

    if [ -n "${_install_bin_path}" ] && [ -n "${_binary_source_path}" ]; then
        install -d "$(dirname "${pkgdir}${_install_bin_path}")"
        ln -sf "${_binary_source_path}" "${pkgdir}${_install_bin_path}"
    fi

    local doc_file
    for doc_file in "${_doc_files[@]}"; do
        [ -f "${srcdir}/${doc_file}" ] || continue
        install -Dm644 "${srcdir}/${doc_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "${doc_file}")"
    done

    local license_file
    for license_file in "${_license_files[@]}"; do
        [ -f "${srcdir}/${license_file}" ] || continue
        install -Dm644 "${srcdir}/${license_file}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${license_file}")"
    done

    if [ -n "${_service_file}" ] && [ -f "${srcdir}/${_service_file}" ]; then
        install -Dm644 "${srcdir}/${_service_file}" "${pkgdir}${_service_install_path}"
    fi
}
