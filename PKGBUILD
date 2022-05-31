pkgname=jdk11-j9-bin
pkgver=11.0.15.0
_majver=$(sed 's/\.[^.]*$//' <<<${pkgver})
_minver=10
_openj9ver=0.32.0
pkgrel=1
pkgdesc="IBM® Semeru Runtime Certified Edition, Version 11"
arch=('x86_64')
url="https://developer.ibm.com/languages/java/semeru-runtimes/downloads/?license=IBM&version=11"
license=('custom')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
'java-environment=11'
'java-runtime=11'
'java-runtime-headless=11'
)
makedepends=('coreutils' 'bash')
source=("install_${pkgver}.bin::https://github.com/ibmruntimes/semeru11-certified-binaries/releases/download/jdk-${_majver}+${_minver}_openj9-${_openj9ver}/ibm-semeru-certified-jdk_x64_linux_${pkgver}-archive.bin")
sha256sums=('b70d8a8f4975a04015038cc0507cfb44e6a73ab81c3d07bd8642f644fbc155b1')

build() {
    chmod +x install_${pkgver}.bin
    ./install_${pkgver}.bin -i silent -DLICENSE_ACCEPTED=TRUE -DUSER_INSTALL_DIR="${srcdir}/temp_install"
}

package() {
    mkdir -p "${pkgdir}/usr/lib/jvm"
    mv "${srcdir}/temp_install/jdk-${_majver}+${_minver}" "${pkgdir}/usr/lib/jvm/java-11-ibm"
    mkdir -p "${pkgdir}/usr/share/licenses"
    ln -s ../../lib/jvm/java-11-ibm/legal/openj9.jvm/license/license_en.txt "${pkgdir}/usr/share/licenses/jdk11-ibm"
}

