# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-git
pkgver=r832.982e279
pkgrel=1
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode-git', 'soundnode-app-bin')
provides=('soundnode')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')
makedepends=('git' 'npm')

source=("git+https://github.com/Soundnode/soundnode-app.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '4613630387d6a2073bff66f8fe3d0d352d353ad50811e19ec2470fe09f88985a')

pkgver() {
        cd soundnode-app
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd soundnode-app
        npm install
        npm run clean
        npm run webpack:prod
        npm run sass:prod
        npm run package:linux
}

package() {
        install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

        install -dm755 $pkgdir/opt/$pkgname

        if [ $CARCH = "x86_64" ]; then
                cp -a --no-preserve=ownership -r $srcdir/soundnode-app/dist/Soundnode/Soundnode-linux-x64/* $pkgdir/opt/$pkgname
                install -Dm644 $srcdir/soundnode-app/dist/Soundnode/Soundnode-linux-x64/Soundnode $pkgdir/usr/bin/soundnode
        else
                cp -a --no-preserve=ownership -r $srcdir/soundnode-app/dist/Soundnode/Soundnode-linux-x32/* $pkgdir/opt/$pkgname
                install -Dm644 $srcdir/soundnode-app/dist/Soundnode/Soundnode-linux-x32/Soundnode $pkgdir/usr/bin/soundnode
        fi

        # Install the icon
        install -Dm644 $srcdir/soundnode-app/app/soundnode.png $pkgdir/opt/$pkgname/soundnode.png
}
