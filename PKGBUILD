# Maintainer: matteodev <me@matteodev.xyz>
# shellcheck disable=all

pkgname=jdk8-temurin
_majorver=8
_jdkver=8u462-b08
_jvmdir=/usr/lib/jvm/java-${_majorver}-temurin
_majorver=8
pkgver=${_jdkver//-/}
pkgrel=1
pkgdesc="Temurin (OpenJDK ${_majorver} Java binaries by Adoptium, formerly AdoptOpenJDK)"
arch=('x86_64')
url="https://adoptium.net/"
license=('custom')
depends=('java-runtime-common>=3' 'java-environment-common' 'ca-certificates-utils' 'desktop-file-utils' 'libxrender' 'libxtst' 'alsa-lib')
options=('!strip') # Disable stripping of binaries
source=("https://github.com/adoptium/temurin8-binaries/releases/download/jdk${_jdkver}/OpenJDK${_majorver}U-jdk_x64_linux_hotspot_${pkgver}.tar.gz")
sha256sums=('5d64ae542b59a962b3caadadd346f4b1c3010879a28bb02d928326993de16e79')
replaces=("jdk${_majorver}-adoptopenjdk")                              # Replaces the old 'jdk8-adoptopenjdk' package
install=install_jdk${_majorver}-temurin.sh                             # Script to be executed after package installation
provides=("java-environment=${_majorver}" "java-runtime=${_majorver}") # Provides the 'java-environment=8' and 'java-runtime=8' virtual packages

package() {
  # Grab all contents of downloaded tar and extract to correct places
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -ar "${srcdir}/jdk${_jdkver}/." "${pkgdir}${_jvmdir}"

  # License
  install -Dm644 ${srcdir}/jdk${_jdkver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Man pages
  cd "${pkgdir}${_jvmdir}"
  for f in man/man1/* man/ja/man1/* man/ja_JP.UTF-8/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-temurin${_majorver}.1}"
  done
}
