# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit.git
_alias=jackett
pkgver=0.17.168
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0')
makedepends=('dotnet-sdk>=5.0.0')
conficts=('systemd' 'openrc' 's6' 'jackett' 'jackett-mono')
options=('!strip' 'staticlibs')

source=("jackett.run"
        "jackett.sysusers"
        "jackett.tmpfiles"
        "jackett.install"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/archive/v${pkgver}.tar.gz")

b2sums=('fed3336e07fe1d88a65bad5fb4f3e081ec16b24c07cc2a96462e7cecc3962b9742897455c0ce7f7fdbe04ecb337c575d54194d2dedad865f72572a5158cc6ef4'
        '6b0534e5f3320e70cff1cc59b0c4de202451d6bc240c0659749929a72223fcb8e636508b14905e3d449c854ae6774c4349480039dd50e35d1d01ac13fa15eea3'
        '4837363802330a33153e8b1560074d3af1c24c393287d295083dc41c82d6667ef0eb1dbcabc6afd180082405762bfed749adc7483d0c6fab0be431f944b4c001'
        'bccae26aece8872da424e8a2076c6a97ec7523026a6c4320e0a3d573452e06e0c36bd65374ecd45f809c107e21902c91b2c6546365b49a173b3f7c775d891b11'
        'ec14960492fe942ada87a6833925b886b542fc2331be3026b79dcba8488e2415a231ab41d5b112e3e9a6a4c212d34d95a6a01b0396b2740ed70d11159e767899')

build() {
  cd ${_alias^}-${pkgver}

  case ${CARCH} in
    x86_64)  _CARCH='x64';;
    aarch64) _CARCH='arm64';;
    armv7h)  _CARCH='arm';;
  esac

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  dotnet publish src/Jackett.Server -f net5.0 --self-contained -r linux-${_CARCH} -c Debug -o buid/ /p:AssemblyVersion=${pkgver} /p:FileVersion=${pkgver} /p:InformationalVersion=${pkgver} /p:Version=${pkgver}
}

package() {
    #cd "$srcdir"
    cd ${_alias^}-${pkgver}

    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    cp -dpr --no-preserve=ownership buid/* "${pkgdir}/usr/lib/jackett/"

    #install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.run" "${pkgdir}/etc/runit/sv/jackett/run"
    chmod +x "${pkgdir}/etc/runit/sv/jackett/run"
    install=jackett.install
}
