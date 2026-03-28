# Maintainer: v9pzm7 <deanae at qq dot com>

# This package, developed with reference to the original ttf-ms-win11-auto
# implementation, extracts Windows 11 base-image fonts directly from
# Microsoft's Enterprise Evaluation ISO without downloading or mounting the
# full image.
#
# Build flow:
#   1. Read the remote ISO with HTTP range requests.
#   2. Locate sources/install.wim through UDF metadata.
#   3. Parse the WIM metadata and blob table to map the requested file paths
#      to their backing compressed blobs.
#   4. Download and decompress only those blobs for the requested font and
#      license files, instead of extracting the whole WIM.
#   5. Verify the extracted files against pinned SHA256 hashes.
#
# This keeps bandwidth usage close to the actual font payload while avoiding
# FUSE, loop devices, and privileged mounts during makepkg.
#
# All packaging and helper code in this repository was generated with AI
# assistance.
#
# Microsoft font files remain copyrighted by Microsoft and/or their respective
# authors. Usage outside a properly licensed Windows environment may be
# restricted by the Microsoft license terms. Review the applicable license and
# use requirements before installing or redistributing these fonts.

_pkgbuild_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "${_pkgbuild_dir}/fontdata.sh"

pkgname=ttf-ms-win11-base
pkgver=1.0.0
pkgrel=1
pkgdesc='Microsoft Windows 11 base image TrueType fonts'
arch=(any)
url='https://www.microsoft.com/typography/'
license=(custom)
provides=(ttf-font ttf-ms-win11 emoji-font ttf-tahoma ttf-ms-fonts)
conflicts=(ttf-vista-fonts ttf-ms-win11 ttf-ms-win11-auto ttf-tahoma ttf-ms-fonts)
makedepends=(python wimlib)
source=(
    fontdata.sh
    remote_udf.py
    remote_wim_core.py
    remote_wim.py
)
sha256sums=(
    'b1e60444e1efd00428820fa11b5d20a112f6d211369103c5b8d87275b028956f'
    '37fe786f08d00a86381b999f1c80f80d39e2188eed92c33bea89e1ed9e8d26ce'
    '15c2b5cdd0f424704fd7cf056cc86a3a677f23f104f12fa329515c6604ea27b8'
    'bb406509d1500d6a322509be676f5bd7d161e4994d1e3ac0b62ca76f6adb8334'
)

_extract_root() {
    printf '%s\n' "${srcdir}/extracted"
}

_fonts_root() {
    printf '%s\n' "$( _extract_root )/Windows/Fonts"
}

_license_path() {
    printf '%s\n' "$( _extract_root )/license.rtf"
}

_verify_sha256() {
    local file=$1
    local expected=$2
    local label=$3
    local actual

    if [[ ! -f ${file} ]]; then
        printf '  - %s: MISSING\n' "${label}"
        return 1
    fi

    actual=$(sha256sum "${file}" | awk '{print $1}')
    if [[ ${actual} == "${expected}" ]]; then
        printf '  - %s: Pass\n' "${label}"
        return 0
    fi

    printf '  - %s: FAIL\n' "${label}"
    return 1
}

_extract_sources() {
    local -a wim_paths=()
    local -a license_matches=()
    local extract_root
    local license_path
    local font

    printf '%s\n' '- Extracting fonts from remote Windows 11 install.wim'
    extract_root=$( _extract_root )
    license_path=$( _license_path )
    rm -rf "${extract_root}"
    mkdir -p "${extract_root}"

    for font in "${_ttf_ms_win11_all[@]}"; do
        wim_paths+=("Windows/Fonts/${font}")
    done

    python "${srcdir}/remote_wim.py" --timing --url "${_iso}" extract \
        --output-dir "${extract_root}" \
        --glob 'Windows/System32/Licenses/neutral/*/*/license.rtf' \
        "${wim_paths[@]}"

    shopt -s nullglob
    license_matches=("${extract_root}"/Windows/System32/Licenses/neutral/*/*/license.rtf)
    shopt -u nullglob
    if (( ${#license_matches[@]} != 1 )); then
        printf '%s\n' 'Expected exactly one extracted license.rtf'
        return 1
    fi

    install -Dm644 "${license_matches[0]}" "${license_path}"
}

prepare() {
    local font
    local missing=0
    local failed=0
    local fonts_root
    local license_path

    fonts_root=$( _fonts_root )
    license_path=$( _license_path )

    for font in "${_ttf_ms_win11_all[@]}"; do
        if [[ ! -f ${fonts_root}/${font} ]]; then
            missing=1
            break
        fi
    done

    if [[ ! -f ${license_path} ]]; then
        missing=1
    fi

    if (( missing )); then
        _extract_sources
    fi

    printf '%s\n' '- Verifying extracted files'
    for font in "${_ttf_ms_win11_all[@]}"; do
        _verify_sha256 "${fonts_root}/${font}" "${_ttf_ms_win11_sha256[${font}]}" "${font}" || failed=1
    done
    _verify_sha256 "${license_path}" "${_license_rtf_sha256}" 'license.rtf' || failed=1

    if (( failed )); then
        printf '%s\n' 'One or more extracted files failed verification.'
        return 1
    fi
}

_package() {
    local font
    local fonts_root
    local license_path

    fonts_root=$( _fonts_root )
    license_path=$( _license_path )

    for font in "$@"; do
        install -Dm644 "${fonts_root}/${font}" -t "${pkgdir}/usr/share/fonts/TTF"
    done
    install -Dm644 "${license_path}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package() {
    _package "${_ttf_ms_win11_all[@]}"
}
