# Maintainer: Julian Raufelder <arch@raufelder.com>

pkgname=cryptomator-cli
pkgver=0.6.2
pkgrel=1
pkgdesc="CLI Multiplatform transparent client-side encryption of your files in the cloud."
arch=('any')
url="https://cryptomator.org/"
license=('GPL3')
depends=('fuse3')
makedepends=('maven' 'unzip')
_jdkver=24+36
source=("cryptomator-cli-${pkgver//_/-}.tar.gz::https://github.com/cryptomator/cli/archive/refs/tags/${pkgver//_/-}.tar.gz"
        "cryptomator-cli-${pkgver//_/-}.tar.gz.asc::https://github.com/cryptomator/cli/releases/download/${pkgver//_/-}/cryptomator-cli-${pkgver//_/-}.tar.gz.asc")
source_x86_64=("jdk-${_jdkver}.tar.gz::https://github.com/adoptium/temurin24-binaries/releases/download/jdk-${_jdkver//\+/%2B}/OpenJDK24U-jdk_x64_linux_hotspot_${_jdkver//\+/_}.tar.gz")
source_aarch64=("jdk-${_jdkver}.tar.gz::https://github.com/adoptium/temurin24-binaries/releases/download/jdk-${_jdkver//\+/%2B}/OpenJDK24U-jdk_aarch64_linux_hotspot_${_jdkver//\+/_}.tar.gz")
noextract=("jdk-${_jdkver}.tar.gz")
sha256sums=('d3402534ba460c09159e1fc0a9fc0ef7bc5a9f8c15452ff821757261bab4657a'
            'SKIP')
sha256sums_x86_64=('c340dee97b6aa215d248bc196dcac5b56e7be9b5c5d45e691344d40d5d0b171d')
sha256sums_aarch64=('18071047526ab4b53131f9bb323e8703485ae37fcb2f2c5ef0f1b7bab66d1b94')
options=('!strip')

validpgpkeys=('58117AFA1F85B3EEC154677D615D449FE6E6A235')

build() {
  export JAVA_HOME="${srcdir}/jdk-${_jdkver}"
  tar xfz "jdk-${_jdkver}.tar.gz"

  cd "${srcdir}/cli-${pkgver//_/-}"

  mvn -B clean package -Djavafx.platform=linux -DskipTests -Plinux

  cp LICENSE.txt target
  cp target/cryptomator-cli-*.jar target/mods

  cd target

  "$JAVA_HOME/bin/jlink" \
    --verbose \
    --output runtime \
    --module-path "${JAVA_HOME}" \
    --add-modules java.base,java.compiler,java.naming,java.xml \
    --strip-native-commands \
    --no-header-files \
    --no-man-pages \
    --strip-debug \
    --compress zip-0

  NATIVE_ACCESS_PACKAGE="no.native.access.available"
  _OS=$(uname -s)
  if (echo "$_OS" | grep -q "Linux.*") ; then
    _ARCH=$(uname -m)
    if [ "$_ARCH" = "x86_64" ]; then
      NATIVE_ACCESS_PACKAGE="org.cryptomator.jfuse.linux.amd64"
    elif [ "$_ARCH" = "aarch64"  ]; then
      NATIVE_ACCESS_PACKAGE="org.cryptomator.jfuse.linux.aarch64"
    fi
  fi

  echo "Creating app binary with jpackage..."
  "$JAVA_HOME/bin/jpackage" \
    --verbose \
    --type app-image \
    --runtime-image runtime \
    --input libs \
    --module-path mods \
    --module org.cryptomator.cli/org.cryptomator.cli.CryptomatorCli \
    --dest . \
    --name cryptomator-cli \
    --vendor "Skymatic GmbH" \
    --copyright "(C) 2016 - 2025 Skymatic GmbH" \
    --app-version "0.0.1.0" \
    --java-options "-Dorg.cryptomator.cli.version=${pkgver//_*/}-aur" \
    --java-options "--enable-preview" \
    --java-options "--enable-native-access=${NATIVE_ACCESS_PACKAGE},org.fusesource.jansi" \
    --java-options "-Xss5m" \
    --java-options "-Xmx256m" \
    --java-options "-Dfile.encoding=utf-8" \
    --app-version "${pkgver//_*/}"
}

package() {
  mkdir -p "${pkgdir}/opt/cryptomator-cli/"
  cp -R "${srcdir}/cli-${pkgver//_/-}/target/cryptomator-cli" "${pkgdir}/opt/"
  cp "${srcdir}/cli-${pkgver//_/-}/target/cryptomator-cli_completion.sh" "${pkgdir}/opt/cryptomator-cli/"
  install -Dm644 "${srcdir}/cli-${pkgver//_/-}/target/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/cryptomator-cli/bin/cryptomator-cli" "${pkgdir}/usr/bin/cryptomator-cli"

  echo "If you want to have shell completion, source the /opt/cryptomator-cli/cryptomator-cli_completion.sh file."
}
