# Maintainer: Markus Sommer <markus@splork.de>
#
# Unfortunately, the devs don't make the server binary directly available; you have to use steam to get it (even though you don't need t to authenticate).
# Also, I haven't been able to get steam to download a specific version.
# So, right now, no matter what the package's version number says, you will always get the newest version when installing.
#
# I created a macro for ufw, because that's what I use, if you have a macro for a different firewall, feel free to email me a patch.

pkgname=valheim-server
pkgver=0.212.7
pkgrel=1
pkgdesc="Dedicated server for the Valheim PC game"
arch=('x86_64')
url='https://www.valheimgame.com/'
license=('custom:IronGateLicense')
depends=("zlib" "gcc-libs" "lib32-glibc")
makedepends=("steamcmd")
backup=("etc/valheim/server.conf" "etc/ufw/applications.d/ufw-valheim")
source=('valheim-server.service'
        'server.conf'
        'ufw-valheim'
        'valheim.sysusers'
        'valheim.tmpfiles')
sha512sums=('b324089a4ef2e3f908daa469050447ae8cde67e49103bbe238d3b54065464e7d4314e2159eaea2c03f01a6de700288b4a4664cfa40f0d880c8858e2680258d03'
            'eeb160800a7e4af5ab0cb6cb8ca60ca8d4be74c6d60e8bb936f21c09c449446270c66cee6c55a6a528b9c8c6b8657fdde87b1a8bf54068c45a7e54d2c5d6ec32'
            '8c07f061baef278ca6b5bc6da111bf650c835c1b06a6c166f48f2fddea7e26b7c21a02628dfd1e9aa369ad16eb7f2387412b81465a4db5210a17e756f16f208a'
            'c7d47a634e3c75a993e7eecef05b85fc1440316f82f88142cac0774ba56f5822463912e74207dfbdf3b419523fa5e1062da70bd5d1df50e1937e37ba44979613'
            '86830550c1953137b876258db948af319181760a496c69c3580047f58c18746d70d720a2cfb34650a657a5944b41f1d73bf8aa8d003ffa459056755a2edda8af')

prepare() {
    steamcmd +login anonymous +force_install_dir "$srcdir/$pkgname" +app_update 896660 validate +quit
}

package() {
    cd $srcdir
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"

    install -D -m 0644 valheim-server.service "$pkgdir/usr/lib/systemd/system/valheim-server.service"
    install -D -m 0644 server.conf "$pkgdir/etc/valheim/server.conf"
    install -D -m 0644 ufw-valheim "$pkgdir/etc/ufw/applications.d/ufw-valheim"
    install -D -m 0644 valheim.sysusers "$pkgdir/usr/lib/sysusers.d/valheim.conf"
    install -D -m 0644 valheim.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/valheim.conf"
}
