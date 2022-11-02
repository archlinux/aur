# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk11
pkgver=11.0.17
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

_build=11.60.19
source_armv6h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv6h=('498180dcf87e89b23071a8136da977a0b50052ac2deb222eae77784810ad78ac')
source_armv7h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv7h=('498180dcf87e89b23071a8136da977a0b50052ac2deb222eae77784810ad78ac')
source_armv8h=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch32hf.tar.gz")
sha256sums_armv8h=('498180dcf87e89b23071a8136da977a0b50052ac2deb222eae77784810ad78ac')
source_aarch64=("https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_aarch64.tar.gz")
sha256sums_aarch64=('48632fb921cae8fd3914f7297b349b66c602455af26cf1fd1d09a866330c3de1')
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
sha256sums_i686=('78ce988091f50a1f153909770872ad8e514d447ba663e6de688a82c9884ce6c2')
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
sha256sums_x86_64=('d9e9d34d64bc63cd846c88117a731e6550c17866df9501d0d1ae0329f965d78a')

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
