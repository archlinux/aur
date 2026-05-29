# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cli-proxy-api-bin
pkgname=cli-proxy-api-bin
pkgver=7.1.31
pkgrel=1
pkgdesc=Proxy\ server\ providing\ OpenAI/Gemini/Claude\ compatible\ API\ interfaces
arch=(x86_64 aarch64 )
url=https://github.com/router-for-me/CLIProxyAPI
license=(MIT )
depends=()
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(cli-proxy-api )
conflicts=(cli-proxy-api )
validpgpkeys=()
install=cli-proxy-api-bin.install
source=(cli-proxy-api.service )
sha256sums=('e303e0a3dc106f83aac76b1d2a7dfd891bbeccf5b668bbfb559cc69beb53cf2e')
sha256sums_x86_64=('60f5e746c84f099dcfdc47c3559185759b2ec9ad7747e7bf4ac2889c48f823b4')
sha256sums_aarch64=('b0020b007a5c5005b9c875a03bf4647d9b62dc33f0b62b4e7d3cc48534a68735')
source_x86_64=(cli-proxy-api-bin-7.1.31-x86_64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.1.31/CLIProxyAPI_7.1.31_linux_amd64.tar.gz )
source_aarch64=(cli-proxy-api-bin-7.1.31-aarch64.tar.gz::https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.1.31/CLIProxyAPI_7.1.31_linux_aarch64.tar.gz )

_binary_source_path=cli-proxy-api
_install_bin_path=/usr/bin/cli-proxy-api
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=cli-proxy-api.service
_service_install_path=/usr/lib/systemd/user/cli-proxy-api.service
_doc_files=(config.example.yaml )
_license_files=(LICENSE )


package() {
    _resolve_required_source_file() {
        local pattern=$1
        local matches=()
        local nullglob_was_set=false

        shopt -q nullglob && nullglob_was_set=true
        shopt -s nullglob
        matches=("${srcdir}"/$pattern)
        [ "$nullglob_was_set" = true ] || shopt -u nullglob

        if [ "${#matches[@]}" -ne 1 ]; then
            printf 'Expected exactly one source match for pattern %s, found %s\n' "$pattern" "${#matches[@]}" >&2
            return 1
        fi

        [ -f "${matches[0]}" ] || {
            printf 'Matched source is not a file: %s\n' "${matches[0]}" >&2
            return 1
        }

        printf '%s\n' "${matches[0]}"
    }

    _install_optional_source_files() {
        local pattern=$1
        local target_dir=$2
        local mode=$3
        local matches=()
        local matched_file
        local nullglob_was_set=false

        shopt -q nullglob && nullglob_was_set=true
        shopt -s nullglob
        matches=("${srcdir}"/$pattern)
        [ "$nullglob_was_set" = true ] || shopt -u nullglob

        for matched_file in "${matches[@]}"; do
            [ -f "$matched_file" ] || continue
            install -Dm"$mode" "$matched_file" "${pkgdir}${target_dir}/$(basename "$matched_file")"
        done
    }

    local binary_source_file
    binary_source_file=$(_resolve_required_source_file "${_binary_source_path}")
    install -Dm755 "$binary_source_file" "${pkgdir}${_install_bin_path}"

    if [ -n "${_wrapper_source_path}" ] && [ -n "${_wrapper_install_path}" ]; then
        local wrapper_source_file
        wrapper_source_file=$(_resolve_required_source_file "${_wrapper_source_path}")
        install -Dm${_wrapper_mode} "$wrapper_source_file" "${pkgdir}${_wrapper_install_path}"
    fi

    local doc_file
    for doc_file in "${_doc_files[@]}"; do
        _install_optional_source_files "$doc_file" "/usr/share/doc/${pkgname}" 644
    done

    local license_file
    for license_file in "${_license_files[@]}"; do
        _install_optional_source_files "$license_file" "/usr/share/licenses/${pkgname}" 644
    done

    if [ -n "${_service_file}" ] && [ -f "${srcdir}/${_service_file}" ]; then
        install -Dm644 "${srcdir}/${_service_file}" "${pkgdir}${_service_install_path}"
    fi
}
