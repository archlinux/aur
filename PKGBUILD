# Maintainer: 
pkgname=eprosima-micro-xrce-dds-gen
pkgver=2.0.0
pkgrel=0
pkgdesc="DDS-XRCE IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Micro-XRCE-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=ac27eade53dee8f7fd99461175c07d6971ed7d59

source=(
    "https://github.com/eProsima/Micro-XRCE-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha512sums=(
    '123be8ec5797a50b9db6260935231d92bf9060a1025fa9a3cec53892d300b4a7cbdf785bb6cbb4873e35127485e86b2d82975a9c6a098e82835c133393958040'
    '651c75c31230b073d18827998ed52f3f64d586f2678fa1ddbf5a93e3499a08ae1173c12806eaabeb41026603aa8cac03458fa87bd6a1730af1b41e17cf650e75'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-19-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rm -r -f "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser

    cd "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"
    ./gradlew --no-daemon assemble
}

package() {
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/microxrcedds/
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-${pkgver}/scripts/microxrceddsgen "${pkgdir}"/usr/bin
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-${pkgver}/share/microxrcedds/microxrceddsgen.jar "${pkgdir}"/usr/share/microxrcedds/microxrceddsgen.jar
}
