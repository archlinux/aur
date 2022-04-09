# Maintainer: 
pkgname=eprosima-fast-dds-gen
pkgver=2.1.2
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk11-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=ad28baf822a40f1aa595b613a6866c91c6051bdd

source=(
    "https://github.com/eProsima/Fast-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha256sums=(
    'e30249e1b84e79bd2dd4b49176ccfdaf358a7a8d3255fe67aab81d76f85709c2'
    'df2bc8bae9a5c6d5da3fe0440699ce8714fff184d587c2cadf2fdb0d83550351'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
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
