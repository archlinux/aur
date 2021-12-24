# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.14.1_beta
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
    "$_pkgname-LICENSE-v$_pkgver::https://raw.githubusercontent.com/lightningnetwork/$_pkgname/v$_pkgver/LICENSE"
)
sha512sums=(
    '6960d99ce2df6fe3c628fd05aa0adaae7274f0cc3098471344d97c838891e78cd423ef8698fe12747f9cf107375ad2106a9708ac70b0ebd01d5531273820af99'
    '9837c5d097a2838cf6dc992cc25b9e94946e401131e13e66a699077c3e2de1b89fb1de71027d46d7230464ebbad3ae8df118d459961b28995677d56fded451ca'
)

# List of maintainer pubkeys, see https://github.com/lightningnetwork/lnd/tree/master/scripts/keys
validpgpkeys=(
    'E97A1AB6C77A1D2B72F50A6F90E00CCB1C74C611' # Harsha Goli
    '9FC6B0BFD597A94DBF09708280E5375C094198D8' # Andras Banki-Horvath
    '15E7ECF257098A4EF91655EB4CA7FE54A6213C91' # carlakirkcohen
    '9C8D61868A7C492003B2744EE7D737B67FA592C7' # Conner Fromknecht
    '7E81EF6B9989A9CC93884803118759E83439A9B1' # eugene siegel
    'F4FC70F07310028424EFC20A8E4256593F177720' # Oliver Gugger
    '7AB3D7F5911708842796513415BAADA29DA20D26' # Johan T Halseth
    'EB13A98091E8D67CDD7FC5A7E9FE7FE00AD163A4' # Jordi Montes
    'E4D85299674B2D31FAA1892E372CBD7633C61696' # Olaoluwa Osuntokun
    '729E9D9D92C75A5FBFEEE057B5DD717BEF7CA5B1' # Wilmer Paulino
)

prepare() {
    curl -fLso "$srcdir/$_pkgname-manifest-v$_pkgver.txt" "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-v$_pkgver.txt"

    # Check the binaries match the manifest
    cat "$srcdir/$_pkgname-manifest-v$_pkgver.txt" \
        | grep "^[0-9a-f]\{64\}  $_pkgname-linux-amd64-v$__pkgver\(\.tar\.gz\|/lnd\|/lncli\)$" \
        | sha256sum -c -

    maintainers=(
        "arshbot"
        "bhandras"
        "carlaKC"
        "Crypt-iQ"
        "eugene_"
        "guggero"
        "positiveblue"
        "roasbeef"
    )

    numsigs=0

    for maintainer in ${maintainers[@]}; do
        # Try to get the signature for this maintainer, skip if doesn't exist
        curl -fLso "$srcdir/$_pkgname-manifest-$maintainer-v$_pkgver.txt.sig" \
            "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-$maintainer-v$_pkgver.sig" \
            || continue

        echo "[32mFound signature from $maintainer[0m"

        # Verify the signature and output the fingerprint used
        fingerprint=$(\
            gpg --status-fd=1 --trust-model=always --verify \
                "$_pkgname-manifest-$maintainer-v$_pkgver.txt.sig" \
                "$_pkgname-manifest-v$_pkgver.txt" \
            | awk '{ if ($2 == "VALIDSIG") {print $12} }' \
        )

        # Check if fingerprint in whitelisted array
        if [[ ! " ${validpgpkeys[*]} " =~ " ${fingerprint} " ]]; then
            echo "[33mSignature not from a whitelisted key, ignoring[0m"
            continue
        fi

        numsigs=$((numsigs + 1))
    done

    # LND maintainers try to provide at least 5 signatures per release; break if we have found less
    if (( $numsigs < 5 )); then
        echo "[31mOnly $numsigs valid signatures found; exiting[0m"
        exit 1
    fi
    echo "[32mFound $numsigs valid signatures[0m"
}

package() {
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lncli" -t "$pkgdir/usr/bin";
    install -Dm 755 "$srcdir/$_pkgname-linux-amd64-v$_pkgver/lnd" -t "$pkgdir/usr/bin";

    install -Dm644 "${srcdir}/$_pkgname-LICENSE-v$_pkgver" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

