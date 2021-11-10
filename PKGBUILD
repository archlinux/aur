# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.13.4_beta
_pkgver="${pkgver//_/-}"
__pkgver="${_pkgver//\./\\\.}"
pkgrel=1
pkgdesc="Lightning Network Daemon ⚡"
arch=('x86_64')
url="https://github.com/lightningnetwork/lnd"
license=('MIT')
provides=('lnd' 'lncli')
conflicts=('lnd' 'lnd-git')
source=(
    "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/$_pkgname-linux-amd64-v$_pkgver.tar.gz"
    "$_pkgname-manifest-guggero-v$_pkgver.txt.sig::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-guggero-v$_pkgver.sig"
    "$_pkgname-manifest-guggero-v$_pkgver.txt::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-v$_pkgver.txt"
    "$_pkgname-manifest-roasbeef-v$_pkgver.txt.sig::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-roasbeef-v$_pkgver.sig"
    "$_pkgname-manifest-roasbeef-v$_pkgver.txt::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-v$_pkgver.txt"
    "$_pkgname-LICENSE-v$_pkgver::https://raw.githubusercontent.com/lightningnetwork/$_pkgname/v$_pkgver/LICENSE"
)
sha512sums=(
    '05c819dd5b594a5556ed82e21f136fe591a8628c2df8da362de7d78d8b10a56190a0e1bcec1a402e9b733e98dff5e857075c2b21e50de65ca488bbb219a6ee70'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '9837c5d097a2838cf6dc992cc25b9e94946e401131e13e66a699077c3e2de1b89fb1de71027d46d7230464ebbad3ae8df118d459961b28995677d56fded451ca'
)

# LND provides manifest signatures from several developers
# This PKGFILE checks two of them
# To import their keys run
# curl https://keybase.io/guggero/pgp_keys.asc | gpg --import
# curl https://keybase.io/roasbeef/pgp_keys.asc | gpg --import
# But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the developers.
validpgpkeys=(
    'F4FC70F07310028424EFC20A8E4256593F177720' # guggero
    'E4D85299674B2D31FAA1892E372CBD7633C61696' # roasbeef
)

prepare() {
    # We only check "roasbeef's" manifest here, as they are all the same file
    cat "$_pkgname-manifest-roasbeef-v$_pkgver.txt" \
        | grep "^[0-9a-f]\{64\}  $_pkgname-linux-amd64-v$__pkgver\(\.tar\.gz\|/lnd\|/lncli\)$" \
        | sha256sum -c -
}

package() {
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lncli" -t "$pkgdir/usr/bin";
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lnd" -t "$pkgdir/usr/bin";

    install -Dm644 "${srcdir}/$_pkgname-LICENSE-v$_pkgver" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

