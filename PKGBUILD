# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk8
pkgver=8.0.282
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
        _build=8.52.0.23
        sha256sums=('33c0250cc4e6ee7cdd882cba7ef51f16bcf151e966285721822210ca40780457')
        ;;
    aarch64) _arch='aarch64'
        _build=8.52.0.23
        sha256sums=('ae0ad6046f6e7e751b43c615e3d37afc8b6b1c19b88dffd5f22c225aae9d26a7')
        ;;
    i686) _arch='i686'
        _build=8.52.0.23
        sha256sums=('d68bd05d36a4da4774a5211eaca2870eda632410df19fe1dabb5adf9906c54c3')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
        ;;
    x86_64) _arch='x64'
        _build=8.52.0.23
        sha256sums=('36c39878724f509d765a8f3804f6cef87c2eff39ac85447a0dc870231c1d3bca')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
esac

_archive="zulu${_build}-ca-jdk${pkgver}-linux_${_arch}"
source=(${source:-"https://cdn.azul.com/zulu-embedded/bin/${_archive}.tar.gz"})

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
