# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="21.0.9"
_buildver="21.46.19"

# Basic package settings
pkgname="zulu-jre21-fx"
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
    "java-runtime=21"
    "java-runtime-openjdk=21"
    "java-runtime-headless=21"
    "java-runtime-headless-openjdk=21"
    "java-openjfx=21"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_x64.tar.gz")
sha256sums_x86_64=("f3acb0aea8ccd7a7293bbf580f09b9614b5c8fa7729ac1a0478f7da58cd246e5")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu$_buildver-ca-fx-jre$_jrever-linux_aarch64.tar.gz")
sha256sums_aarch64=("1c034dbdb0de3b0b96475095ca75fe676a577333f9f8cb7f849e9cde7e1bcd92")

# Directory variables
_jvmdir="usr/lib/jvm/$pkgname"
_confdir="etc/$pkgname"
_legaldir="usr/share/licenses/$pkgname"

# Backup config files
backup=(
    "$_confdir/management/jmxremote.access"
    "$_confdir/management/jmxremote.password.template"
    "$_confdir/management/management.properties"
    "$_confdir/sdp/sdp.conf.template"
    "$_confdir/security/policy/limited/default_local.policy"
    "$_confdir/security/policy/limited/default_US_export.policy"
    "$_confdir/security/policy/limited/exempt_local.policy"
    "$_confdir/security/policy/unlimited/default_local.policy"
    "$_confdir/security/policy/unlimited/default_US_export.policy"
    "$_confdir/security/policy/README.txt"
    "$_confdir/security/java.policy"
    "$_confdir/security/java.security"
    "$_confdir/jaxp.properties"
    "$_confdir/logging.properties"
    "$_confdir/net.properties"
    "$_confdir/sound.properties"
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
