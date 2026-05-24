# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-reproducible
_pkgname=sparrow-wallet
pkgver=2.5.1
_jdkver=25.0.2_10
_jdkmajor="${_jdkver%%[^0-9]*}"
pkgrel=2
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy (reproducible build)"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'freetype2'
    'hicolor-icon-theme'
    'libxcrypt-compat'
    'libxrender'
    'libxtst'
)
makedepends=('git')
optdepends=(
    'bitbox-udev: udev rules for BitBox hardware wallets'
    'bitcoin-daemon: connect to a local Bitcoin Core node'
    'keepkey-udev: udev rules for KeepKey hardware wallets'
    'ledger-udev: udev rules for Ledger hardware wallets'
    'python-ckcc-protocol: Python CLI and udev rules for Coldcard hardware wallets'
    'trezor-udev: udev rules for Trezor hardware wallets'
)
provides=('sparrow-wallet')
conflicts=('sparrow-wallet' 'sparrow-wallet-git')
options=(!debug !strip)
source=(
    "sparrow::git+https://github.com/sparrowwallet/sparrow.git#tag=${pkgver}"
    "sparrow-bin.tar.gz::https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrowwallet-${pkgver}-x86_64.tar.gz"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
    "https://github.com/adoptium/temurin${_jdkmajor}-binaries/releases/download/jdk-${_jdkver/_/%2B}/OpenJDK${_jdkmajor}U-jdk_x64_linux_hotspot_${_jdkver}.tar.gz"
)
sha256sums=('2c2b5d39977a13f29c743159047db95bbd12ba59f142dbb66367b4f4b57b9ace'
            '1bd3675962f1b59d08c86f0606dbd38749361b1cbf4f0af58e681d37202aa284'
            'SKIP'
            'SKIP'
            '987387933b64b9833846dee373b640440d3e1fd48a04804ec01a6dbf718e8ab8')

prepare() {
    cd "$srcdir/sparrow"
    git submodule init
    git config submodule.drongo.url "$srcdir/drongo"
    git config submodule.lark.url "$srcdir/lark"
    git -c protocol.file.allow=always submodule update
}

_set_jdk() {
    export JAVA_HOME="$srcdir/jdk-${_jdkver/_/+}"
    export PATH="$JAVA_HOME/bin:$PATH"
}

build() {
    _set_jdk
    cd "$srcdir/sparrow"

    echo "Building ${pkgname} with Java $(java -version 2>&1 | head -n1)"

    echo "Creating jlink runtime image..."
    ./gradlew --no-daemon jlink

    echo "Creating jpackage application image..."
    ./gradlew --no-daemon jpackageImage copyMimeInfo
}

check() {
    _set_jdk

    cd "$srcdir/sparrow"

    echo "Testing ${pkgname} with Java $(java -version 2>&1 | head -n1)"

    ./gradlew --no-daemon check

    cd "$srcdir"

    echo "Verifying built binary against official release..."

    # Check if build was successful
    if [ ! -d "sparrow/build/jpackage/Sparrow" ]; then
        echo "ERROR: Built binary directory 'build/jpackage/Sparrow' not found!"
        return 1
    fi

    # Compare built binary with official release
    echo "Comparing binaries..."
    if diff -r "sparrow/build/jpackage/Sparrow" "Sparrow" > /dev/null 2>&1; then
        echo "✓ SUCCESS: Built binary is identical to official release!"
    else
        echo "✗ ERROR: Built binary differs from official release!"
        echo "This indicates the build is not reproducible."
        echo "First few differences:"
        diff -r "sparrow/build/jpackage/Sparrow" "Sparrow" 2>/dev/null | head -10
        return 1
    fi

    return 0
}

package() {
    cd "$srcdir/sparrow"

    install -dm755 "${pkgdir}/opt/${_pkgname}"

    cp -a "build/jpackage/Sparrow"/* "${pkgdir}/opt/${_pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/sparrow" << EOF
#!/bin/bash
exec /opt/${_pkgname}/bin/Sparrow "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/sparrow"

    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|/opt/sparrowwallet|/opt/${_pkgname}|g" \
        "src/main/deploy/package/linux/Sparrow.desktop" > \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "src/main/deploy/package/linux/sparrowwallet-Sparrow-MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
}
