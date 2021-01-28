# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.12.0_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Lightning Network Daemon ⚡"
arch=('x86_64')
url="https://github.com/lightningnetwork/lnd"
license=('MIT')
provides=('lnd' 'lncli')
conflicts=('lnd' 'lnd-git')
source=(
    "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/$_pkgname-linux-amd64-v$_pkgver.tar.gz"
    "$_pkgname-manifest-bitconner-v$_pkgver.txt::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-bitconner-v$_pkgver.txt.asc"
    "$_pkgname-manifest-guggero-v$_pkgver.txt::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-guggero-v$_pkgver.txt.asc"
    "$_pkgname-manifest-roasbeef-v$_pkgver.txt::https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-roasbeef-v$_pkgver.txt.asc"
    "$_pkgname-LICENSE-v$_pkgver::https://raw.githubusercontent.com/lightningnetwork/$_pkgname/v$_pkgver/LICENSE"
)
sha512sums=(
    'a8ad69e490522c6dcd9ad95d944651d74f057bcedb64a833c752a178cbb9a95b7cd9eba0d5cf3392b08faa38bd41fbc91c202b35b3534a937628535c3fcf5bec'
    'SKIP'
    'SKIP'
    'SKIP'
    '9837c5d097a2838cf6dc992cc25b9e94946e401131e13e66a699077c3e2de1b89fb1de71027d46d7230464ebbad3ae8df118d459961b28995677d56fded451ca'
)

prepare() {
    # If you are missing any of these keys, run curl https://keybase.io/$maintainer/pgp_keys.asc | gpg --import
    # (NB: replace $maintainer with the name of the maintainer that you are missing the pubkey of)
    # But of course don't trust this rando AUR comment - verify yourself that the keybase accounts really belong to the maintainers.
    for maintainer in bitconner guggero roasbeef
    do
        echo "Verifying signatures for $maintainer"
        gpg --verify "$_pkgname-manifest-$maintainer-v$_pkgver.txt"
        sha256sum --ignore-missing -c "$_pkgname-manifest-$maintainer-v$_pkgver.txt"
    done
}

package() {
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lncli" -t "$pkgdir/usr/bin";
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lnd" -t "$pkgdir/usr/bin";

    install -Dm644 "${srcdir}/$_pkgname-LICENSE-v$_pkgver" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

