# Maintainer: Dud803 <Dude803aur<AT>gmail<DOT>com>

pkgname=("asf-git")
pkgrel=1
pkgver=0
pkgver(){
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgdesc="Steam cards farmer. Git version."
conflicts=('asf')
provides=('asf')
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('aspnet-runtime>=3.1')
optdepends=('asf-ui: standalone web interface for ASF')
makedepends=('git' 'dotnet-sdk>=3.1')
install=install
source=("asf-git::git+https://github.com/JustArchiNET/ArchiSteamFarm.git"
        "service"
        "service.user"
        "NLog.config")
        
sha256sums=('SKIP'
            'ba1ff85e55e56d71dbdd0d898244ff7725bced8625f29c5389e28525e6cdb987'
            'b627c8d4b3ba7f194a44749bd401b33bae601b9570da98e457737a6f9cfa408f'
            '1353977a61a2e8700df80729cabc88f453b704a0c6ccf45d80a91691fcf6338f')

build() {
    cd ${pkgname}
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    ./cc.sh --no-asf-ui --no-pull
}

package() {
    cd "${pkgname}/out/result"
    install -d -m 755 "${pkgdir}/usr/lib/asf"
    cp -rdp --no-preserve=ownership . "${pkgdir}/usr/lib/asf"
    install -D -m755 ../../run.sh "${pkgdir}/usr/bin/asf"
    sed -i 's,^\(BINARY_DIR[ ]*=\).*,\1'/usr/lib/asf',g' "${pkgdir}/usr/bin/asf"
    find "${pkgdir}/usr/lib/asf" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/asf" -type d -exec chmod 755 {} \;

    install -d -m 755 "${pkgdir}/var/lib/asf/config"
    install -D -m644 "${srcdir}/NLog.config" "${pkgdir}/usr/lib/asf/NLog.config"

    install -D -m644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/asf.service"
    install -D -m644 "${srcdir}/service.user" "${pkgdir}/usr/lib/systemd/user/asf.service"

    # Setup system user and group
    echo 'u asf - "ArchiSteamFarm" /var/lib/asf' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/asf.conf
    echo 'd /var/lib/asf 0755 asf asf -' |
      install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/tmpfiles.d/asf.conf
}
