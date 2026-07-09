# =============================================================================
# cosmostrix-bin — AUR binary package
# =============================================================================
# Maintainer  : rezky_nightky <with dot rezky at gmail dot com>
# Upstream    : https://github.com/oxyzenQ/cosmostrix
# GPG         : 0D431313D6916DC76DB3AE6182FB5CCEFF501BCC
#
# Mutation policy:
#   AUR automation is ONLY allowed to modify: pkgver, _tag, .SRCINFO
#   All other PKGBUILD logic is stable infrastructure and MUST NOT be
#   modified automatically.
# =============================================================================

pkgname=cosmostrix-bin
pkgver=13.3.0
_tag=
pkgrel=1

pkgdesc="Production-grade cinematic Matrix rain renderer for serious terminal environments."
arch=('x86_64' 'aarch64')
url="https://github.com/oxyzenQ/cosmostrix"
license=('GPL3')

depends=('glibc' 'gcc-libs')

provides=('cosmostrix')
conflicts=('cosmostrix' 'cosmostrix-git')

options=('!strip')

# ---------------------------------------------------------------------------
# Source definitions
# ---------------------------------------------------------------------------
# source=() is intentionally empty.  Assets are selected dynamically in
# prepare() based on the host CPU, then downloaded and verified with the
# sidecar .sha512sum checksum from the GitHub Release.
#
# This avoids:
#   - downloading all 4 x86_64 variants when only 1 is needed
#   - parse-time side effects from dynamic source=() definitions
#   - incompatibility between makepkg static checksums and adaptive selection
# ---------------------------------------------------------------------------
source=()
sha512sums=()

# ---------------------------------------------------------------------------
# prepare() — runtime CPU feature detection + verified download
# ---------------------------------------------------------------------------
# 1. Select the optimal binary variant for the host CPU
# 2. Download the asset and its .sha512sum sidecar from GitHub Releases
# 3. Verify integrity with sha512sum --check
# 4. Extract into srcdir
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
    local asset
    local tag
    if [[ -n "${_tag}" ]]; then
        tag="v${pkgver}-${_tag}"
    else
        tag="v${pkgver}"
    fi

    # -- Select optimal binary based on host architecture and CPU features --
    case "${CARCH}" in
        aarch64)
            asset="cosmostrix-${tag}-linux-aarch64.tar.gz"
            ;;
        x86_64)
            local level="v1"

            if [[ -r /proc/cpuinfo ]] && grep -q avx512f /proc/cpuinfo; then
                level="v4"
            elif [[ -r /proc/cpuinfo ]] && grep -q avx2 /proc/cpuinfo; then
                level="v3"
            elif [[ -r /proc/cpuinfo ]] && grep -q sse4_2 /proc/cpuinfo; then
                level="v2"
            fi

            asset="cosmostrix-${tag}-linux-amd64-${level}.tar.gz"
            ;;
        *)
            error "Unsupported architecture: ${CARCH}"
            return 1
            ;;
    esac

    local url="https://github.com/oxyzenQ/cosmostrix/releases/download/${tag}/${asset}"

    msg2 "Selected asset: ${asset}"
    msg2 "Downloading: ${url}"

    # -- Download the release asset --
    curl \
        --fail \
        --location \
        --proto '=https' \
        --tlsv1.2 \
        --output "${srcdir}/${asset}" \
        "${url}"

    # -- Download the sidecar SHA512 checksum --
    curl \
        --fail \
        --location \
        --proto '=https' \
        --tlsv1.2 \
        --output "${srcdir}/${asset}.sha512sum" \
        "${url}.sha512sum"

    # -- Verify integrity --
    # SHA-512 is always verified (mandatory — every Linux has sha512sum).
    # BLAKE2b-512 + SHAKE256 are optional quantum-resistant checksums.
    # They are verified only when the corresponding tool is available.
    msg2 "Verifying SHA512 checksum (required)..."
    (
        cd "${srcdir}" || return 1
        sha512sum --check "${asset}.sha512sum"
    )

    # Optional: BLAKE2b-512 (quantum-resistant, in GNU coreutils)
    if command -v b2sum >/dev/null 2>&1; then
        msg2 "Verifying BLAKE2b checksum (optional, quantum-resistant)..."
        curl \
            --fail \
            --location \
            --proto '=https' \
            --tlsv1.2 \
            --output "${srcdir}/${asset}.b2sum" \
            "${url}.b2sum"
        (
            cd "${srcdir}" || return 1
            b2sum --check "${asset}.b2sum"
        )
    else
        msg2 "b2sum not found — skipping BLAKE2b verification (optional)"
    fi

    # Optional: SHAKE256 (quantum-resistant, NIST PQ standard, via Python)
    if command -v python3 >/dev/null 2>&1; then
        msg2 "Verifying SHAKE256 checksum (optional, quantum-resistant)..."
        curl \
            --fail \
            --location \
            --proto '=https' \
            --tlsv1.2 \
            --output "${srcdir}/${asset}.shake256" \
            "${url}.shake256"
        (
            cd "${srcdir}" || return 1
            COMPUTED=$(python3 -c "
import hashlib
data = open('${asset}', 'rb').read()
print(hashlib.shake_256(data).hexdigest(64))
")
            EXPECTED=$(awk '{print $1}' "${asset}.shake256")
            [ "${COMPUTED}" = "${EXPECTED}" ] || {
                error "SHAKE256 verification FAILED"
                return 1
            }
            msg2 "SHAKE256 verification OK"
        )
    else
        msg2 "python3 not found — skipping SHAKE256 verification (optional)"
    fi

    # -- Extract (normalize archive layout) --
    # Older releases nested files under a subdirectory (e.g.
    # cosmostrix-1.1.1-stable.1-linux-amd64-v3/); newer releases are flat.
    # Artifact naming uses the tag (e.g. cosmostrix-v2.1.0-linux-amd64-v3.tar.gz).
    # Detect and strip the leading directory if present so package() always
    # finds files at ${srcdir}/cosmostrix, ${srcdir}/LICENSE, etc.
    local top_entry
    top_entry="$(bsdtar --list --file "${srcdir}/${asset}" | head -1)"

    if [[ "${top_entry}" == */ ]]; then
        msg2 "Detected nested archive layout, stripping leading directory"
        bsdtar \
            --extract \
            --file "${srcdir}/${asset}" \
            --directory "${srcdir}" \
            --strip-components=1
    else
        bsdtar \
            --extract \
            --file "${srcdir}/${asset}" \
            --directory "${srcdir}"
    fi
}

