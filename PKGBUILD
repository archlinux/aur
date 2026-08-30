# Maintainer: WaiJade <waijade@outlook.com>

pkgname=astrobox-ng
pkgver=2.1.0
pkgrel=1
pkgdesc="AstroBox is a leading tool for managing and extending wearable devices"
arch=('x86_64')
url="https://github.com/AstralSightStudios/AstroBox-NG"
license=('AGPL-3.0')
options=('!debug')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libx11'
    'gcc-libs'
    'glibc'
    'zlib'
    'bzip2'
    'libxcb'
    'libxkbcommon'
    'dbus'
    'libsecret'
    'libsoup3'
    'gstreamer'
    'gst-plugins-base'
    'libepoxy'
    'atk'
    'at-spi2-core'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'harfbuzz'
    'hicolor-icon-theme'
    'desktop-file-utils'
    'shared-mime-info'
)
makedepends=('curl')

prepare() {
    local _base="AstralSightStudios/AstroBox-NG/releases/download/v${pkgver}/AstroBox-${pkgver}-1_x86_64.pkg.tar.zst"
    local _file="AstroBox-${pkgver}-1_x86_64.pkg.tar.zst"
    local _expected="b3eb25a410db4daba91d4dd62256a42a17d8c89d9e3c614336209174af1becad"
    local _mirrors=(
        "https://github.com/${_base}|GitHub"
        "https://ghfast.top/https://github.com/${_base}|ghfast"
        "https://gh-proxy.com/https://github.com/${_base}|ghproxy2"
        "https://ghproxy.net/https://github.com/${_base}|ghproxy3"
        "https://ghgo.xyz/https://github.com/${_base}|ghgo"
        "https://gh.ddlc.top/https://github.com/${_base}|ghddl"
    )

    echo "==> Downloading $_file..."
    local _ok=0
    for _entry in "${_mirrors[@]}"; do
        local _url="${_entry%%|*}"
        local _name="${_entry##*|}"
        msg "Trying $_name..."
        curl -L --fail --max-time 600 --progress-bar -o "$srcdir/$_file" "$_url" 2>/dev/null || true
        local _real
        _real=$(sha256sum "$srcdir/$_file" 2>/dev/null | awk '{print $1}') || true
        if [ -n "$_real" ] && [ "$_real" = "$_expected" ]; then
            msg "Checksum OK via $_name"
            _ok=1
            break
        fi
        warning "Checksum mismatch via $_name: got ${_real:-download failed}, trying next mirror..."
        rm -f "$srcdir/$_file"
    done

    if [ "$_ok" -ne 1 ]; then
        error "All mirrors failed or checksum mismatch"
        return 1
    fi

    msg "Extracting..."
    bsdtar -xf "$srcdir/$_file" -C "$srcdir"
    rm -f "$srcdir/$_file"
    rm -f "$srcdir/.BUILDINFO" "$srcdir/.MTREE" "$srcdir/.PKGINFO"
}

package() {
    cd "$srcdir"
    cp -a . "$pkgdir"
    rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
