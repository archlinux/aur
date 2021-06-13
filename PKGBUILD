# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk
pkgver=13.0.4
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/?os=linux'
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
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-c2-linux_${_arch}.tar.gz")
        ;;
    aarch64) _arch='aarch64'
        _build=16.30.15
        pkgver=16.0.1
        sha256sums=('c19df0f8cd665a14d26b7a2d92d0319ed91d2e4f0e71a70e6e80289e08b9f291')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=15" "java-runtime=15")
        ;;
    i686) _arch='i686'
        _build=16.30.15
        pkgver=16.0.1
        sha256sums=('f36c9fef25022ddc6736815d79ddd5a5e7d0b00652cbbba0bcea912ed72ad5d0')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=15" "java-runtime=15")
        ;;
    x86_64) _arch='x64'
        _build=16.30.15
        pkgver=16.0.1
        sha256sums=('90c534d2544dc1d183f364e3520c1067724476a68dcd326d91a9579de59627b3')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz")
        provides=("java-environment=15" "java-runtime=15")
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
