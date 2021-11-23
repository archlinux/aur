# Maintainer: Nisaba Xaekai <archlinux@pink.horse>
#
# This is based on the Valheim AUR package by Markus Sommer. As with that package, the only source for the server binary is steamcmd
# This means no matter what the package version says, it will always be the latest version because that's all steamcmd allows for retrieval of.

pkgname=satisfactory-server
pkgver=0.5.0.14.173618
pkgrel=1
pkgdesc="Dedicated server for the Satisfactory PC game"
arch=('x86_64')
url='https://www.satisfactorygame.com/'
license=('custom:CoffeeStainLicense')
depends=("zlib" "gcc-libs" "lib32-glibc")
makedepends=("steamcmd")
backup=("etc/satisfactory/server.conf" "etc/ufw/applications.d/ufw-satisfactory")
source=('satisfactory-server.service'
        'satisfactory.sysusers'
        'satisfactory.tmpfiles'
        'server.conf'
        'ufw-satisfactory')
sha512sums=('67f6d25d6a27734518cf63da07ee7a6c7fa7b38f888a909bc973ea132147c3785db327beb62e0eb0d24a40cb5d3a605273d06b83166cb1bd6369249e2f93ed4a'
            '161293a36ed89a57d4073f807f99c02d06ce649157d7f426402f1efad2704a888a0b1a10e3d278740afed74c682d44a0842e2c8d81ce989955e2fd6c07424607'
            '820536ccad9fdf7e23d0912b4e4d0e184364057066091bddec8db4b506e8c134de79e2723d3ddbe72cf2731c9ee000aa9eecef6cfe39fe5abba9e57eac629a2a'
            'a0087275ca9bb704323ecddd3b9f4bc295174b961bf34651ac5758fa6e76994ef08983783e541483786107581d8118647ea4bdf939871d5c13bdaafa8e64663f'
            '817f66ec1dcc0ea3215fc3da3d9b5fe9b34dbf7cbdbfbf33622aa254ebcc78ba8d358def21b3ef5c88b4f5b87a1341a6741ddc74ebe15081bf73a279d3bc447f')
prepare() {
    steamcmd +force_install_dir "$srcdir/$pkgname" +login anonymous +app_update 1690800 validate +quit
}

package() {
    cd $srcdir
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"

    install -D -m 0644 satisfactory-server.service "$pkgdir/usr/lib/systemd/system/satisfactory-server.service"
    install -D -m 0644 server.conf "$pkgdir/etc/satisfactory/server.conf"
    install -D -m 0644 ufw-satisfactory "$pkgdir/etc/ufw/applications.d/ufw-satisfactory"
    install -D -m 0644 satisfactory.sysusers "$pkgdir/usr/lib/sysusers.d/satisfactory.conf"
    install -D -m 0644 satisfactory.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/satisfactory.conf"
}
