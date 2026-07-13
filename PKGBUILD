# Maintainer: WaiJade <waijade@outlook.com>

pkgname=astrobox-ng
pkgver=2.0.2
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
source=("https://github.com/AstralSightStudios/AstroBox-NG/releases/download/v${pkgver}/astrobox-ng-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('7575615aea0149045f0290f7e3a80ff4c94d5c907d46efa0408ffafbfae6ea2b')
makedepends=('curl')

prepare() {
    local _base="AstralSightStudios/AstroBox-NG/releases/download/v${pkgver}/astrobox-ng-${pkgver}-1-x86_64.pkg.tar.zst"
    local _file="astrobox-ng-${pkgver}-1-x86_64.pkg.tar.zst"
    local _expected="7575615aea0149045f0290f7e3a80ff4c94d5c907d46efa0408ffafbfae6ea2b"
    local _mirrors=(
        "https://github.com/${_base}|GitHub"
        "https://ghfast.top/https://github.com/${_base}|ghfast"
        "https://ghproxy.com/https://github.com/${_base}|ghproxy"
        "https://gh-proxy.com/https://github.com/${_base}|ghproxy2"
        "https://ghproxy.net/https://github.com/${_base}|ghproxy3"
        "https://ghgo.xyz/https://github.com/${_base}|ghgo"
        "https://gh.ddlc.top/https://github.com/${_base}|ghddl"
    )

    echo "==> Testing download mirrors..."
    local _best_url="" _best_time="999" _best_name=""

    for _entry in "${_mirrors[@]}"; do
        local _url="${_entry%%|*}"
        local _name="${_entry##*|}"
        local _time
        _time=$(curl -sI --max-time 5 -o /dev/null -w "%{time_total}" "$_url" 2>/dev/null) || true
        local _code
        _code=$(curl -sI --max-time 5 -o /dev/null -w "%{http_code}" "$_url" 2>/dev/null) || true
        if [[ "$_code" =~ ^(200|301|302) ]]; then
            printf "    %-12s % 6ss (%s)\n" "$_name" "$_time" "$_code"
            if awk "BEGIN{exit !($_time < $_best_time)}" 2>/dev/null; then
                _best_time="$_time"
                _best_url="$_url"
                _best_name="$_name"
            fi
        else
            printf "    %-12s failed (%s)\n" "$_name" "$_code"
        fi
    done

    if [ -z "$_best_url" ]; then
        error "All mirrors failed"
        return 1
    fi

    msg "Best mirror: $_best_name (${_best_time}s)"
    msg "Downloading $_file..."
    curl -L --progress-bar -o "$srcdir/$_file" "$_best_url"

    msg "Verifying checksum..."
    local _real
    _real=$(sha256sum "$srcdir/$_file" | awk '{print $1}')
    if [ "$_real" != "$_expected" ]; then
        error "Checksum mismatch: got $_real"
        return 1
    fi
    msg "Checksum OK"

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