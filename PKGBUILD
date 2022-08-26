# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk11
pkgver=11.0.16.1
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=11" "java-runtime=11" "java-runtime-headless=11")
depends=('java-runtime-common>=3' 'java-environment-common=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

_build=11.58.25
source_armv6h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv6h=('6f7a4721303710384e7c9aeaf5a47954dbf992e2d92a27bc83c2170229c3a826')
source_armv7h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv7h=('6f7a4721303710384e7c9aeaf5a47954dbf992e2d92a27bc83c2170229c3a826')
source_armv8h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv8h=('6f7a4721303710384e7c9aeaf5a47954dbf992e2d92a27bc83c2170229c3a826')
_build=11.58.23
source_aarch64=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch64.tar.gz")
sha256sums_aarch64=('f0f3b2ef8affd321ce9c76680da2ffc2f7266b7f3e57a521e95d2167b3d83fdf')
_build=11.58.25
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
sha256sums_i686=('c75d2bd5f53d92ca3aed24ffdef6690824af5a7e04f8809dcc509b0a666c3083')
_build=11.58.23
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
sha256sums_x86_64=('b8b3e7c2eec6d62b6f4de3e4b4b1c6035d42bd4d6d4f31e9aa804dc311d4a4b3')

_jvmdir="usr/lib/jvm/zulu-embedded-11"
package() {
    cd "$(basename *.tar.gz .tar.gz)"

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
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu11.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
