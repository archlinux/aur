# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk
pkgver=13.0.4
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/zulu-community'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=13" "java-runtime=13")
depends=('java-runtime-common>=3' 'java-environment-common>=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')
conflicts=('zulu-embedded-jdk11')
replaces=('zulu-embedded-jdk11')

#CARCH=armv7h

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        _build=13.33.38
        sha256sums=('9b8bfb5b60bd93a1c724834a805c2e81897bb58b54c89ce0f45712940444e720')
        source=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-c2-linux_${_arch}.tar.gz")
        ;;
    aarch64) _arch='aarch64'
        _build=15.28.51
        pkgver=15.0.1
        sha256sums=('4EBEE3BB161B03FC4CC470B9BF569B936E6FB9160D9C614DD2C9FF5EA86C8764')
        source=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=13" "java-runtime=13")
        ;;
    i686) _arch='i686'
        _build=15.28.51
        pkgver=15.0.1
        sha256sums=('97952DCE54084F3831F229D856C5956197530473DCE7031454AE93C87F73CE68')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=14" "java-runtime=14")
        ;;
    x86_64) _arch='x64'
        _build=15.28.51
        pkgver=15.0.1
        sha256sums=('1A266AF1A4D04B70BF9EA2CEA576C9FAAA1315D376994746E123538081C56D78')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=14" "java-runtime=14")
        ;;
esac

_archive=${source[0]/.tar.gz/}
_jvmdir="usr/lib/jvm/zulu-embedded-${pkgver%%.*}"

package() {
    cd "$(basename $_archive)"

    install -dm 755 "${pkgdir}/${_jvmdir}"
    cp -a . "${pkgdir}/${_jvmdir}/"

    # Conf
    install -dm 755 "${pkgdir}/etc"
    cp -r conf "${pkgdir}/etc/${pkgname}"
    rm -rf "${pkgdir}/${_jvmdir}/conf"
    ln -s "/etc/${pkgname}" "${pkgdir}/${_jvmdir}/conf"

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    cp -r legal "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/${_jvmdir}/legal"
    ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"

    # Man pages
    for f in man/man1/*; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
