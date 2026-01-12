# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="17.0.17"
_buildver="17.62.17"

# Basic package settings
pkgname="zulu-jre17-fx"
pkgver="$_jrever+$_buildver"
pkgrel=3
pkgdesc="An open source, TCK-tested and certified build of OpenJDK (full-runtime environment with OpenJFX included)."
arch=("x86_64" "aarch64")
license=("GPL-2.0-with-classpath-exception" "GPL-2.0-or-later")
depends=(
    "java-runtime-common>=3"
    "ca-certificates-utils"
)
provides=(
    "java-runtime=17"
    "java-runtime-openjdk=17"
    "java-runtime-headless=17"
    "java-runtime-headless-openjdk=17"
    "java-openjfx=17"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_x64.tar.gz")
sha256sums_x86_64=("5a719aaf3d65e8a76af3740d7a919c6d1bccb208672430b543a358b311d1cece")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_aarch64.tar.gz")
sha256sums_aarch64=("ec96b82ac3e789153aee7ce5e8f545f0e2efc39e15ed72889d4ae879056d5a56")

# Directory variables
_jvmdir="usr/lib/jvm/$pkgname"
_confdir="etc/$pkgname"
_legaldir="usr/share/licenses/$pkgname"

# Backup config files
backup=(
    "$_confdir/security/policy/README.txt"
    "$_confdir/security/policy/unlimited/default_local.policy"
    "$_confdir/security/policy/unlimited/default_US_export.policy"
    "$_confdir/security/policy/limited/default_local.policy"
    "$_confdir/security/policy/limited/exempt_local.policy"
    "$_confdir/security/policy/limited/default_US_export.policy"
    "$_confdir/security/java.policy"
    "$_confdir/security/java.security"
    "$_confdir/sound.properties"
    "$_confdir/management/management.properties"
    "$_confdir/management/jmxremote.access"
    "$_confdir/management/jmxremote.password.template"
    "$_confdir/net.properties"
    "$_confdir/sdp/sdp.conf.template"
    "$_confdir/logging.properties"
)

package() {
    # Install main files
    install -d "$pkgdir/$_jvmdir"
    cp -rT "$srcdir"/zulu*-linux_*/ "$pkgdir/$_jvmdir"

    # Move configuration files
    install -d "$pkgdir/$_confdir"
    mv -T "$pkgdir/$_jvmdir/conf" "$pkgdir/$_confdir"
    ln -s "/$_confdir" "$pkgdir/$_jvmdir/conf"

    # Move legal files
    install -d "$pkgdir/$_legaldir"
    mv -T "$pkgdir/$_jvmdir/legal" "$pkgdir/$_legaldir"
    ln -s "/$_legaldir" "$pkgdir/$_jvmdir/legal"

    # Move OpenJFX license
    mv "$pkgdir/$_jvmdir/OPENJFX_LICENSE" "$pkgdir/$_legaldir"
    ln -s "/$_legaldir/OPENJFX_LICENSE" "$pkgdir/$_jvmdir/OPENJFX_LICENSE"

    # Link JKS keystore from ca-certificates-utils
    rm "$pkgdir/$_jvmdir/lib/security/cacerts"
    ln -s "/etc/ssl/certs/java/cacerts" "$pkgdir/$_jvmdir/lib/security/cacerts"
}
