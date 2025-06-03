# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-reproducible
pkgver=2.2.2
_jdkver=22.0.2_9
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy (reproducible build)"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'freetype2' 'libxcrypt-compat')
makedepends=('git')
provides=('sparrow-wallet')
conflicts=('sparrow-wallet' 'sparrow-wallet-git')
source=(
    "sparrow::git+https://github.com/sparrowwallet/sparrow.git#tag=${pkgver}"
    "sparrow-bin.tar.gz::https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrowwallet-${pkgver}-x86_64.tar.gz"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
    "https://github.com/adoptium/temurin22-binaries/releases/download/jdk-${_jdkver/_/%2B}/OpenJDK22U-jdk_x64_linux_hotspot_${_jdkver}.tar.gz"
)
sha256sums=('43706075c1dd44e01fc55a6d408e50723137f1e1a14d1726a520d9fb053b57e1'
            'a5a9be550ddbc32287d00822c809021135f936801f95c4fae1c481fea16ee51b'
            'SKIP'
            'SKIP'
            '05cd9359dacb1a1730f7c54f57e0fed47942a5292eb56a3a0ee6b13b87457a43')

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
}
