# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.20.0_beta
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
    'f403f8d73e75506c536165a1c717d9fd6601d91ca29642ee714bfd99ae13010ab95b393744d000c4b34c91cab18c4292e013ab13077236744c3687fbec95e16c'
    '49de7041d5c7448a8f5cc387e4e820eca2a87c02b70d5a38aa3823354d960843e93ca12bd8b66a13708937539da85b90328bd4c32575792f0aa6755a011ba4bb'
)

# This is a binary package, build flags do not apply
options=(!debug)

# List of maintainer pubkeys, see https://github.com/lightningnetwork/lnd/tree/master/scripts/keys
validpgpkeys=(
    '9FC6B0BFD597A94DBF09708280E5375C094198D8' # bhandras
    '15E7ECF257098A4EF91655EB4CA7FE54A6213C91' # carlaKC
    '26984CB69EB8C4A26196F7A4D7D916376026F177' # ellemouton
    'C97AAA1470F979878F7A6DEDC3440ACF100A33B4' # ffranr
    'F4FC70F07310028424EFC20A8E4256593F177720' # guggero
    '32F7EA1E7A0339F7D37164B9F82D456EA023C9BF' # hieblmi
    '5295A477FFC8064D7057B191FA7E65C951F12439' # proofofkeags
    'A5B61896952D9FDA83BC054CDC42612E89237182' # roasbeef
    '4DC235556B18694E08518DBB671103D881A5F0E4' # sputn1ck
    '3E9BD4436C288039CA827A9200C9E2BC2E45666F' # suheb
    'C20A78516A0944900EBFCA29961CC8259AE675D4' # ViktorT-11
    'E85497D2DBA0EB9ADB0024279BCD95C4FF296868' # yyforyongyu
    '5F75437E11695F86D50C11BB1AFF9C4DCED6D666' # ziggie1984
)

prepare() {
    manifestfile="$srcdir/$_pkgname-manifest-v$_pkgver.txt"

    curl -fLso $manifestfile "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-v$_pkgver.txt"

    # Check the binaries match the manifest
    cat "$manifestfile" \
        | grep "^[0-9a-f]\{64\}  $_pkgname-linux-amd64-v$__pkgver\(\.tar\.gz\|/lnd\|/lncli\)$" \
        | sha256sum -c -

    maintainers=(
        'bhandras'
        'carlaKC'
        'ellemouton'
        'ffranr'
        'guggero'
        'hieblmi'
        'proofofkeags'
        'roasbeef'
        'sputn1ck'
        'suheb'
        'ViktorT-11'
        'yyforyongyu'
        'ziggie1984'
    )

    numsigs=0

    for (( i=0; i<${#maintainers[@]}; i++ )); do
        maintainer=${maintainers[$i]}
        validpgpkey=${validpgpkeys[$i]}
        # Try to get the signature for this maintainer, skip if doesn't exist
        signaturefile="$srcdir/$_pkgname-manifest-$maintainer-v$_pkgver.txt.sig"
        curl -fLso "$signaturefile" \
            "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-$maintainer-v$_pkgver.sig" \
            || continue

        echo "[32mFound signature from $maintainer[0m"

        # Verify the signature
        gpgoutput=$(gpg --status-fd=1 --verify "$signaturefile" "$manifestfile" || true)

        # Check if fingerprint matches whitelisted one
        fingerprint=$(echo "$gpgoutput" | awk '{ if ($2 == "VALIDSIG") {print $12} }')
        if [[ ! "${validpgpkey}" = "${fingerprint}" ]]; then
            echo "[33mNot a valid signature from the whitelisted key for this maintainer, ignoring[0m"
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
