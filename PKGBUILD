# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk
pkgver=17.0.3
_build=17.34.19
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for ARMv8 64bit devices.'
arch=('armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/?os=linux'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=17" "java-runtime=17")
depends=('java-runtime-common>=3' 'java-environment-common>=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        #_build=
        #pkgver=
        sha256sums=('4be413e4af150f29b3f868ad8a8f0e3ef0b51e389a6433430e351439c8a06573')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-c2-linux_${_arch}.tar.gz")
        provides=("java-environment=13" "java-runtime=13")
        ;;
    aarch64) _arch='aarch64'
        sha256sums=('693f6c6784db21b44646504c702d999515a9e937bccb47eaf420e366ccb1c4b3')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        ;;
    i686) _arch='i686'
        sha256sums=('1c35c374ba0001e675d6e80819d5be900c4e141636d5e484992a8c550be14481')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        ;;
    x86_64) _arch='x64'
        sha256sums=('caa17c167d045631f9fd85de246bc5313f29cef5ebb1c21524508d3e1196590c')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
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
