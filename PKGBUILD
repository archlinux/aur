# Maintainer: theorangeguo
# Packaging Repo: https://github.com/theorangeguo/aur-packages/tree/main/packages/claude-code-stable-bin
pkgname=claude-code-stable-bin
pkgver=2.1.195
pkgrel=1
pkgdesc=Claude\ Code\ terminal-based\ AI\ coding\ assistant\ \(stable\ channel\)
arch=(x86_64 )
url=https://github.com/anthropics/claude-code
license=(LicenseRef-claude-code )
depends=(bash glibc )
makedepends=()
checkdepends=()
optdepends=(git:\ allow\ Claude\ Code\ to\ use\ git github-cli:\ interact\ with\ GitHub glab:\ interact\ with\ GitLab ripgrep:\ use\ system\ ripgrep\ if\ bundled\ search\ is\ disabled )
options=(\!strip )
provides=(claude-code claude-code-stable )
conflicts=(claude-code claude-code-bin claude-code-stable claude-code-latest claude-code-latest-bin )
validpgpkeys=()
install=claude-code-stable-bin.install
source=(claude-wrapper LICENSE.md::https://raw.githubusercontent.com/anthropics/claude-code/v2.1.195/LICENSE.md )
sha256sums=('91374907d431d091be80078090fb30dfb6e341b68f6dc73b74a4d9ffbf93a354'
            '728158fd1037143fad6907e8fa34804177e598b7326519503fe83cafdef849e6')
sha256sums_x86_64=('8323e70125063147a4478b957745d835a87e5e72ffd25b838ea9a841c03e6a37')
source_x86_64=(claude-code-stable-bin-2.1.195-x86_64::https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/2.1.195/linux-x64/claude )

_binary_source_path=claude-code-stable-bin-2.1.195-x86_64
_install_bin_path=/usr/lib/claude-code-stable-bin/claude
_wrapper_source_path=claude-wrapper
_wrapper_install_path=/usr/bin/claude
_wrapper_mode=755
_service_file=''
_service_install_path=''
_doc_files=()
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
