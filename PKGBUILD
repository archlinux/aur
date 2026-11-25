# Maintainer: tuxxx <tuxxx@tuta.io>

pkgname=sparrow-wallet-reproducible
_pkgname=sparrow-wallet
pkgver=2.5.7
_jdkver=25.0.5.1_2
_jdkmajor="${_jdkver%%[^0-9]*}"
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy (reproducible build)"
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache-2.0')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'freetype2'
    'fontconfig'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libgcc'
    'libglvnd'
    'libstdc++'
    'libusb'
    'libx11'
    'libxcrypt-compat'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'libxxf86vm'
    'pango'
    'systemd-libs'
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
    "https://github.com/sparrowwallet/sparrow/releases/download/${pkgver}/sparrowwallet-${pkgver}-x86_64.tar.gz"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
    "https://github.com/adoptium/temurin${_jdkmajor}-binaries/releases/download/jdk-${_jdkver/_/%2B}/OpenJDK${_jdkmajor}U-jdk_x64_linux_hotspot_${_jdkver}.tar.gz"
)
sha256sums=('83775e7619c882708bf72a2617f223c45d5b47013d285fd481cb01658034a619'
            '8a2a4820100e1553f6d1df45dac1a3b7ff353903918057d0796374efa621738b'
            'SKIP'
            'SKIP'
            '760f91b22c3efc9bd1b64ff950598231be82928cc807e30691a0e7a2995a62c0')

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

    echo "Creating jpackage application image without installer..."
    ./gradlew --no-daemon jpackage -PskipInstallers=true
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
