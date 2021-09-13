# Maintainer: Aaron Graves <linux@ajgraves.com>
# Contributor: Julian Raufelder <arch@raufelder.com>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.5.17
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=('x86_64')
url="https://cryptomator.org/"
license=('GPL3')
depends=('fuse2' 'java-environment=16' 'alsa-lib' 'hicolor-icon-theme' 'libxtst' 'libnet' 'libxrender')
makedepends=('maven')
source=("cryptomator-${pkgver}::https://github.com/cryptomator/cryptomator/archive/refs/tags/${pkgver}.tar.gz"
        'org.cryptomator.Cryptomator.desktop'
        'org.cryptomator.Cryptomator.png'
        'org.cryptomator.Cryptomator.svg'
        'cryptomator-vault.xml')
sha256sums=('222192184442d8f0d44bd277ea519111a78fbf61ea8baf8ded77ef65dee493aa'
            '53c509fe54ef1c5c28b469d86291536649367fb2030b2c0fb3101da2031f8e6e'
            'd299636d78d093117fa7a26563f22e01cdb75b1fcc6cc279bc88627574c968bd'
            '0989ecc24ecd672c5c525ab6f1f0fb18a9eeca86ebec19738f512801c152f756'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad')
options=('!strip')

build() {
  cd "${srcdir}/cryptomator-${pkgver}"
  mvn -B clean package -DskipTests --file main/pom.xml -Prelease,linux

  cd "main/buildkit/target/"

  jlink \
    --output runtimeImage \
    --no-header-files \
    --no-man-pages \
    --strip-debug \
    --compress=2 \
    --verbose \
    --add-modules java.base,java.logging,java.xml,java.sql,java.management,java.security.sasl,java.naming,java.datatransfer,java.security.jgss,java.rmi,java.scripting,java.prefs,java.desktop,jdk.security.auth,jdk.unsupported,java.net.http,jdk.crypto.ec

  jpackage \
    --type app-image \
    --input libs \
    --main-jar "launcher-${pkgver}.jar" \
    --main-class org.cryptomator.launcher.Cryptomator \
    --runtime-image runtimeImage \
    --app-version "${pkgver}" \
    --java-options "-Dcryptomator.logDir=\"~/.local/share/Cryptomator/logs\"" \
    --java-options "-Dcryptomator.settingsPath=\"~/.config/Cryptomator/settings.json:~/.Cryptomator/settings.json\"" \
    --java-options "-Dcryptomator.ipcPortPath=\"~/.config/Cryptomator/ipcPort.bin:~/.Cryptomator/ipcPort.bin\"" \
    --java-options "-Dcryptomator.mountPointsDir=\"~/.local/share/Cryptomator/mnt\"" \
    --java-options "-Dcryptomator.buildNumber=\"ppa\"" \
    --java-options "-Xss2m" \
    --java-options "-Xmx512m" \
    --name cryptomator \
    --dest "${srcdir}/cryptomator-${pkgver}" \
    --verbose
}

package() {
  install -Dm644 "${srcdir}/cryptomator-vault.xml" "${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.desktop" "${pkgdir}/usr/share/applications/org.cryptomator.Cryptomator.desktop"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.cryptomator.Cryptomator.png"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.svg" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.svg"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.svg" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.DirIcon"

  mkdir -p "${pkgdir}/opt/cryptomator/"
  cp -R "${srcdir}/cryptomator-${pkgver}/cryptomator" ${pkgdir}/opt/

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/cryptomator/bin/cryptomator" "${pkgdir}/usr/bin/cryptomator"
}
