# Maintainer: BabbleBones <babblebones at protonmail dot com>
# Contributor: Kyle Brady <kyle at spark - gap dot com>

pkgname=project-zomboid-server-unstable
_basename=project-zomboid-server
# While the pkgver is set here, the latest unstable version will always be downloaded via steamcmd
# Build 42 is currently on the unstable beta branch
pkgver=42.15.2
pkgrel=1
pkgdesc="Dedicated server for the game Project Zomboid (Build 42 unstable)"
arch=('x86_64')
url='https://projectzomboid.com'
license=('custom:ProjectZomboid')
depends=('jre-openjdk-headless>=25' 'lib32-glibc' 'libxext' 'gcc-libs' 'libsm' 'rcon-cli')
makedepends=('steamcmd')
provides=('project-zomboid-server')
conflicts=('project-zomboid-server')
options=('!strip' '!debug')
backup=('etc/project-zomboid/server.conf')
install='project-zomboid-server.install'
source=('project-zomboid-server.service'
        'project-zomboid-server.conf'
        'project-zomboid-server.sysusers'
        'project-zomboid-server.tmpfiles')
sha256sums=('448325d636dfa825c8dd849303b6a92fa63eee628da57e2438dd173657b9b056'
            '1314a94efda4bfbef5df3e325e0f41afb46fe442c9a61466988251db6cfaedab'
            '561f21c7cc53dc4a14eae829c04050e917d668649a1fffab630647c62f94bb08'
            'ecd0abe220d2fa7ad1c31d7a46aa086c74e92aa5801cb013c7943dc301f411a0')

prepare() {
    steamcmd +force_install_dir "$srcdir/$_basename" +login anonymous +app_update 380870 -beta unstable validate +quit
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    cp -r $_basename "$pkgdir/opt/"

    # Remove bundled JRE — we use system jre-openjdk-headless>=25
    # B42 ships Azul Zulu JDK 25 (class file version 69.0)
    rm -rf "$pkgdir/opt/$_basename/jre64"

    # Remove unnecessary launch scripts
    rm -f "$pkgdir/opt/$_basename/start-server.sh"
    rm -f "$pkgdir/opt/$_basename/ProjectZomboid32.json"
    rm -f "$pkgdir/opt/$_basename/"*.bat

    install -Dm644 $_basename.service "$pkgdir/usr/lib/systemd/system/$_basename.service"
    install -Dm644 $_basename.conf "$pkgdir/etc/project-zomboid/server.conf"
    install -Dm644 $_basename.sysusers "$pkgdir/usr/lib/sysusers.d/$_basename.conf"
    install -Dm644 $_basename.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_basename.conf"
    # B42 renamed PZLicense.txt to "Project Zomboid.txt"
    install -Dm644 "$pkgdir/opt/$_basename/license/Project Zomboid.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
