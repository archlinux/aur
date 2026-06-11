# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cpa-usage-keeper-bin
pkgname=cpa-usage-keeper-bin
pkgver=1.10.6
pkgrel=1
pkgdesc=Standalone\ CLIProxyAPI\ usage\ persistence\ and\ dashboard\ service
arch=(x86_64 aarch64 )
url=https://github.com/Willxup/cpa-usage-keeper
license=(MIT )
depends=(glibc )
makedepends=()
checkdepends=()
optdepends=(cli-proxy-api:\ local\ CLIProxyAPI\ backend )
options=(\!strip )
provides=(cpa-usage-keeper )
conflicts=(cpa-usage-keeper )
validpgpkeys=()
install=cpa-usage-keeper-bin.install
source=(cpa-usage-keeper.env.example cpa-usage-keeper.service )
sha256sums=('484bf3aeb083742ecd5116d29d5c7aa73290da64c386ac46a530c7033ad68ac8'
            '181e37963e289946319ec014253d5cb9a4d6c540d0b0c2d8215e4695811e06c0')
sha256sums_x86_64=('e25fd62ab3b605d77f3fc204bb2fbc622cb106fb2a91484625b6589b1083a2c9')
sha256sums_aarch64=('d9f886e9c80ea7dd8ec4a5c73acd349cc0b02c8c9870baf9ffe1d44025b31c41')
source_x86_64=(cpa-usage-keeper-bin-1.10.6-x86_64.tar.gz::https://github.com/Willxup/cpa-usage-keeper/releases/download/v1.10.6/cpa-usage-keeper_v1.10.6_linux_amd64.tar.gz )
source_aarch64=(cpa-usage-keeper-bin-1.10.6-aarch64.tar.gz::https://github.com/Willxup/cpa-usage-keeper/releases/download/v1.10.6/cpa-usage-keeper_v1.10.6_linux_arm64.tar.gz )

_binary_source_path=\*/cpa-usage-keeper
_install_bin_path=/usr/bin/cpa-usage-keeper
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=cpa-usage-keeper.service
_service_install_path=/usr/lib/systemd/user/cpa-usage-keeper.service
_doc_files=(cpa-usage-keeper.env.example \*/README.md \*/README.en.md \*/CONTRIBUTORS.md )
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
