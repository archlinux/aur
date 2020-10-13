# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit
pkgver=0.16.1709
pkgrel=2
_user=$(logname)
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0' 'runit')
conficts=('systemd' 'openrc' 's6' 'jackett' 'jackett-mono')
options=('!strip' 'staticlibs')

source=("run"
        "jackett.sysusers"
        "jackett.tmpfiles"
        "jackett-service.desktop")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")

sha256sums=('dd8cf665c118a7c87e796c20d790989e0b1a1e12d16feba2a28e3465ad45be67'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1'
            'c692b09f8df44cac73e53e76a707f4087a58a146b7d0c8043b44182aae3c2f6a')

sha256sums_x86_64=('d64b7623915235fc9381b1da241f9d9a2c9d453782c3e77d08ed5a279eb683c5')
sha256sums_armv7h=('1e5ac380b5737dcab82be12cc6fbf37a50bd5234cedc864dc5286473eeeaa8fc')
sha256sums_aarch64=('59d5f13485d148e0fb38f6e767056203364e66bc45bda2c5163fd0227087c0ab')

package() {
    cd "$srcdir"
       
    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    install -d -m 755 "${pkgdir}/opt/jackett/"
    install -d -m 755 "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    #install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
    #install -D -m 644 "${srcdir}/run" "${pkgdir}/etc/runit/sv/jackett/run"
    
    install -D -m 644 "jackett-service.desktop" "${pkgdir}/home/${_user}/.config/autostart/jackett-service.desktop"
    chown "${_user}:${_user}" "${pkgdir}/home/${_user}/.config/autostart/jackett-service.desktop" 
    install -D -m 644 "jackett-service.desktop" "${pkgdir}/usr/share/applications/jackett-service.desktop"
    #chmod +x "${pkgdir}/etc/runit/sv/jackett/run"

    install -D -m 644 "run" "${pkgdir}/opt/jackett/jackett.sh"
    chmod +x "${pkgdir}/opt/jackett/jackett.sh"

	echo 'Jackett Service has been added to your /home/'${_user}'/.config/autostart/ applications.'
    echo 'You may also start the service, as a normal user now, by issuing the command:'
    echo '---->   /opt/jackett/jackett.sh'
}
