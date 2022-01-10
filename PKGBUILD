# Maintainer: Aaron Graves <linux@ajgraves.com>
# Contributor: Julian Raufelder <arch@raufelder.com>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Sebastian Stenzel <sebastian.stenzel@gmail.com>

pkgname=cryptomator
pkgver=1.6.5
pkgrel=1
pkgdesc="Multiplatform transparent client-side encryption of your files in the cloud."
arch=('any')
url="https://cryptomator.org/"
license=('GPL3')
depends=('fuse2' 'libjffi' 'alsa-lib' 'hicolor-icon-theme' 'libxtst' 'libnet' 'libxrender')
makedepends=('java-environment=17' 'maven')
optdepends=('keepassxc-cryptomator: Use KeePassXC to store vault passwords')
source=("cryptomator-${pkgver}.tar.gz::https://github.com/cryptomator/cryptomator/archive/refs/tags/${pkgver}.tar.gz"
        "cryptomator-${pkgver}.tar.gz.asc::https://github.com/cryptomator/cryptomator/releases/download/${pkgver}/cryptomator-${pkgver}.tar.gz.asc"
        'org.cryptomator.Cryptomator.desktop'
        'org.cryptomator.Cryptomator.png'
        'org.cryptomator.Cryptomator.svg'
        'cryptomator-vault.xml')
sha256sums=('SKIP'
            'SKIP'
            '53c509fe54ef1c5c28b469d86291536649367fb2030b2c0fb3101da2031f8e6e'
            'd299636d78d093117fa7a26563f22e01cdb75b1fcc6cc279bc88627574c968bd'
            '0989ecc24ecd672c5c525ab6f1f0fb18a9eeca86ebec19738f512801c152f756'
            '78537ead26dcc1488d7fff02f47fce559f70f9bb2d7fa7fa1741ad3cd151bfad')
options=('!strip')

validpgpkeys=('58117AFA1F85B3EEC154677D615D449FE6E6A235')

prepare() {
  if ! archlinux-java status | grep default | grep 17 ; then 
      echo "You don't have a Java 17 JDK selected but the following installed on your system:"
      echo "`archlinux-java status | grep 17`"
      echo "Select a Java 17 JDK using \"sudo archlinux-java set [name from the list above]\""
      echo "If you switched to a JDK 17, please re-run the installation."
      return 1
  fi
}

build() {
  cd "${srcdir}/cryptomator-${pkgver}"
  mvn versions:set -DnewVersion="${pkgver}"
  mvn -B clean package -DskipTests -Plinux

  cp LICENSE.txt target
  cp dist/linux/launcher* target
  cp target/cryptomator-*.jar target/mods

  cd target

  jlink \
    --output runtime \
    --module-path jmod \
    --add-modules java.base,java.desktop,java.logging,java.naming,java.net.http,java.scripting,java.sql,java.xml,jdk.unsupported,jdk.crypto.ec,jdk.accessibility \
    --no-header-files \
    --no-man-pages \
    --strip-debug \
    --compress=1

  jpackage \
    --type app-image \
    --runtime-image runtime \
    --input libs \
    --module-path mods \
    --module org.cryptomator.desktop/org.cryptomator.launcher.Cryptomator \
    --dest . \
    --name cryptomator \
    --vendor "Skymatic GmbH" \
    --copyright "(C) 2016 - 2022 Skymatic GmbH" \
    --java-options "-Xss5m" \
    --java-options "-Xmx256m" \
    --java-options "-Dfile.encoding=\"utf-8\"" \
    --java-options "-Dcryptomator.logDir=\"~/.local/share/Cryptomator/logs\"" \
    --java-options "-Dcryptomator.pluginDir=\"~/.local/share/Cryptomator/plugins\"" \
    --java-options "-Dcryptomator.settingsPath=\"~/.config/Cryptomator/settings.json:~/.Cryptomator/settings.json\"" \
    --java-options "-Dcryptomator.ipcSocketPath=\"~/.config/Cryptomator/ipc.socket\"" \
    --java-options "-Dcryptomator.mountPointsDir=\"~/.local/share/Cryptomator/mnt\"" \
    --java-options "-Dcryptomator.showTrayIcon=false" \
    --java-options "-Dcryptomator.buildNumber=\"aur-${pkgrel}\"" \
    --java-options "-Dcryptomator.appVersion=\"${pkgver}\"" \
    --app-version "${pkgver}" \
    --verbose
}

package() {
  install -Dm644 "${srcdir}/cryptomator-vault.xml" "${pkgdir}/usr/share/mime/packages/cryptomator-vault.xml"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.desktop" "${pkgdir}/usr/share/applications/org.cryptomator.Cryptomator.desktop"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.cryptomator.Cryptomator.png"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.svg" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.svg"
  install -Dm644 "${srcdir}/org.cryptomator.Cryptomator.svg" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.DirIcon"

  mkdir -p "${pkgdir}/opt/cryptomator/"
  cp -R "${srcdir}/cryptomator-${pkgver}/target/cryptomator" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/cryptomator-${pkgver}/target/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/cryptomator/bin/cryptomator" "${pkgdir}/usr/bin/cryptomator"
}
