# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="21.0.9+10"

# Basic package settings
pkgname="jre21-temurin"
pkgver="${_jrever/+/.u}"
pkgrel=1
pkgdesc="Temurin (OpenJDK 21 JRE binaries by Adoptium, formerly AdoptOpenJDK)"
arch=("x86_64" "aarch64")
license=("GPL-2.0-with-classpath-exception")
depends=(
    "java-runtime-common>=3"
    "ca-certificates-utils"
)
provides=(
    "java-runtime=21"
    "java-runtime-openjdk=21"
    "java-runtime-headless=21"
    "java-runtime-headless-openjdk=21"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${_jrever/+/%2B}/OpenJDK21U-jre_x64_linux_hotspot_${_jrever/+/_}.tar.gz")
sha256sums_x86_64=("aeab55d064a1a27a3744b0880b9b414077b4ed2b1790817eea3df60aec946431")
source_aarch64=("https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${_jrever/+/%2B}/OpenJDK21U-jre_aarch64_linux_hotspot_${_jrever/+/_}.tar.gz")
sha256sums_aarch64=("1d041073c65e834bdb4da732485a54ff829859dcd1549e7992f15bd73341be29")

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
    "$_confdir/jaxp.properties"
    "$_confdir/sdp/sdp.conf.template"
    "$_confdir/logging.properties"
)

package() {
    # Install main files
    install -d "$pkgdir/$_jvmdir"
    cp -rT "$srcdir/jdk-${_jrever}-jre" "$pkgdir/$_jvmdir"

    # Move configuration files
    install -d "$pkgdir/$_confdir"
    mv -T "$pkgdir/$_jvmdir/conf" "$pkgdir/$_confdir"
    ln -s "/$_confdir" "$pkgdir/$_jvmdir/conf"

    # Move legal files
    install -d "$pkgdir/$_legaldir"
    mv -T "$pkgdir/$_jvmdir/legal" "$pkgdir/$_legaldir"
    ln -s "/$_legaldir" "$pkgdir/$_jvmdir/legal"

    # Link JKS keystore from ca-certificates-utils
    rm "$pkgdir/$_jvmdir/lib/security/cacerts"
    ln -s "/etc/ssl/certs/java/cacerts" "$pkgdir/$_jvmdir/lib/security/cacerts"
}
