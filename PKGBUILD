# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=quake4-multiplayer-demo
pkgver=1.4.2
pkgrel=1
pkgdesc="Quake 4 Multiplayer demo"
url="https://web.archive.org/web/20061205073314/http://www.idsoftware.com/games/quake/quake4/"
depends=('alsa-lib' 'sdl' 'libxext' 'libgl')
makedepends=('aria2')
arch=('i686')
license=('custom:"Quake 4 Multiplayer Demo"')
install="quake4-multiplayer-demo.install"
source=(ftp://ftp.idsoftware.com/idstuff/quake4/demo/${pkgname}.x86.run \
        ${pkgname}.sh \
        ${pkgname}-dedicated.sh \
        ${pkgname}-smp.sh)
md5sums=('48188680efcf15421803d2af7f7750ca'
         'c80e55efbead2cae5e5326904a82d4d2'
         '791cf1d51a96213859f1608e08667d70'
         '95bcafe7217f4a67bca54f41dcab8d11')

package() {
    cd "${srcdir}"

    chmod +x ${pkgname}.x86.run

    mkdir -p ${pkgdir}/opt/${pkgname} \
           ${pkgdir}/usr/bin \
           ${pkgdir}/usr/share/licenses/${pkgname}

    ./${pkgname}.x86.run -- -i ${pkgdir}/opt/${pkgname} -b ${pkgdir}/usr/bin

    # ncurses & gtk installers don't return 1 when canceled, so check that files are installed
    ls ${pkgdir}/opt/${pkgname}/q4base || return 1

    install -m755 -D ${pkgname}.sh             ${pkgdir}/opt/${pkgname}/${pkgname}
    install -m755 -D ${pkgname}-dedicated.sh ${pkgdir}/opt/${pkgname}/${pkgname}-dedicated
    install -m755 -D ${pkgname}-smp.sh       ${pkgdir}/opt/${pkgname}/${pkgname}-smp

    rm ${pkgdir}/opt/${pkgname}/quake4-demo \
       ${pkgdir}/opt/${pkgname}/quake4-demo-dedicated \
       ${pkgdir}/opt/${pkgname}/quake4-demo-smp \
       ${pkgdir}/usr/bin/quake4-demo \
       ${pkgdir}/usr/bin/quake4-demo-dedicated \
       ${pkgdir}/usr/bin/quake4-demo-smp

    ln -sf /opt/${pkgname}/${pkgname}           ${pkgdir}/usr/bin/${pkgname}
    ln -sf /opt/${pkgname}/${pkgname}-dedicated ${pkgdir}/usr/bin/${pkgname}-dedicated
    ln -sf /opt/${pkgname}/${pkgname}-smp       ${pkgdir}/usr/bin/${pkgname}-smp
    ln -sf /opt/${pkgname}/EULA.txt             ${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt
}

