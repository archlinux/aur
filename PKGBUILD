# Maintainer: Kyle Brady <kyle at spark - gap dot com>

pkgname=project-zomboid-server
# While the pkgver is set to 41.66, the latest version will always be downloaded via steamcmd
pkgver=41.66
pkgrel=1
pkgdesc="Dedicated server for the game Project Zomboid"
arch=('x86_64')
url='https://projectzomboid.com'
license=('custom:PZLicense')
depends=('java-runtime-headless' 'lib32-glibc' 'libxext' 'gcc-libs' 'libsm' 'rcon-cli')
makedepends=('steamcmd')
backup=('etc/project-zomboid/server.conf')
install='project-zomboid-server.install'
source=('project-zomboid-server.service'
        'project-zomboid-server.conf'
        'project-zomboid-server.sysusers'
        'project-zomboid-server.tmpfiles')
sha256sums=('1eb16b0d67aca6b112b1bfaead24fb3851c9b351b7e8804e334fb4f08906b891'
            '6d7163af00d1521c1802bbbf304eb62e8578ca7c7f9c3a1618f8ed5584c08591'
            '561f21c7cc53dc4a14eae829c04050e917d668649a1fffab630647c62f94bb08'
            'b9bbddb77573ce3f4fde792114ac7685292caee07e7d6f1fc993db4f32013098')

prepare() {
    steamcmd +force_install_dir "$srcdir/$pkgname" +login anonymous +app_update 380870 validate +quit
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"
    rm -r "$pkgdir/opt/$pkgname/jre64"
    rm "$pkgdir/opt/$pkgname/start-server.sh"
    rm "$pkgdir/opt/$pkgname/ProjectZomboid32.json"

    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 $pkgname.conf "$pkgdir/etc/project-zomboid/server.conf"
    install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 "$pkgdir/opt/$pkgname/license/PZLicense.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
