# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk
pkgver=19.0.1
_build=19.30.11
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
        pkgver=17.0.5
        _build=17.38.21
        sha256sums=('55f936d1b067bfc760ae5682f563ac79dd93a31d0042e04c77bac11f62dacf0b')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-c2-linux_${_arch}.tar.gz")
        provides=("java-environment=13" "java-runtime=13")
        ;;
    aarch64) _arch='aarch64'
        sha256sums=('5f9c1ea91000a271afad3726149a6aefbca3c3b9e0fa790e9aa7fbf0f38aa9ed')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        ;;
    i686) _arch='i686'
        pkgver=18.0.2.1
        _build=18.32.13
        sha256sums=('91337d39daccf91169761b2b0b80249f1a65cb60e8a6a82d5bbffd2eee10ef4e')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        ;;
    x86_64) _arch='x64'
        sha256sums=('2ac8cd9e7e1e30c8fba107164a2ded9fad698326899564af4b1254815adfaa8a')
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
