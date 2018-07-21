# Upstream: RuneScape Linux <noreply@jagex.com>
# Contributor: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.2.4
pkgrel=4
pkgdesc="RuneScape Game Client (NXT)"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    gtk2
    libcurl-compat
    libpng12
    libvorbis
    sdl2
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
source=("${pkgname}_${pkgver}_Release::https://content.runescape.com/downloads/ubuntu/dists/trusty/Release"
        "${pkgname}_${pkgver}_Release.gpg::https://content.runescape.com/downloads/ubuntu/dists/trusty/Release.gpg"
        "wrapper.sh")
source_x86_64=("${pkgname}_${pkgver}_amd64.deb::https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb"
               "${pkgname}_${pkgver}_Packages::https://content.runescape.com/downloads/ubuntu/dists/trusty/non-free/binary-amd64/Packages")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
sha256sums_x86_64=('SKIP'
                   'SKIP')
validpgpkeys=("AAC9264309E4D717441DB9527373B12CE03BEB4B")

# avoid caching in makepkg!
SRCDEST=$startdir

_verify_repo() {
    if (( SKIPPGPCHECK )); then
        return 0
    fi

    local Release=${source[0]%%::*}
    local debfile=${source_x86_64[0]%%::*}
    local Packages=${source_x86_64[1]%%::*}
    local jagexpgpkey=${validpgpkeys[0]}
    local _out

    msg2 "Verifying Release (PGP)..."
    if ! _out=$(gpg --batch --status-fd 1 \
                    --trust-model always \
                    --verify "$Release.gpg" "$Release" \
                    2>&1); then
        error "PGP signature of 'Release' could not be verified"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    elif ! egrep -qs "^\\[GNUPG:\\] VALIDSIG $jagexpgpkey " <<< "$_out"; then
        error "PGP signature of 'Release' was not made by Jagex"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    fi

    msg2 "Parsing Release..."
    _out=$(awk 'ok && $3 == "non-free/binary-amd64/Packages" {print $1; exit}
                /^[^[:space:]]/ {ok=0}
                /^SHA256:$/ {ok=1}' < "$Release")
    if ! [[ $_out =~ ^[0-9a-f]{64}$ ]]; then
        error "Could not find hash of 'Packages' in Release file"
        return 1
    fi

    msg2 "Verifying Packages (SHA256)..."
    if ! sha256sum --quiet --check <<< "$_out *$Packages"; then
        error "Hash sum of 'Packages' did not match expected"
        return 1
    fi

    msg2 "Parsing Packages..."
    _out=$(awk 'ok && /^SHA256:/ {print $2; exit}
                /^Package:/ {ok=0}
                /^Package: runescape-launcher$/ {ok=1}' < "$Packages")
    if ! [[ $_out =~ ^[0-9a-f]{64}$ ]]; then
        error "Could not find hash of $debfile in Packages file"
        return 1
    fi

    msg2 "Verifying $debfile (SHA256)..."
    if ! sha256sum --quiet --check <<< "$_out *$debfile"; then
        error "Hash sum of '$debfile' did not match expected"
        return 1
    fi
}

prepare() {
    _verify_repo

    rm -rf "$srcdir/$pkgname-$pkgver"
    mkdir "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"

    bsdtar xf ../control.tar.gz
    bsdtar xf ../data.tar.xz
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    cp -a usr "$pkgdir"

    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}

    install -Dm0755 ../wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
