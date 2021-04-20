# Maintainer: Markus Sommer <markus@splork.de>
#
# The server does not accept a config file, but needs to be configured via startup options
# To edit the server options, run `systemctl edit --full valheim-server.service` and edit the `ExecStart`-line.
# this will create a new service file /etc/systemd/sys/valheim-server.service, based on the supplied file in /usr/lib/systemd/system/valheim-server.service with your edits
# Specifically, you probably want to edit the "-name" and "-password" options 
#
# I created a macro for ufw, because that's what I use, if you have a macro for a different firewall, feel free to email me a patch.

pkgname=valheim-server
pkgver=0.150.3
pkgrel=1
pkgdesc="Dedicated server for the Valheim PC game"
arch=('x86_64')
url='https://www.valheimgame.com/'
license=('custom:IronGateLicense')
depends=("zlib" "gcc-libs" "lib32-glibc")
makedepends=("steamcmd")
backup=("etc/ufw/applications.d/ufw-valheim")
source=('valheim-server.service'
        'ufw-valheim'
        'valheim.sysusers'
        'valheim.tmpfiles')
sha512sums=('25b73635f8ab8080fecc7cfa578efb49473563e89bc167243b821b1a6eb44d9eac33568df3d50f57d7d9c1d9de0290c22d91523abaa86cca8008503de20704b2'
            '8c07f061baef278ca6b5bc6da111bf650c835c1b06a6c166f48f2fddea7e26b7c21a02628dfd1e9aa369ad16eb7f2387412b81465a4db5210a17e756f16f208a'
            'c7d47a634e3c75a993e7eecef05b85fc1440316f82f88142cac0774ba56f5822463912e74207dfbdf3b419523fa5e1062da70bd5d1df50e1937e37ba44979613'
            '86830550c1953137b876258db948af319181760a496c69c3580047f58c18746d70d720a2cfb34650a657a5944b41f1d73bf8aa8d003ffa459056755a2edda8af')

prepare() {
    steamcmd +login anonymous +force_install_dir "$srcdir/$pkgname" +app_update 896660 +verify +quit
}

package() {
    cd $srcdir
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"

    install -D -m 0644 valheim-server.service "$pkgdir/usr/lib/systemd/system/valheim-server.service"
    install -D -m 0644 ufw-valheim "$pkgdir/etc/ufw/applications.d/ufw-valheim"
    install -D -m 0644 valheim.sysusers "$pkgdir/usr/lib/sysusers.d/valheim.conf"
    install -D -m 0644 valheim.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/valheim.conf"
}
