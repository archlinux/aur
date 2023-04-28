# Maintainer: Faaris Ansari <faaris.ansari@pm.me>

pkgname=jdk8-temurin
_jdkver=8u372-b07
_jvmname=${pkgname/jdk/java-}
pkgver=${_jdkver//-}
pkgrel=1
pkgdesc="Temurin (OpenJDK 8 Java binaries by Adoptium, formerly AdoptOpenJDK)"
arch=('x86_64')
url="https://adoptium.net/"
license=('custom')
# 'java-runtime-common' provides common functionality for OpenJDK runtimes
# 'java-environment-common' provides common functionality for OpenJDK environments
# 'ca-certificates-utils' provides certificate authorities (CA) certificate bundle for TLS/SSL encryption
# 'desktop-file-utils' is needed to create and update desktop entries
# 'libxrender' and 'libxtst' are required for some AWT and Swing functionality
# 'alsa-lib' is required for sound support
depends=('java-runtime-common>=3' 'java-environment-common' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
options=('!strip') # Disable stripping of binaries
source=("https://github.com/adoptium/temurin8-binaries/releases/download/jdk${_jdkver}/OpenJDK8U-jdk_x64_linux_hotspot_${pkgver}.tar.gz")
sha256sums=('78a0b3547d6f3d46227f2ad8c774248425f20f1cd63f399b713f0cdde2cc376c')
replaces=("jdk8-adoptopenjdk") # Replaces the old 'jdk8-adoptopenjdk' package
install=install_jdk8-temurin.sh # Script to be executed after package installation
provides=('java-environment=8' 'java-runtime=8') # Provides the 'java-environment=8' and 'java-runtime=8' virtual packages

package() {
  cd "${srcdir}"
  # Install the license file
  install -Dm644 jdk${_jdkver}/LICENSE "${pkgdir}/usr/share/licenses/${_jvmname}/LICENSE"
  # Install the JDK files
  mkdir -p "${pkgdir}/usr/lib/jvm/${_jvmname}"
  tar xf "OpenJDK8U-jdk_x64_linux_hotspot_${pkgver}.tar.gz" \
      -C "${pkgdir}/usr/lib/jvm/${_jvmname}" \
      --strip-components=1
}
