# Maintainer: pryme-svg <edoc.www@gmail.com>

_nodeversion='12'

pkgname=lightcord-git
pkgver=0.1.7.r11.g3c4c7de
pkgrel=2
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
optdepends=()
makedepends=('npm' 'nvm' 'git')
provides=('lightcord')
conflicts=('lightcord-bin')
source=("$pkgname::git://github.com/Lightcord/Lightcord.git"
    "Lightcord.desktop"
    "lightcord.png::https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png"
)


pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         'fe0f68276f9fc0272879c8c654bc9141'
         'f1ace6f149a3d778bfb789d10181d877')

build() {
    cd "$srcdir/$pkgname"
    source /usr/share/nvm/init-nvm.sh
    nvm install ${_nodeversion} && nvm use ${_nodeversion}
    npm run devInstall
    npm run build
}

package() {
    # Create the folder structure
    install -d "$pkgdir"/opt/lightcord
    install -d "$pkgdir"/usr/share/pixmaps
    install -d "$pkgdir"/usr/bin

    # Copy files over and set rights
    cp -a "$srcdir/$pkgname/builds/linux-unpacked"/. "$pkgdir"/opt/lightcord
    cp -a "$srcdir/lightcord.png" "$pkgdir"/opt/lightcord
    chmod 755 "$pkgdir"/opt/lightcord/lightcord

    # Link icon and add Desktop
    cp "$srcdir"/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$srcdir"/Lightcord.desktop -t "$pkgdir"/usr/share/applications
    install -Dm644 "$srcdir/$pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create symlink
    ln -s /opt/lightcord/lightcord "$pkgdir"/usr/bin/lightcord
}