# ---------------------------------------------------------------------------
# package()
# ---------------------------------------------------------------------------
# Archive layout (guaranteed by release.yml):
#   /cosmostrix
#   /LICENSE
#   /README.md
# ---------------------------------------------------------------------------
# Clean install: only binary + license + docs. No config files are
# installed — cosmostrix ships sensible built-in defaults and generates
# a config on demand via `cosmostrix --dump-config`. Users who want a
# persistent config run: cosmostrix --dump-config > ~/.config/cosmostrix/config.toml
# ---------------------------------------------------------------------------
package() {
    install -Dm755 \
        "${srcdir}/cosmostrix" \
        "${pkgdir}/usr/bin/cosmostrix"

    if [[ -f "${srcdir}/LICENSE" ]]; then
        install -Dm644 \
            "${srcdir}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi

    if [[ -f "${srcdir}/README.md" ]]; then
        install -Dm644 \
            "${srcdir}/README.md" \
            "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi

    # Shell completions (bash + zsh)
    "${srcdir}/cosmostrix" --completions bash > "${srcdir}/cosmostrix.bash" 2>/dev/null || true
    "${srcdir}/cosmostrix" --completions zsh > "${srcdir}/_cosmostrix" 2>/dev/null || true

    if [[ -s "${srcdir}/cosmostrix.bash" ]]; then
        install -Dm644 \
            "${srcdir}/cosmostrix.bash" \
            "${pkgdir}/usr/share/bash-completion/completions/cosmostrix"
    fi

    if [[ -s "${srcdir}/_cosmostrix" ]]; then
        install -Dm644 \
            "${srcdir}/_cosmostrix" \
            "${pkgdir}/usr/share/zsh/site-functions/_cosmostrix"
    fi
}
