# Maintainer: 
pkgname=eprosima-micro-xrce-dds-gen
pkgver=1.1.0
pkgrel=0
pkgdesc="DDS-XRCE IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Micro-XRCE-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk8-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=9e36ac4b18c8083ac7106761a8a6e908e04ae458

source=(
    "https://github.com/eProsima/Micro-XRCE-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha512sums=(
    '4ca2299c27d592798b5a904b4255537664160fb9759d5184fbc1cc1210b17ca2ce295d4ce04c41b32fb9937a3dd362a3960c36c9fc814a4d75b3c4a2345bb9e0'
    '482a4c39baaafa9fd5a751b955e1a2b97bf7b762e86850965518c371f48fd6d931cc0d1c3ed00f138500def23c359b08bf7e6f64743f191b882d4a88e9269064'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rm -r -f "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser

    cd "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"
    "${srcdir}"/Micro-XRCE-DDS-Gen-1.1.0/thirdparty/IDL-Parser/gradlew --no-daemon assemble
}

package() {
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/microxrcedds/
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-1.1.0/scripts/microxrceddsgen "${pkgdir}"/usr/bin
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-1.1.0/share/microxrcedds/microxrceddsgen.jar "${pkgdir}"/usr/share/microxrcedds/microxrceddsgen.jar
}
