# Maintainer: kyndair <kyndair at gmail dot com>
# while the executables have been made GPL the game data remains closed, a copy of the windows game is required to obtain the game data, sources include gog, steam or 2nd hand disc.
pkgname=iortcw
_pkgname=return_to_castle_wolfenstein
pkgver=1.51c
pkgrel=3
pkgdesc="Return to Castle Wolfenstein, an update of the GPL'd source code from ID software to play nicely with modern hardware."
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/iortcw/iortcw"
license=('GPL')
depends=('rtcw-data' 'openal' 'libbloom' 'mesa' 'curl' 'sdl2')
makedepends=('p7zip' 'unzip')
provides=('iorctw')
conflicts=('iorctw-git')
install=iortcw.install
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/patch-data-SP_deutsch.zip"
        "${url}/releases/download/${pkgver}/patch-data-SP_espanol.zip"
        "${url}/releases/download/${pkgver}/patch-data-SP_francais.zip"
        "${url}/releases/download/${pkgver}/patch-data-SP_italiano.zip"
        'rtcwsp.desktop'
        'rtcwmp.desktop'
        'rtcwded.desktop'
        'rtcw.lang'
        "${pkgname}-${pkgver}-sp.patch"
        "${pkgname}-${pkgver}-mp.patch")
sha256sums=('0f6c136db1e5c6115e044190655163b9784bbef9b0667ec2a8900abd79565e83'
        '593b3f6689e32039c6a4132eb47248d65ec2649c3c2380c3b76f8e821d5ca9c9'
        '6c261778fdd99e1082990003d55c4128109335791d8395d7b94a1ddce045a2a8'
        'c0aab364042b05e584708c4aead70f1bf0d1e10b92118bfe44dd4d31a38ded9b'
        '2decc269f8d4292d2e0c3152c5ba4533b40e566b73842b6773f7455fbf3955d7'
        '33616c091013f515e04164cb4e4588f862619948e77451601386f0a3f026be2c'
        '3effe77f8fa180081c2ce9ba3bb98b7d920f7fe35a043b33e0a3f9fa4df864f9'
        '74e68894ca76f2a1f202edc018eb5576094dd76d5e54337d9a9491e51eed9e0e'
        'a1332d35711f589e6d74bab649691bb2b51ee68194583eb9fef5541e59b3ae9f'
        'a42fa22ae6f385e29439f3da1f33add660611dab65b1031ccf62e829a0742ab8'
        'b5b69c3b6a981dcbc31c99a16807eb4793828409814d681083fb8d5423bf4066')
noextract=('patch-data-SP_deutsch.zip'
            'patch-data-SP_espanol.zip'
            'patch-data-SP_francais.zip'
            'patch-data-SP_italiano.zip')

prepare() {
    # unpack language packs
    if ! [ -e main ]; then
        mkdir main
    fi
    unzip -qqLLj patch-data-SP_deutsch.zip
        mv sp_pak3.pk3 main/de_pak3.pk3
        mv language.cfg main/de_language.cfg
    unzip -qqLLj patch-data-SP_espanol.zip
        mv sp_pak3.pk3 main/es_pak3.pk3
        mv language.cfg main/es_language.cfg
    unzip -qqLLj patch-data-SP_francais.zip
        mv sp_pak3.pk3 main/fr_pak3.pk3
        mv language.cfg main/fr_language.cfg
    unzip -qqLLj patch-data-SP_italiano.zip
        mv sp_pak3.pk3 main/it_pak3.pk3
        mv language.cfg main/it_language.cfg
    # Patch makefiles to make arch friendly
    patch -p1 < "${srcdir}/${pkgname}-${pkgver}-sp.patch"
    patch -p1 < "${srcdir}/${pkgname}-${pkgver}-mp.patch"
}

build() {
    # compile single player binaries
    cd "${srcdir}/${pkgname}-${pkgver}/SP"
    make
    # compile multiplayer & dedicated server binaries
    cd "${srcdir}/${pkgname}-${pkgver}/MP"
    make
}

package() {
    # install game documents
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/${pkgname}-readme.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/rend2-readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/rend2-readme.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/voip-readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/voip-readme.txt"
    # install licenses
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/SP/README.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/id-software-gpl-license-sp.txt"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/MP/README.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/id-software-gpl-license-mp.txt"
    #install libraries
    mkdir -p "${pkgdir}/opt/${_pkgname}/main/vm/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/SP/build/release-linux-${CARCH}/"*.so "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/SP/build/release-linux-${CARCH}/main/"*.so "${pkgdir}/opt/${_pkgname}/main/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/MP/build/release-linux-${CARCH}/"*.so "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/MP/build/release-linux-${CARCH}/main/"*.so "${pkgdir}/opt/${_pkgname}/main/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/MP/build/release-linux-${CARCH}/main/vm/"*.qvm "${pkgdir}/opt/${_pkgname}/main/vm/"
    install -Dm644 "${srcdir}/main/"* "${pkgdir}/opt/${_pkgname}/main/"
    # install rtcw executables
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/SP/build/release-linux-${CARCH}/"*."${CARCH}" "${pkgdir}/opt/${_pkgname}/"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/MP/build/release-linux-${CARCH}/"*."${CARCH}" "${pkgdir}/opt/${_pkgname}/"
    install -Dm755 "${srcdir}/rtcw.lang" "${pkgdir}/usr/bin/rtcw.lang"
    # update and install launchers
    mkdir -p "${pkgdir}/usr/share/applications/"
    sed -i "s/ARCH/${CARCH}/" "${srcdir}/"*.desktop
    install -Dm644 "${srcdir}/"*.desktop "${pkgdir}/usr/share/applications/"
}
