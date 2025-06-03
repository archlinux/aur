# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-git
pkgver=2.2.2.r7.g8885e48
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy (git version)"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'freetype2' 'libxcrypt-compat')
makedepends=('git')
provides=('sparrow-wallet')
conflicts=('sparrow-wallet')
source=(
    "sparrow::git+https://github.com/sparrowwallet/sparrow.git#branch=master"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
    "https://github.com/adoptium/temurin22-binaries/releases/download/jdk-22.0.2%2B9/OpenJDK22U-jdk_x64_linux_hotspot_22.0.2_9.tar.gz"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    '05cd9359dacb1a1730f7c54f57e0fed47942a5292eb56a3a0ee6b13b87457a43'
)

pkgver() {
  cd "$srcdir/sparrow"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/sparrow"
    git submodule init
    git config submodule.drongo.url "$srcdir/drongo"
    git config submodule.lark.url "$srcdir/lark"
    git -c protocol.file.allow=always submodule update
}

build() {
    # Setup Java build environment - only for build, not for runtime
    export JAVA_HOME="$srcdir/jdk-22.0.2+9"
    export PATH="$JAVA_HOME/bin:$PATH"
    
    cd "$srcdir/sparrow"
    
    echo "Building ${pkgname} with Java $(java -version 2>&1 | head -n1)"
    
    echo "Creating jlink runtime image..."
    ./gradlew jlink
    
    echo "Creating jpackage application image..."
    ./gradlew jpackageImage
}

package() {
    cd "$srcdir/sparrow"

    install -dm755 "${pkgdir}/opt/${pkgname%-git}"

    cp -a "build/jpackage/Sparrow"/* "${pkgdir}/opt/${pkgname%-git}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/sparrow" << EOF
#!/bin/bash
exec /opt/${pkgname%-git}/bin/Sparrow "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/sparrow"

    install -dm755 "${pkgdir}/usr/share/applications"
    sed "s|/opt/sparrowwallet|/opt/${pkgname%-git}|g" \
        "src/main/deploy/package/linux/Sparrow.desktop" > \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
