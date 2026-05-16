# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/cpa-usage-keeper-bin
pkgname=cpa-usage-keeper-bin
pkgver=1.7.2
pkgrel=2
pkgdesc=Standalone\ CLIProxyAPI\ usage\ persistence\ and\ dashboard\ service\ \(Binary\)
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
sha256sums=('688b8677268fa4ae87d6f007b57534d51dc4c55ccf1ca0c06c669410bcf5f1d8'
            '181e37963e289946319ec014253d5cb9a4d6c540d0b0c2d8215e4695811e06c0')
sha256sums_x86_64=('99e65e8f078d50f9a68f9bbb6d8262179246c1073d1e92dca039d7e8e582b1fe')
sha256sums_aarch64=('90ebf97f595a40e544a4e047e5e4ee1f8476c80691c00f97413613bc90777c1e')
source_x86_64=(cpa-usage-keeper-bin-1.7.2-x86_64.tar.gz::https://github.com/Willxup/cpa-usage-keeper/releases/download/v1.7.2/cpa-usage-keeper_v1.7.2_linux_amd64.tar.gz )
source_aarch64=(cpa-usage-keeper-bin-1.7.2-aarch64.tar.gz::https://github.com/Willxup/cpa-usage-keeper/releases/download/v1.7.2/cpa-usage-keeper_v1.7.2_linux_arm64.tar.gz )

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
