# Maintainer: orange-guo
# Packaging Repo: https://github.com/orange-guo/aur-packages/tree/main/packages/boxd-cli-bin
pkgname=boxd-cli-bin
pkgver=0.1.14
pkgrel=1
pkgdesc=External\ CLI\ for\ managing\ boxd\ cloud\ VMs
arch=(x86_64 aarch64 )
url=https://boxd.sh/
license=(custom:boxd-terms )
depends=(ca-certificates glibc )
makedepends=()
checkdepends=()
optdepends=(openssh:\ connect\ to\ boxd\ VMs\ via\ ssh )
options=(\!strip )
provides=(boxd boxd-cli )
conflicts=(boxd boxd-cli )
validpgpkeys=()
install=boxd-cli-bin.install
source=(LICENSE )
sha256sums=('7f5da622099b2595235408e5130e231f74b8a4d6972fd0d5234be963f5baa247')
sha256sums_x86_64=('69efed3f30f0bde54f5162324be96ae7e181691b62249580a99a807a2ca15fb5')
sha256sums_aarch64=('bf668652a732425465bede27f6b36bf1b0f1cc6de37b5909f12c28c9cd716264')
source_x86_64=(boxd-cli-bin-0.1.14-x86_64::https://boxd.sh/downloads/cli/boxd-linux-amd64 )
source_aarch64=(boxd-cli-bin-0.1.14-aarch64::https://boxd.sh/downloads/cli/boxd-linux-arm64 )

_binary_source_path=boxd-cli-bin-0.1.14-\*
_install_bin_path=/usr/bin/boxd
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=''
_service_install_path=''
_doc_files=()
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
