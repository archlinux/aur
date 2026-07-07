# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/vibe-kanban-bin
pkgname=vibe-kanban-bin
pkgver=0.1.44
pkgrel=4
pkgdesc=AI-powered\ Kanban\ board
arch=(x86_64 )
url=https://vibekanban.com
license=(Proprietary )
depends=()
makedepends=(unzip )
checkdepends=()
optdepends=()
options=(\!strip )
provides=(vibe-kanban )
conflicts=(vibe-kanban )
validpgpkeys=()
install=vibe-kanban-bin.install
source=(vibe-kanban.service )
sha256sums=('48b6d94e9693f7098ad7d3786ff08b648ce08ab8fcfe8ff13cff97906a12a33f')
sha256sums_x86_64=('083f15f027a7052916852f40610db34b021f7e7749593623ac3f67a090447a6b')
source_x86_64=(vibe-kanban-bin-0.1.44-x86_64.zip::https://npm-cdn.vibekanban.com/binaries/v0.1.44-20260424091429/linux-x64/vibe-kanban.zip )

_binary_source_path=vibe-kanban
_install_bin_path=/usr/bin/vibe-kanban
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=vibe-kanban.service
_service_install_path=/usr/lib/systemd/user/vibe-kanban.service
_doc_files=()
_license_files=()
_binary_tag=v0.1.44-20260424091429

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
