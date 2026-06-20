# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=comfy-desktop-bin
pkgver=1.0.22_260617ydfxksw4f
pkgrel=1
pkgdesc='Official desktop application for ComfyUI — install, run, and manage ComfyUI with GPU-ready environments'
arch=('x86_64' 'aarch64')
url='https://www.comfy.org/'
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gtk3'
    'libcups'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxtst'
    'mesa'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=('git: fallback for git operations if bundled pygit2 fails')
provides=('comfy-desktop')
conflicts=('comfy-desktop' 'comfyui-desktop-2-beta')
replaces=('comfyui-desktop-2-beta')
options=('!strip' '!debug')

_dl_base='https://dl.todesktop.com/241130tqe9q3y'
_build_id=${pkgver#*_}
_upstream_ver=${pkgver%_*}
source=("LICENSE-${_upstream_ver}::https://raw.githubusercontent.com/Comfy-Org/Comfy-Desktop/v${_upstream_ver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dl_base}/builds/${_build_id}/linux/deb/x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dl_base}/builds/${_build_id}/linux/deb/arm64")
sha256sums=('956420696101ac11daff15d701ee0dc9834c68834d92bfddfbbd11c8ad7cd4b6')
sha256sums_x86_64=('6a1ac353163383d956e47da73ed26eca3db4d60a16e0640b4b7850bbb933d6c2')
sha256sums_aarch64=('1555720db5bbb4e19e3d30c0b50e40b73cbfa93fc0b1d9c0f1236cc7fdec2626')

latestver() {
    # The CDN stopped publishing versioned Linux URLs after v1.0.8; the
    # new pattern is /builds/<build_id>/linux/deb/x64.  The unversioned
    # /linux/deb/x64 always serves the latest build, and the Debian
    # control file embeds <semver>-<build_id>.
    #
    # Single-pass streaming download: read member-1 header (68 bytes),
    # compute its size from the ar header, skip its content, read member-2
    # header, compute its size, then read exactly the control.tar.gz data.
    # Every byte count comes from an ar header field — no guesses.
    local tmpf deb_ver db_size ctrl_size hdr1 hdr2
    local AR_GLOBAL_MAGIC=8 AR_MEMBER_HDR=60 AR_SIZE_FIELD_OFS=48 AR_SIZE_FIELD_LEN=10
    local m1_hdr_len=$(( AR_GLOBAL_MAGIC + AR_MEMBER_HDR ))
    tmpf=$(mktemp) hdr1=$(mktemp) hdr2=$(mktemp)
    curl -sL "${_dl_base}/linux/deb/x64" 2>/dev/null | {
        # Read member 1 header.  dd bs=1 reads exactly count bytes
        # without buffering; head -c would over-read and discard the
        # remainder from the pipe, starving later commands.
        dd bs=1 count="$m1_hdr_len" of="$hdr1" 2>/dev/null
        db_size=$(( 10#$(dd if="$hdr1" bs=1 skip=$((AR_GLOBAL_MAGIC + AR_SIZE_FIELD_OFS)) \
            count="$AR_SIZE_FIELD_LEN" 2>/dev/null | tr -d ' ') ))
        # Skip member 1 content (even-aligned)
        dd bs=1 count=$(( db_size + (db_size & 1) )) of=/dev/null 2>/dev/null
        # Read member 2 header
        dd bs=1 count="$AR_MEMBER_HDR" of="$hdr2" 2>/dev/null
        ctrl_size=$(( 10#$(dd if="$hdr2" bs=1 skip="$AR_SIZE_FIELD_OFS" \
            count="$AR_SIZE_FIELD_LEN" 2>/dev/null | tr -d ' ') ))
        [[ "$ctrl_size" -gt 0 ]] || exit 1
        # Read member 2 content (control.tar.gz) in one block;
        # iflag=fullblock ensures dd re-reads until bs bytes are received
        dd bs="$ctrl_size" count=1 iflag=fullblock 2>/dev/null
    } > "$tmpf"
    deb_ver=$(bsdtar -xzf "$tmpf" -O ./control 2>/dev/null |
        sed -nE 's/^Version: *(.+)/\1/p')
    rm -f "$tmpf" "$hdr1" "$hdr2"
    [[ -n "$deb_ver" ]] || return 1
    echo "${deb_ver//-/_}"
}

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Prune non-target 7zip binaries
    local _7z="$pkgdir/opt/Comfy Desktop/resources/app.asar.unpacked/node_modules/7zip-bin"
    rm -rf "$_7z/mac"
    case "$CARCH" in
        x86_64)  find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name x64 -exec rm -rf {} + ;;
        aarch64) find "$_7z/linux" -mindepth 1 -maxdepth 1 -type d ! -name arm64 -exec rm -rf {} + ;;
    esac

    # Remove deb-specific changelog
    rm -rf "$pkgdir/usr/share/doc"

    install -d "$pkgdir/usr/bin"
    ln -s '/opt/Comfy Desktop/comfyui-desktop-2' "$pkgdir/usr/bin/comfy-desktop"

    # License
    install -Dm644 "$srcdir/LICENSE-${_upstream_ver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
