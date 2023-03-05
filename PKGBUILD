# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk
pkgver=19.0.2
_build=19.32.13
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for ARMv8 64bit devices.'
arch=('armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/?os=linux'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=19" "java-runtime=19")
depends=('java-runtime-common>=3' 'java-environment-common>=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        pkgver=17.0.6
        _build=17.40.19
        sha256sums=('a2d9d7b734174fd734700194d8e38434f24a62be193c4c2810ba1a91efd4c5e4')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-c2-linux_${_arch}.tar.gz")
        provides=("java-environment=17" "java-runtime=17")
        ;;
    aarch64) _arch='aarch64'
        sha256sums=('76216efa69e448fe487d57310372aea0df1cf15b82974c84a8cb0d97eb934165')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        ;;
    i686) _arch='i686'
        pkgver=18.0.2.1
        _build=18.32.13
        sha256sums=('91337d39daccf91169761b2b0b80249f1a65cb60e8a6a82d5bbffd2eee10ef4e')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=18" "java-runtime=18")
        ;;
    x86_64) _arch='x64'
        sha256sums=('4a994aded1d9b35258d543a59d4963d2687a1094a818b79a21f00273fbbc5bca')
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
