# Maintainer: Faaris Ansari <faaris.ansari@pm.me>

pkgname=jdk8-temurin
_jdkver=8u372-b07
_majorver=8
_jvmdir=/usr/lib/jvm/java-${_majorver}-temurin
pkgver=${_jdkver//-}
pkgrel=2
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

  # Create the directories you want to keep
  install -dm 755 "${pkgdir}${_jvmdir}/bin"
  install -dm 755 "${pkgdir}${_jvmdir}/include"
  install -dm 755 "${pkgdir}${_jvmdir}/jre"
  install -dm 755 "${pkgdir}${_jvmdir}/lib"
  install -dm 755 "${pkgdir}${_jvmdir}/man"

  # Copy the directories you want to keep
  cp -a "${srcdir}/jdk${_jdkver}/bin" "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/jdk${_jdkver}/include" "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/jdk${_jdkver}/jre" "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/jdk${_jdkver}/lib" "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/jdk${_jdkver}/man" "${pkgdir}${_jvmdir}"

  cd "${pkgdir}${_jvmdir}"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"

  # Man pages
  for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-temurin${_majorver}.1}"
  done
  rm -rf man
  ln -sf /usr/share/man man
}
