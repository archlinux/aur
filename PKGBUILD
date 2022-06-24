# Maintainer: Setpill
pkgname=lnd-bin
_pkgname=lnd
pkgver=0.15.0_beta
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
    '93a24ec7fba01c0ec8889b94277f55cef89e41ae5009b3db005c5625ed7cbeb2e7462229c5ff60ba1f133fe99938807885559bdfb63a26e9a65f5348a3984c58'
    '49de7041d5c7448a8f5cc387e4e820eca2a87c02b70d5a38aa3823354d960843e93ca12bd8b66a13708937539da85b90328bd4c32575792f0aa6755a011ba4bb'
)

# List of maintainer pubkeys, see https://github.com/lightningnetwork/lnd/tree/master/scripts/keys
validpgpkeys=(
    'E97A1AB6C77A1D2B72F50A6F90E00CCB1C74C611' # arshbot
    '9FC6B0BFD597A94DBF09708280E5375C094198D8' # bhandras
    '15E7ECF257098A4EF91655EB4CA7FE54A6213C91' # carlaKC
    '7E81EF6B9989A9CC93884803118759E83439A9B1' # Crypt-iQ
    'F4FC70F07310028424EFC20A8E4256593F177720' # guggero
    'EB13A98091E8D67CDD7FC5A7E9FE7FE00AD163A4' # positiveblue
    'E4D85299674B2D31FAA1892E372CBD7633C61696' # roasbeef
    '729E9D9D92C75A5FBFEEE057B5DD717BEF7CA5B1' # wpaulino
)

prepare() {
    manifestfile="$srcdir/$_pkgname-manifest-v$_pkgver.txt"

    curl -fLso $manifestfile "https://github.com/lightningnetwork/$_pkgname/releases/download/v$_pkgver/manifest-v$_pkgver.txt"

    # Check the binaries match the manifest
    cat "$manifestfile" \
        | grep "^[0-9a-f]\{64\}  $_pkgname-linux-amd64-v$__pkgver\(\.tar\.gz\|/lnd\|/lncli\)$" \
        | sha256sum -c -

    maintainers=(
        'arshbot'
        'bhandras'
        'carlaKC'
        'Crypt-iQ'
        'guggero'
        'positiveblue'
        'roasbeef'
        'wpaulino'
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

