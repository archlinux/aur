# Maintainer: Julian Raufelder <arch@raufelder.com>

pkgname=cryptomator-cli
pkgver=0.6.1
pkgrel=1
pkgdesc="CLI Multiplatform transparent client-side encryption of your files in the cloud."
arch=('any')
url="https://cryptomator.org/"
license=('GPL3')
depends=('fuse3')
makedepends=('maven' 'unzip')
_jdkver=23.0.1+11
source=("cryptomator-cli-${pkgver//_/-}.tar.gz::https://github.com/cryptomator/cli/archive/refs/tags/${pkgver//_/-}.tar.gz"
        "cryptomator-cli-${pkgver//_/-}.tar.gz.asc::https://github.com/cryptomator/cli/releases/download/${pkgver//_/-}/cryptomator-cli-${pkgver//_/-}.tar.gz.asc")
source_x86_64=("jdk.tar.gz::https://github.com/adoptium/temurin23-binaries/releases/download/jdk-${_jdkver//\+/%2B}/OpenJDK23U-jdk_x64_linux_hotspot_${_jdkver//\+/_}.tar.gz")
source_aarch64=("jdk.tar.gz::https://github.com/adoptium/temurin23-binaries/releases/download/jdk-${_jdkver//\+/%2B}/OpenJDK23U-jdk_aarch64_linux_hotspot_${_jdkver//\+/_}.tar.gz")
noextract=('jdk.tar.gz')
sha256sums=('0b0f09bbf6e597b481f45be18f5b7b23eaa46061b9f8a1e4ad1ef8eb79293139'
            'SKIP')
sha256sums_x86_64=('2400267e4e9c0f6ae880a4d763af6caf18c673714bdee5debf8388b0b5d52886')
sha256sums_aarch64=('808e3843293e50515bf02ad2f956e543da65e32dac82ae7a266a147b3485c61a')
options=('!strip')

validpgpkeys=('58117AFA1F85B3EEC154677D615D449FE6E6A235')

build() {
  export JAVA_HOME="${srcdir}/jdk"
  export JMODS_PATH="${srcdir}/jmods:${JAVA_HOME}/jmods"

  tar xvfz jdk.tar.gz --transform 's!^[^/]*!jdk!'

  mkdir jmods

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
    --java-options "--enable-native-access=${NATIVE_ACCESS_PACKAGE}" \
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
