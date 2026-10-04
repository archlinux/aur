# Maintainer: WaiJade <waijade@outlook.com>

pkgname=astrobox-ng
pkgver=2.2.0
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
    local _base="AstralSightStudios/AstroBox-NG/releases/download/v${pkgver}/AstroBox-${pkgver}-${pkgrel}_x86_64.pkg.tar.zst"
    local _file="AstroBox-${pkgver}-${pkgrel}_x86_64.pkg.tar.zst"
    local _expected="c0238e7967e521d56462233fa804b3b4da058a829be192b4d0397db755402c53"
    local _mirrors=(
        "https://github.com/${_base}|GitHub"
        "https://ghfast.top/https://github.com/${_base}|ghfast"
        "https://gh.ddlc.top/https://github.com/${_base}|ghddl"
    )

    echo "==> Testing download mirrors..."
    local _best_url="" _best_time="999" _best_name=""
    local _tmpdir
    _tmpdir=$(mktemp -d)

    # Probe with a real ranged GET (-L follows redirects, so we time the actual
    # CDN endpoint instead of a 302 hop) and capture the first bytes.  A bare
    # HTTP status is not enough: dead/parked proxies happily answer 200 with an
    # HTML error page, so verify the payload really looks like a zstd archive.
    for i in "${!_mirrors[@]}"; do
        local _entry="${_mirrors[$i]}"
        local _url="${_entry%%|*}"
        local _name="${_entry##*|}"
        (
            local _result _magic
            _result=$(curl -sL --max-time 8 -r 0-3 \
                -o "$_tmpdir/$i.bin" \
                -w "%{time_total} %{http_code}" "$_url" 2>/dev/null) || true
            _magic=$(od -An -tx1 -N4 "$_tmpdir/$i.bin" 2>/dev/null | tr -d ' \n')
            printf '%s %s %s %s\n' "${_result:-0.000 000}" "${_magic:--}" "$_name" "$_url" \
                > "$_tmpdir/$i"
        ) &
    done
    wait

    for i in "${!_mirrors[@]}"; do
        local _time _code _magic _name _url
        read -r _time _code _magic _name _url < "$_tmpdir/$i" 2>/dev/null || continue
        if [[ "$_code" == 200 || "$_code" == 206 ]] && [[ "$_magic" != 3c21444f ]]; then
            printf "    %-12s % 6ss (%s)\n" "$_name" "$_time" "$_code"
            if awk "BEGIN{exit !($_time < $_best_time)}" 2>/dev/null; then
                _best_time="$_time"
                _best_url="$_url"
                _best_name="$_name"
            fi
        else
            printf "    %-12s rejected (%s)\n" "$_name" "$_code"
        fi
    done
    rm -rf "$_tmpdir"

    if [ -z "$_best_url" ]; then
        error "All mirrors failed"
        return 1
    fi

    msg "Best mirror: $_best_name (${_best_time}s)"
    msg "Downloading $_file..."
    curl -L --fail -C - --retry 5 --retry-delay 3 --retry-all-errors \
         --connect-timeout 15 --progress-bar \
         -o "$srcdir/$_file" "$_best_url" \
        || { error "Download failed: $_best_url"; return 1; }

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
