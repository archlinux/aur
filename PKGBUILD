# Maintainer: Theo Müller <theopaul2001 at gmx dot de>


pkgname=vintagestory-server
pkgdesc="An in-development indie sandbox game about innovation and exploration--server package"
license=('custom')
pkgver=1.21.6
pkgrel=1
depends=('dotnet-runtime-8.0' 'screen' 'procps-ng')
arch=('x86_64')
url='https://www.vintagestory.at/'
source=("vintagestory-server-${pkgver}.tar.gz::https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_${pkgver}.tar.gz"
        "vintagestory-server.service"
        "vintagestory-server.tmpfiles"
        "vintagestory-server.sysusers"
        "vsserverd.sh")
noextract=("vintagestory-server-${pkgver}.tar.gz")
sha256sums=('664d468f8e262c9541e89048ba45e884abb39ba2659b095dde1ef95712247eac'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
