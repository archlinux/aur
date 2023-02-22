# Maintainer: 
pkgname=eprosima-fast-dds-gen
pkgver=2.4.0
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=509cfa3b34814ecf780a6b1fd7e680eaa07cedaf

source=(
    "https://github.com/eProsima/Fast-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha256sums=(
    'c39ddd533bbf282f4f1a41c848650fa1d0e795c57ff66fbde38f0e7dd1b26d3f'
    '5cd564fa525bdb130d9adb44d64d056d2d7e9a6505fa49b2ccc8b2d3bd1ebd62'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-19-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rmdir "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    ./gradlew --no-daemon assemble
}

package() {
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    mkdir -p "gradle_home"
    ./gradlew --no-daemon install -g "${srcdir}/Fast-DDS-Gen/gradle_home" --install_path="${pkgdir}/usr/"
}
