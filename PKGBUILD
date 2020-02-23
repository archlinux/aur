# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk8
pkgver=1.8.0_242
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=8" "java-runtime=8" "java-runtime-headless=8")
depends=('java-runtime-common>=3' 'java-environment-common=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        _build=8.44.0.213
        sha256sums=('ff5e716bff85439f83f70bd4c256faa9a9934dcedf957f9539899f805d609446')
        ;;
    aarch64) _arch='aarch64'
        _build=8.44.0.213
        sha256sums=('7555f0001b5e56f25fd484c775d772711356a1a29ade068ea4bcd0fa16ac4938')
        ;;
    i686) _arch='i686'
        _build=8.44.0.11
        pkgver=8.0.242
        sha256sums=('2ce2c6d9decdbb1ada86f95ac8e6075f43984913a4c1e4271f546a8e9af835f7')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
        ;;
    x86_64) _arch='x64'
        _build=8.44.0.11
        pkgver=8.0.242
        sha256sums=('2db117fcaeec0ccd00d08fc3bb374aa15d871a01120d7090cf91fe9764756ae9')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
esac

_archive="zulu${_build}-ca-jdk${pkgver}-linux_${_arch}"
source=(${source:-"http://cdn.azul.com/zulu-embedded/bin/${_archive}.tar.gz"})

_jvmdir="usr/lib/jvm/zulu-embedded-${pkgver%%.*}"

package() {
    cd "$_archive"

    install -dm 755 "${pkgdir}/${_jvmdir}"
    cp -a . "${pkgdir}/${_jvmdir}/"

    # Man pages
    for f in man/man1/*; do
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/jre/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/jre/lib/security/cacerts"
}
