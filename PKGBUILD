# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/cpa-manager-plus-bin
pkgname=cpa-manager-plus-bin
pkgver=1.11.8
pkgrel=1
pkgdesc=Management\ panel\ and\ analytics\ server\ for\ CLIProxyAPI
arch=(x86_64 aarch64 )
url=https://github.com/seakee/CPA-Manager-Plus
license=(MIT )
depends=()
makedepends=()
checkdepends=()
optdepends=(cli-proxy-api:\ local\ CLIProxyAPI\ backend\ for\ management\ and\ usage\ collection )
options=(\!strip )
provides=(cpa-manager-plus )
conflicts=(cpa-manager-plus cpa-manager cpa )
validpgpkeys=()
install=cpa-manager-plus-bin.install
source=(cpa-manager-plus.env.example cpa-manager-plus.service )
sha256sums=('d3a612277579023580d18391c54c529029d21d4d971a4fe34b39c2b90a90d196'
            '6d31dd15f87463d748b400dc0f00a07ec0f700de213dc4eaaaabdbe2e4135f35')
sha256sums_x86_64=('2c32b4819ea77d7c300af3a5d6d70dd377ec27564e292bec494cadb6fe712008')
sha256sums_aarch64=('fda7431bb88d36e0b413cc59b9686be79f43dc50cdefe896a3218ce2aa685140')
source_x86_64=(cpa-manager-plus-bin-1.11.8-x86_64.tar.gz::https://github.com/seakee/CPA-Manager-Plus/releases/download/v1.11.8/cpa-manager-plus_v1.11.8_linux_amd64.tar.gz )
source_aarch64=(cpa-manager-plus-bin-1.11.8-aarch64.tar.gz::https://github.com/seakee/CPA-Manager-Plus/releases/download/v1.11.8/cpa-manager-plus_v1.11.8_linux_arm64.tar.gz )

_binary_source_path=\*/cpa-manager-plus
_install_bin_path=/usr/bin/cpa-manager-plus
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=cpa-manager-plus.service
_service_install_path=/usr/lib/systemd/user/cpa-manager-plus.service
_doc_files=(cpa-manager-plus.env.example \*/README.md \*/README_CN.md \*/docs )
_license_files=(\*/LICENSE )


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
