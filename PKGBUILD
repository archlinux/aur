# Maintainer: Alexander Diana (alexander.a.diana@gmail.com)
pkgname=vrising-server
pkgver=0.5.42584
pkgrel=1
pkgdesc="Dedicated server for the V-Rising PC game"
arch=('x86_64')
url='https://playvrising.com/'
license=('custom:StunlockStudiosLicense')
depends=("wine-staging" "wine-mono" "xorg-server-xvfb" "lib32-gnutls")

makedepends=("steamcmd")

source=('vrising-server.service'
        'vrising-framebuffer.service'
        'vrising.sysusers'
        'vrising.tmpfiles'
        'gracefulshutdown.sh')

sha256sums=('8af62cab2aa72e9827d0666cbecbbd22377f9fd67b183dd29e771ffb3a269800'
            'f23acc2cac0d1abfa8c040b5f54c46da563a23ed20a54deba11128ce6328cc6b'
            'eb15d8ec5aa0a8126f874d9b340d80d9642fc1cdedf4fefd06d4edb3069e164f'
            '3b9b93e71fbea537ceacbbdafe69b1b239d4bf7374efc87bcbb7c39dfbaeb2db'
            '66e46b3d7618801e5188d25305bc5b82f9e4969810da1b585a6ff2228d70f01d')

prepare() {
    steamcmd +force_install_dir "$srcdir/$pkgname" +login anonymous +app_update 1829350 validate +quit
}

package() {
    cd $srcdir
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"

    install -D -m 0644 vrising-server.service "$pkgdir/usr/lib/systemd/system/vrising-server.service"
    install -D -m 0644 vrising-framebuffer.service "$pkgdir/usr/lib/systemd/system/vrising-framebuffer.service"
    install -D -m 0644 vrising.sysusers "$pkgdir/usr/lib/sysusers.d/vrising.conf"
    install -D -m 0644 vrising.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/vrising.conf"
    install -D -m 0755 gracefulshutdown.sh "$pkgdir/opt/$pkgname/gracefulshutdown.sh"
}
