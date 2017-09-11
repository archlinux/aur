# Upstream: RuneScape Linux <noreply@jagex.com>
# Contributor: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=runescape-launcher
pkgver=2.2.4
pkgrel=3
_pkgbump=8
pkgdesc="RuneScape Game Client (NXT)"
arch=(x86_64)
license=(custom)
url="https://www.runescape.com/"
depends=(
    glew1.10
    libcurl-compat
    libpng12
    libvorbis
    sdl2
    gtk2
)
conflicts=(runescape-launcher-nxt)
provides=(runescape-launcher-nxt)
source=("wrapper.sh"
        "runescape.gpg.key")
source_x86_64=("${pkgname}_${pkgver}-${_pkgbump}_amd64.deb::https://content.runescape.com/downloads/ubuntu/pool/non-free/r/$pkgname/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('d20151c9111a77e753954638eb60f1b4ec0d2c86e173041dcd95bb7b309d5b12'
            '2e32bc0110d349a1613878a681dc7748f83fb8766b11911c71a923c101382843')
sha256sums_x86_64=('SKIP')

jagexpgpkey="AAC9264309E4D717441DB9527373B12CE03BEB4B"

_verify_deb() {
    local _out

    if (( SKIPPGPCHECK )); then
        return 0
    fi

    msg2 "Importing Jagex PGP key..."
    gpg --import runescape.gpg.key

    msg2 "Verifying _gpgbuilder (PGP)..."
    if ! _out=$(gpg --batch --yes --status-fd 1 \
                    --trust-model always \
                    --output _gpgbuilder.out \
                    --decrypt _gpgbuilder \
                    2>&1); then
        error "PGP signature of '_gpgbuilder' could not be verified"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    elif ! egrep -qs "^\\[GNUPG:\\] VALIDSIG $jagexpgpkey " <<< "$_out"; then
        error "PGP signature of '_gpgbuilder' was not made by Jagex"
        echo "$_out" | grep -v "^\\[GNUPG:\\]"
        return 1
    fi

    _out=$(awk 'ok && $4 == "data.tar.xz" {print $2 " *" $4}
                /^[^[:space:]]/ {ok=0}
                /^Files:/ {ok=1}' < _gpgbuilder.out)
    if ! [[ $_out =~ ^[0-9a-z]{40} ]]; then
        error "Could not find hash sums in _gpgbuilder"
        return 1
    elif ! sha1sum --check <<< "$_out"; then
        error "Hash sums of .deb contents did not match expected"
        return 1
    fi
}

_verify_repo() {
    local repo="https://content.runescape.com/downloads/ubuntu/dists/trusty"
    local _out

    if (( SKIPPGPCHECK )); then
        return 0
    fi

    msg2 "Importing Jagex PGP key..."
    gpg --import runescape.gpg.key

    msg2 "Downloading Release..."
    curl -O "$repo/Release"
    msg2 "Downloading Release.gpg..."
    curl -O "$repo/Release.gpg"
    msg2 "Downloading Packages..."
    curl -O "$repo/non-free/binary-amd64/Packages"

    msg2 "Verifying Release (PGP)..."
    if ! _out=$(gpg --batch --status-fd 1 \
                    --trust-model always \
                    --verify Release.gpg Release \
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
                /^SHA256:$/ {ok=1}' < Release)
    if ! [[ $_out =~ ^[0-9a-f]{64}$ ]]; then
        error "Could not find hash of 'Packages' in Release file"
        return 1
    fi

    msg2 "Verifying Packages (SHA256)..."
    if ! sha256sum --quiet --check <<< "$_out *Packages"; then
        error "Hash sum of 'Packages' did not match expected"
        return 1
    fi

    msg2 "Parsing Packages..."
    _deb=${source_x86_64[0]%%::*}
    _out=$(awk 'ok && /^SHA256:/ {print $2; exit}
                /^Package:/ {ok=0}
                /^Package: runescape-launcher$/ {ok=1}' < Packages)
    if ! [[ $_out =~ ^[0-9a-f]{64}$ ]]; then
        error "Could not find hash of $_deb in Packages file"
        return 1
    fi

    msg2 "Verifying $_deb (SHA256)..."
    if ! sha256sum --quiet --check <<< "$_out *$_deb"; then
        error "Hash sum of '$_deb' did not match expected"
        return 1
    fi

    msg2 "Extracting $_deb..."
    bsdtar xvf "$_deb"
}

prepare() {
    if [[ -s _gpgbuilder ]]; then
        _verify_deb
    else
        _verify_repo
    fi

    mkdir -p "$srcdir/$pkgname-$pkgver-$_pkgbump"
    cd "$srcdir/$pkgname-$pkgver-$_pkgbump"

    bsdtar xf ../control.tar.gz
    bsdtar xf ../data.tar.xz
}

package() {
    cd "$srcdir/$pkgname-$pkgver-$_pkgbump"

    cp -a usr "$pkgdir"

    mv "$pkgdir"/usr/bin/runescape-launcher{,.real}

    install -Dm0755 ../wrapper.sh "$pkgdir"/usr/bin/runescape-launcher
    install -Dm0644 copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
