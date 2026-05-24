# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=sparrow-wallet-git
_pkgname=sparrow-wallet
pkgver=2.5.1.r3.g287c943
pkgrel=1
_jdkver=25
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
    'gradle'
    "java-environment=${_jdkver}"
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

_set_jdk() {
    local _jdk_home

    for _jdk_home in "/usr/lib/jvm/java-${_jdkver}-temurin" /usr/lib/jvm/java-"${_jdkver}"-*; do
        [[ -x "${_jdk_home}/bin/jpackage" ]] && break
    done
    if [[ ! -x "${_jdk_home}/bin/jpackage" ]]; then
        echo "ERROR: JDK ${_jdkver} with jpackage was not found under /usr/lib/jvm" >&2
        return 1
    fi

    export JAVA_HOME="${_jdk_home}"
    export PATH="${JAVA_HOME}/bin:${PATH}"
}

build() {
    _set_jdk
    cd "$srcdir/sparrow"

    echo "Building ${pkgname} with Java $(java -version 2>&1 | head -n1)"

    echo "Creating jlink runtime image..."
    gradle --no-daemon jlink

    echo "Creating jpackage application image..."
    gradle --no-daemon jpackageImage
}

check() {
    _set_jdk
    cd "$srcdir/sparrow"

    echo "Testing ${pkgname} with Java $(java -version 2>&1 | head -n1)"

    gradle --no-daemon check
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
