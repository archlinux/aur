# Maintainer: Theo Müller <theopaul2001 at gmx dot de>


pkgname=vintagestory-server
pkgdesc="An in-development indie sandbox game about innovation and exploration--server package"
license=('custom')
pkgver=1.22.0
pkgrel=1
depends=('dotnet-runtime' 'screen' 'procps-ng')
arch=('x86_64')
url='https://www.vintagestory.at/'
source=("vintagestory-server-${pkgver}.tar.gz::https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_${pkgver}.tar.gz"
        "vintagestory-server.service"
        "vintagestory-server.tmpfiles"
        "vintagestory-server.sysusers"
        "vsserverd.sh")
noextract=("vintagestory-server-${pkgver}.tar.gz")
sha256sums=('72c921d6e24bb4785881c94d7149bf3a6257a4ab27a37fc38d629103502ac6ab'
            'e9807846420e5449f8c61a3c068f79c648664734ed04849910377ad32f215234'
            'b5f68980d92967614c0da37125e05084ed12c26a829c7e29c6da7fc7bb19dc48'
            'bab3a47912d4d568d0078a7802cfde9fa184552f538e0fa6607c9370b0c7d5a8'
            '0bde92bb35ebd1685168a7234c2aa692772edec89d0a3c6fb6d685cac494a172')

options=(!strip)
_pkgname="vintagestory-server-${pkgver}"


prepare() {
    mkdir -p ${_pkgname}
    tar -xzf ${_pkgname}.tar.gz -C ${_pkgname}
    cd ${_pkgname}
    sed -i "s/\/home\/vintagestory\/server/\/opt\/vintagestory-server/" server.sh
    sed -i "s/\/var\/vintagestory\/data/\/var\/vintagestory-server/" server.sh
}

package() {
    mkdir -p ${pkgdir}/opt/vintagestory-server
    cp -aT ${_pkgname} ${pkgdir}/opt/vintagestory-server
    install -dm755 ${pkgdir}/var/vintagestory-server
    install -Dm644 vintagestory-server.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/vintagestory-server.conf
    install -Dm644 vintagestory-server.service  ${pkgdir}/etc/systemd/system/vintagestory-server.service
    install -Dm644 vintagestory-server.sysusers ${pkgdir}/usr/lib/sysusers.d/vintagestory-server.conf
    install -Dm755 vsserverd.sh ${pkgdir}/usr/local/bin/vsserverd
}
