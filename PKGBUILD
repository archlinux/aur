# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="25.0.1"
_buildver="25.30.17"

# Basic package settings
pkgname="zulu-jre25-fx"
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
    "java-runtime=25"
    "java-runtime-openjdk=25"
    "java-runtime-headless=25"
    "java-runtime-headless-openjdk=25"
    "java-openjfx=25"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_x64.tar.gz")
sha256sums_x86_64=("cdfd97d1db106d787eaf02b30f5da26ae4b30e26856f4be1eefce3b1a786c3d8")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_aarch64.tar.gz")
sha256sums_aarch64=("ab63d1f912cf24f8dbde24a1dfab43a0f9810aa5b256acf34e68844e71aaa313")

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
    "$_confdir/security/java.security"
    "$_confdir/sound.properties"
    "$_confdir/management/management.properties"
    "$_confdir/management/jmxremote.access"
    "$_confdir/management/jmxremote.password.template"
    "$_confdir/net.properties"
    "$_confdir/jaxp.properties"
    "$_confdir/sdp/sdp.conf.template"
    "$_confdir/logging.properties"
    "$_confdir/jaxp-strict.properties.template"
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
