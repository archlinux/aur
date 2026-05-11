# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-git
pkgver=2.4.2.r18.g110f887
pkgrel=1
pkgdesc="Desktop Bitcoin Wallet focused on security and privacy (git version)"
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
makedepends=(
    'git'
    'jdk25-temurin'
)
optdepends=(
    'bitbox-udev: udev rules for BitBox hardware wallets'
    'bitcoin-daemon: connect to a local Bitcoin Core node'
    'keepkey-udev: udev rules for KeepKey hardware wallets'
    'ledger-udev: udev rules for Ledger hardware wallets'
    'python-ckcc-protocol: Python CLI and udev rules for Coldcard hardware wallets'
    'trezor-udev: udev rules for Trezor hardware wallets'
)
provides=('sparrow-wallet')
conflicts=('sparrow-wallet' 'sparrow-wallet-reproducible')
options=(!debug !strip)
source=(
    "sparrow::git+https://github.com/sparrowwallet/sparrow.git#branch=master"
    "drongo::git+https://github.com/sparrowwallet/drongo.git"
    "lark::git+https://github.com/sparrowwallet/lark.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
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
    local _temurin_home

    _temurin_home="$(find /usr/lib/jvm -maxdepth 1 -type d -name 'java-*-temurin' | sort -V | tail -n1)"
    if [[ -z "${_temurin_home}" || ! -x "${_temurin_home}/bin/jpackage" ]]; then
        echo "ERROR: jdk-temurin with jpackage was not found under /usr/lib/jvm" >&2
        return 1
    fi

    export JAVA_HOME="${_temurin_home}"
    export PATH="${JAVA_HOME}/bin:${PATH}"

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

    install -Dm644 "src/main/deploy/package/linux/sparrowwallet-Sparrow-MimeInfo.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-git}.xml"
}
