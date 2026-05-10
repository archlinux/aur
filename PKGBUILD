# =============================================================================
# cosmostrix-bin — AUR binary package
# =============================================================================
# Maintainer  : rezky_nightky <rezky2399@proton.me>
# Upstream    : https://github.com/oxyzenQ/cosmostrix
# GPG         : 0D431313D6916DC76DB3AE6182FB5CCEFF501BCC
#
# Mutation policy:
#   AUR automation is ONLY allowed to modify: pkgver, _tag, .SRCINFO
#   All other PKGBUILD logic is stable infrastructure and MUST NOT be
#   modified automatically.
# =============================================================================

pkgname=cosmostrix-bin
pkgver=1.1.1.stable.1
_tag=v1.1.1-stable.1
pkgrel=1
pkgdesc="A cosmic take on the classic Matrix rain for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/oxyzenQ/cosmostrix"
license=('MIT')
provides=('cosmostrix')
conflicts=('cosmostrix')
options=('!strip')

# ---------------------------------------------------------------------------
# Source definitions
# ---------------------------------------------------------------------------
# All URLs derive from _tag so that updating _tag alone cascades to every
# source entry.  No dynamic computation or side effects at parse time.
#
# Every x86_64 variant is listed so that the optimal binary can be selected
# at runtime via CPU feature detection in prepare() — not at parse time.
# ---------------------------------------------------------------------------

_base_url="https://github.com/oxyzenQ/cosmostrix/releases/download/${_tag}"

source_x86_64=(
    "${_base_url}/cosmostrix-bin-${_tag}-linux-x86_64-v1.tar.gz"
    "${_base_url}/cosmostrix-bin-${_tag}-linux-x86_64-v2.tar.gz"
    "${_base_url}/cosmostrix-bin-${_tag}-linux-x86_64-v3.tar.gz"
    "${_base_url}/cosmostrix-bin-${_tag}-linux-x86_64-v4.tar.gz"
)

source_aarch64=(
    "${_base_url}/cosmostrix-bin-${_tag}-linux-aarch64-native.tar.gz"
)

# Binaries are prebuilt and already stripped; checksums are verified by
# GitHub release provenance rather than embedded hashes.
sha256sums_x86_64=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_aarch64=('SKIP')

# Prevent makepkg from auto-extracting all archives (they would overwrite
# each other since every archive contains identically-named files).
noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")

# ---------------------------------------------------------------------------
# prepare() — runtime CPU feature detection
# ---------------------------------------------------------------------------
# CPU detection MUST occur here, NOT in global scope.
# This avoids:
#   - parse-time side effects
#   - dynamic global source=() definitions
#   - uname -m (use ${CARCH} instead)
#
# Detection strategy for x86_64:
#   v4 requires AVX-512 (avx512f)
#   v3 requires AVX2
#   v2 requires SSE4.2
#   v1 is baseline x86-64
#
# Falls back to v1 when /proc/cpuinfo is unavailable (containers, chroots).
# ---------------------------------------------------------------------------
prepare() {
    cd "${srcdir}"

    _selected_archive=""

    if [[ "${CARCH}" == "aarch64" ]]; then
        _selected_archive="cosmostrix-bin-${_tag}-linux-aarch64-native.tar.gz"
    elif [[ "${CARCH}" == "x86_64" ]]; then
        local cpuflags=""
        if [[ -r /proc/cpuinfo ]]; then
            # Extract flags line from the first processor entry only
            cpuflags="$(awk '/^flags[[:space:]]*:/ { print $0; exit }' /proc/cpuinfo 2>/dev/null)" || true
        fi

        # Detect highest supported microarchitecture level
        if echo "${cpuflags}" | grep -q 'avx512f'; then
            _selected_archive="cosmostrix-bin-${_tag}-linux-x86_64-v4.tar.gz"
        elif echo "${cpuflags}" | grep -q 'avx2'; then
            _selected_archive="cosmostrix-bin-${_tag}-linux-x86_64-v3.tar.gz"
        elif echo "${cpuflags}" | grep -q 'sse4_2'; then
            _selected_archive="cosmostrix-bin-${_tag}-linux-x86_64-v2.tar.gz"
        else
            _selected_archive="cosmostrix-bin-${_tag}-linux-x86_64-v1.tar.gz"
        fi
    fi

    msg2 "Selected binary variant: ${_selected_archive}"

    # Extract only the selected variant into srcdir
    tar -xzf "${srcdir}/${_selected_archive}"
}

# ---------------------------------------------------------------------------
# package()
# ---------------------------------------------------------------------------
# Archive layout (guaranteed by release.yml):
#   /cosmostrix
#   /LICENSE
#   /README.md
# ---------------------------------------------------------------------------
package() {
    install -Dm755 "${srcdir}/cosmostrix"            "${pkgdir}/usr/bin/cosmostrix"
    install -Dm644 "${srcdir}/LICENSE"               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md"             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
