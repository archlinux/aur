# Maintainer: Your Name <you@example.com>
pkgname=deadsync-bin
pkgdesc='ITG/StepMania engine with Vulkan/OpenGL backends – pre-built binary release'
url='https://github.com/pnn64/deadsync'
license=('MIT')
arch=('x86_64' 'aarch64')
provides=('deadsync')
conflicts=('deadsync' 'deadsync-git')
depends=(
    'vulkan-icd-loader'
    'libgl'
    'libudev.so'
    'libasound.so'
    'hicolor-icon-theme'
)
makedepends=('git' 'curl')
options=('!strip')
install="${pkgname}.install"

pkgver=0.1 # Placeholder - gets overwritten with pkgver()
pkgrel=1
source=()
sha256sums=()

_asset_x86_64="deadsync-v%s-x86_64-linux.tar.gz"
_asset_aarch64="deadsync-v%s-arm64-linux.tar.gz"

pkgver() {
    git ls-remote --tags --sort='version:refname' \
        'https://github.com/pnn64/deadsync.git' 'refs/tags/v[0-9]*' \
        | awk 'END { sub(/.*\/v/, "", $2); print $2 }'
}

package() {
    local _ver="${pkgver}"
    local _tag="v${_ver}"

    local _asset
    case "${CARCH}" in
        x86_64)  _asset=$(printf "${_asset_x86_64}"  "${_ver}") ;;
        aarch64) _asset=$(printf "${_asset_aarch64}" "${_ver}") ;;
        *)
            error "Unsupported architecture: ${CARCH}"
            return 1
            ;;
    esac

    local _url="https://github.com/pnn64/deadsync/releases/download/${_tag}/${_asset}"
    msg2 "Downloading ${_url}"
    local _tarball="${srcdir}/${_asset}"
    curl -L --fail --progress-bar -o "${_tarball}" "${_url}"

    local _stagedir="${srcdir}/deadsync-stage"
    mkdir -p "${_stagedir}"
    bsdtar -xf "${_tarball}" -C "${_stagedir}"

    local _src="${_stagedir}"
    local _dirs=("${_stagedir}"/*)
    if [[ ${#_dirs[@]} -eq 1 && -d "${_dirs[0]}" ]]; then
        _src="${_dirs[0]}"
    fi

    rm -f "${_src}/portable.txt"

    # -----------------------------------------------------------------------
    # Install game to /opt/deadsync
    # -----------------------------------------------------------------------
    install -dm755 "${pkgdir}/opt/deadsync"
    cp -a "${_src}/." "${pkgdir}/opt/deadsync/"
    chmod 755 "${pkgdir}/opt/deadsync/deadsync"

    # -----------------------------------------------------------------------
    # Wrapper script so `deadsync` works from any terminal
    # -----------------------------------------------------------------------
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/deadsync" <<'EOF'
#!/bin/sh
exec /opt/deadsync/deadsync "$@"
EOF

    # -----------------------------------------------------------------------
    # Desktop entry
    # -----------------------------------------------------------------------
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/deadsync.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DeadSync
GenericName=Rhythm Game
Comment=ITG/StepMania engine focused on perfect sync and competitive performance
Exec=/usr/bin/deadsync
Icon=deadsync
Categories=Game;
Keywords=ITG;StepMania;rhythm;dance;
StartupNotify=true
EOF

    # Install all sized icons into the hicolor theme so Icon=deadsync in the
    # .desktop file resolves correctly through the icon theme lookup chain.
    local _icondir="${_src}/assets/graphics/icon"
    for _size in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "${_icondir}/icon-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/deadsync.png"
    done
    install -Dm644 "${_icondir}/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deadsync.svg"

    [[ -f "${_src}/LICENSE" ]] && install -Dm644 "${_src}/LICENSE" \
        "${pkgdir}/usr/share/licenses/deadsync/LICENSE"
}
