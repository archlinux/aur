# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-git
pkgver=0.1.5.r4.g6bd9c0a
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
optdepends=()
makedepends=('npm' 'nodejs' 'git')
provides=('lightcord')
conflicts=('lightcord-bin')
source=("$pkgname::git://github.com/Lightcord/Lightcord.git"
	"Lightcord.desktop"
	"https://raw.githubusercontent.com/Lightcord/Lightcord/master/LICENSE"
	"lightcord.png::https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")


pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         '7c420cb31a9ef6d3a63cddcc1f235823'
         '738e1aa6aff38e2ced608999d58ff5d7'
         'f1ace6f149a3d778bfb789d10181d877')

build() {
    cd "$pkgname"
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
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Create symlink
    ln -s /opt/lightcord/lightcord "$pkgdir"/usr/bin/lightcord
}
