# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-reproducible
pkgver=2.3.0
_jdkver=22.0.2_9
_jdkmajor="${_jdkver%%[^0-9]*}"
pkgrel=1
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
    'keepkey-udev: udev rules for KeepKey hardware wallets'
    'ledger-udev: udev rules for Ledger hardware wallets'
    'python-ckcc-protocol: Python CLI and udev rules for Coldcard hardware wallets'
    'trezor-udev: udev rules for Trezor hardware wallets'
)
provides=('sparrow-wallet')
conflicts=('sparrow-wallet' 'sparrow-wallet-git')
source=(
    "sparrow::git+https://github.com/sparrowwallet/sparrow.git#tag=${pkgver}"
    "sparrow-bin.tar.gz::https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrowwallet-${pkgver}-x86_64.tar.gz"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
    "https://github.com/adoptium/temurin${_jdkmajor}-binaries/releases/download/jdk-${_jdkver/_/%2B}/OpenJDK${_jdkmajor}U-jdk_x64_linux_hotspot_${_jdkver}.tar.gz"
    "MimeInfo.xml"
)
sha256sums=('aeca6fd47286283f012bd1bb040650552dc064e351c6df83ee897443e2564770'
            '3e6669c724d7cd03080061f479dc441c2c336fe93c1c12585e77f2664a429e83'
            'SKIP'
            'SKIP'
            '05cd9359dacb1a1730f7c54f57e0fed47942a5292eb56a3a0ee6b13b87457a43'
            'd0ad5f5457005776fb5021752f9468a55f3a01f498a7984fc97ef652b44460c1')

prepare() {
    cd "$srcdir/sparrow"
    git submodule init
    git config submodule.drongo.url "$srcdir/drongo"
    git config submodule.lark.url "$srcdir/lark"
    git -c protocol.file.allow=always submodule update
}

build() {
    # Setup Java build environment - only for build, not for runtime
    export JAVA_HOME="$srcdir/jdk-${_jdkver/_/+}"
    export PATH="$JAVA_HOME/bin:$PATH"
    
    cd "$srcdir/sparrow"
    
    echo "Building ${pkgname} with Java $(java -version 2>&1 | head -n1)"
    
    echo "Creating jlink runtime image..."
    ./gradlew jlink
    
    echo "Creating jpackage application image..."
    ./gradlew jpackageImage
}

check() {
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

    install -dm755 "${pkgdir}/opt/${pkgname%-reproducible}"

    cp -a "build/jpackage/Sparrow"/* "${pkgdir}/opt/${pkgname%-reproducible}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/sparrow" << EOF
#!/bin/bash
exec /opt/${pkgname%-reproducible}/bin/Sparrow "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/sparrow"

    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|/opt/sparrowwallet|/opt/${pkgname%-reproducible}|g" \
        "src/main/deploy/package/linux/Sparrow.desktop" > \
        "${pkgdir}/usr/share/applications/${pkgname%-reproducible}.desktop"

    install -Dm644 "${srcdir}/MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-reproducible}.xml"
}
