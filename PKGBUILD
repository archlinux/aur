# Maintainer: Spoorloos <mick.negenman@icloud.com>

_jrever="11.0.29+7"

# Basic package settings
pkgname="jre11-temurin"
pkgver="${_jrever/+/.u}"
pkgrel=2
pkgdesc="Temurin (OpenJDK 11 JRE binaries by Adoptium, formerly AdoptOpenJDK)"
arch=("x86_64" "aarch64")
license=("GPL-2.0-with-classpath-exception")
depends=(
    "java-runtime-common>=3"
    "ca-certificates-utils"
)
provides=(
    "java-runtime=17"
    "java-runtime-openjdk=17"
    "java-runtime-headless=17"
    "java-runtime-headless-openjdk=17"
)
options=("!strip")
install="$pkgname.install"

# Source URLs
source_x86_64=("https://github.com/adoptium/temurin11-binaries/releases/download/jdk-${_jrever/+/%2B}/OpenJDK11U-jre_x64_linux_hotspot_${_jrever/+/_}.tar.gz")
sha256sums_x86_64=("97a4c089411868e24bf74a9789a819ae4164818316f8a3146460a102e8db6149")
source_aarch64=("https://github.com/adoptium/temurin11-binaries/releases/download/jdk-${_jrever/+/%2B}/OpenJDK11U-jre_aarch64_linux_hotspot_${_jrever/+/_}.tar.gz")
sha256sums_aarch64=("8e4c0bb2488f8abd0379b660963ed981b1e136b975f3faf562e07cce81977700")

# Directory variables
_jvmdir="usr/lib/jvm/$pkgname"
_confdir="etc/$pkgname"
_legaldir="usr/share/licenses/$pkgname"
_mandir="usr/share/man"

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

    # Install man pages
    cd "$pkgdir/$_jvmdir/man"
    find "." -type f -exec install -Dm644 "{}" "$pkgdir/$_mandir/{}" \;
}
