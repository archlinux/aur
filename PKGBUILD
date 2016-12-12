# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode
pkgver=0.6.5
pkgrel=7
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')
conflicts=('soundnode', 'soundnode-app-bin')
provides=('soundnode')

# Required, otherwise it won't run.
options=('!strip')

depends=('gconf' 'gtk2' 'libxtst' 'nss' 'alsa-lib' 'libnotify' 'fontconfig')

# This thing requires wine to build, and just to create an icon for the win32 instance.
# Fails if it doesn't exist, so we better include it.
makedepends=('git' 'npm' 'wine' 'wine-mono' 'wine_gecko' 'nw-gyp')

source=("soundnode-app.zip::https://github.com/Soundnode/soundnode-app/archive/$pkgver.zip"
        "soundnode")
sha512sums=('79875bdd154d6579518665c8aa0a75af3eb18dc824f4bbf1cd3b31a1f2afd123c9a76aa057904e662938b5d8509c0cfea9c3b2f695c149ca056fff23c1a39c1f'
            '634fd4beb039d07c9ec2f8750b5e8652a59e0066ad902b936845b9d1c87b7cf3be9802dccb6afe142670d0910855f33a25b4a36db9271ae1246a19c0af1cbbb0')


build() {
    cd soundnode-app-$pkgver
    
    # Patch up the paths to the executable and the icon file.
    sed -i -e "s/\/usr\/share\/soundnode\/Soundnode/\/opt\/$pkgname\/Soundnode/g" fpm/soundnode.desktop
    sed -i -e "s/Icon=soundnode.png/Icon=\/opt\/$pkgname\/soundnode.png/g" fpm/soundnode.desktop
    
    make build
}

package() {
    install -Dm755 $srcdir/soundnode $pkgdir/usr/bin/$pkgname
    install -Dm644 $srcdir/soundnode-app-$pkgver/fpm/soundnode.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    
    install -dm755 $pkgdir/opt/$pkgname
    
    if [ $CARCH = "x86_64" ]; then
        cp -a --no-preserve=ownership -r $srcdir/soundnode-app-$pkgver/dist/Soundnode/linux64/* $pkgdir/opt/$pkgname
    else
        cp -a --no-preserve=ownership -r $srcdir/soundnode-app-$pkgver/dist/Soundnode/linux32/* $pkgdir/opt/$pkgname
    fi
    
    # Install the icon
    install -Dm644 $srcdir/soundnode-app-$pkgver/app/soundnode.png $pkgdir/opt/$pkgname/
}
