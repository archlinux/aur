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
pkgver=10.0.0
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
            asset="cosmostrix-bin-${tag}-linux-aarch64-native.tar.gz"
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

            asset="cosmostrix-bin-${tag}-linux-x86_64-${level}.tar.gz"
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
    msg2 "Verifying SHA512 checksum..."
    (
        cd "${srcdir}" || return 1
        sha512sum --check "${asset}.sha512sum"
    )

    # -- Extract (normalize archive layout) --
    # Older releases nested files under a subdirectory (e.g.
    # cosmostrix-1.1.1-stable.1-linux-x86_64-v3/); newer releases are flat.
    # Artifact naming uses the tag (e.g. cosmostrix-bin-v2.1.0-linux-x86_64-v3.tar.gz).
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
# Also installs a default config.toml to /etc/cosmostrix/config.toml so
# users have a ready template. Individual users can copy it to
# ~/.config/cosmostrix/config.toml and customize.
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

    # Install default config template to /etc/cosmostrix/config.toml
    # Users copy to ~/.config/cosmostrix/config.toml to customize.
    # Generate from the binary's --dump-config output for exact match.
    install -Dm644 /dev/stdin \
        "${pkgdir}/etc/cosmostrix/config.toml" <<'CONFIGEOF'
# Cosmostrix config
# Location:
#   $XDG_CONFIG_HOME/cosmostrix/config.toml
#   or ~/.config/cosmostrix/config.toml
#
# Format:
#   key = value
# Invalid values warn cleanly and are ignored.
#
# Precedence:
#   built-in defaults < config values < config preset < config scene
#   < config profile < CLI preset < CLI scene < CLI profile
#   < low-power < explicit CLI flags

# Scene atmosphere. See: cosmostrix --list-scenes
scene = monolith

# Curated preset. See: cosmostrix --list-presets
preset = cinematic

# Appearance
color = cosmos
charset = binary
color-bg = black

# Motion
fps = 60
speed = 20
density = 0.75
monolith-size = normal

# Behavior
glitch-level = subtle
low-power = false
mouse = false
fullwidth = false
auto-color-drift = false

# Advanced style
bold = 1
shadingmode = 1

# User-defined profiles (see: cosmostrix --list-profiles)
# profile.nightcore.base = monolith
# profile.nightcore.color = purple
# profile.nightcore.speed = 24
CONFIGEOF
}
