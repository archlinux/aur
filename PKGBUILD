# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="8.0.472"
_buildver="8.90.0.19"

# Basic package settings
pkgname="zulu-jre8-fx"
pkgver="$_jrever+$_buildver"
pkgrel=1
pkgdesc="An open source, TCK-tested and certified build of OpenJDK (full-runtime environment with OpenJFX included)."
arch=("x86_64" "aarch64")
license=("GPL-2.0-with-classpath-exception" "GPL-2.0-or-later")
depends=(
    "java-runtime-common>=3"
    "ca-certificates-utils"
)
provides=(
    "java-runtime=8"
    "java-runtime-openjdk=8"
    "java-runtime-headless=8"
    "java-runtime-headless-openjdk=8"
    "java-openjfx=8"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_x64.tar.gz")
sha256sums_x86_64=("46ec6cf04f3f884ee6ef6dbdeb0c58df2db58a02638c4e50af842d39c3d3fabc")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_aarch64.tar.gz")
sha256sums_aarch64=("95a8fa16a3037e5a1b8d7ddd2a72c385edf68638b65774f92af0a6c8ed16fd08")

# Directory variables
_jvmdir="usr/lib/jvm/$pkgname"
_legaldir="usr/share/licenses/$pkgname"
_mandir="usr/share/man"

package() {
    # Install main files
    install -d "$pkgdir/$_jvmdir"
    cp -rT "$srcdir"/zulu*-linux_*/ "$pkgdir/$_jvmdir"

    # Move license
    install -d "$pkgdir/$_legaldir"
    mv "$pkgdir/$_jvmdir/LICENSE" "$pkgdir/$_legaldir"
    ln -s "/$_legaldir/LICENSE" "$pkgdir/$_jvmdir/LICENSE"

    # Move OpenJFX license
    mv "$pkgdir/$_jvmdir/OPENJFX_LICENSE" "$pkgdir/$_legaldir"
    ln -s "/$_legaldir/OPENJFX_LICENSE" "$pkgdir/$_jvmdir/OPENJFX_LICENSE"

    # Link JKS keystore from ca-certificates-utils
    rm "$pkgdir/$_jvmdir/lib/security/cacerts"
    ln -s "/etc/ssl/certs/java/cacerts" "$pkgdir/$_jvmdir/lib/security/cacerts"

    # Install man pages
    cd "$pkgdir/$_jvmdir/man"
    find "." -type f -exec install -Dm644 "{}" "$pkgdir/$_mandir/{}" \;
}
