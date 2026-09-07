# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/zellij-no-mouse-resize-bin
pkgname=zellij-no-mouse-resize-bin
pkgver=0.45.1.r1
pkgrel=1
pkgdesc=Zellij\ with\ advanced_mouse_actions\ also\ gating\ pane\ mouse\ resize
arch=(x86_64 )
url=https://zellij.dev
license=(MIT )
depends=(glibc libgcc libgcc_s.so zlib libz.so )
makedepends=()
checkdepends=()
optdepends=()
options=(\!strip )
provides=(zellij zellij-no-mouse-resize )
conflicts=(zellij zellij-bin zellij-git zellij-no-mouse-resize )
validpgpkeys=()

source=()
sha256sums_x86_64=('c16f022c4982756a569bbc9860cc17756752bce733d99d6391d1ee120e4ee8ba')
source_x86_64=(zellij-no-mouse-resize-bin-0.45.1.r1-x86_64.tar.gz::https://github.com/theorangeguo/aur-packages/releases/download/zellij-no-mouse-resize-bin-v0.45.1.r1/zellij-no-mouse-resize-bin-0.45.1.r1-x86_64-unknown-linux-gnu.tar.gz )

_binary_source_path=zellij
_install_bin_path=/usr/bin/zellij
_wrapper_source_path=''
_wrapper_install_path=''
_wrapper_mode=755
_service_file=''
_service_install_path=''
_doc_files=(README.md )
_license_files=(LICENSE.md )


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
