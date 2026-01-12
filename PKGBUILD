# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="8.0.472+8"
_gitver="8u472-b08"

# Basic package settings
pkgname="jre8-temurin"
pkgver="${_jrever/+/.u}"
pkgrel=3
pkgdesc="Temurin (OpenJDK 8 JRE binaries by Adoptium, formerly AdoptOpenJDK)"
arch=("x86_64" "aarch64")
license=("GPL-2.0-with-classpath-exception")
depends=(
    "java-runtime-common>=3"
    "ca-certificates-utils"
)
provides=(
    "java-runtime=8"
    "java-runtime-openjdk=8"
    "java-runtime-headless=8"
    "java-runtime-headless-openjdk=8"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://github.com/adoptium/temurin8-binaries/releases/download/jdk$_gitver/OpenJDK8U-jre_x64_linux_hotspot_${_gitver/-/}.tar.gz")
sha256sums_x86_64=("6f7fb5fd640a0fd00837344b0920cbc4b9b9284b50e66f33789e3b250446a16e")
source_aarch64=("https://github.com/adoptium/temurin8-binaries/releases/download/jdk$_gitver/OpenJDK8U-jre_aarch64_linux_hotspot_${_gitver/-/}.tar.gz")
sha256sums_aarch64=("c043807ad995fb3987bc1c42b16ebf0f1b5010868c3e9d20a941236d5bbb22b7")

# Directory variables
_jvmdir="usr/lib/jvm/$pkgname"
_legaldir="usr/share/licenses/$pkgname"

package() {
    # Install main files
    install -d "$pkgdir/$_jvmdir"
    cp -rT "$srcdir/jdk${_gitver}-jre" "$pkgdir/$_jvmdir"

    # Install license
    install -d "$pkgdir/$_legaldir"
    mv "$pkgdir/$_jvmdir/LICENSE" "$pkgdir/$_legaldir/LICENSE"
    ln -s "/$_legaldir/LICENSE" "$pkgdir/$_jvmdir/LICENSE"

    # Link JKS keystore from ca-certificates-utils
    rm "$pkgdir/$_jvmdir/lib/security/cacerts"
    ln -s "/etc/ssl/certs/java/cacerts" "$pkgdir/$_jvmdir/lib/security/cacerts"
}
