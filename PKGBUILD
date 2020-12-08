# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-git
pkgver=r401.75bc92d
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
optdepends=('picom: transparency support')
makedepends=('npm' 'nodejs' 'git')
provides=('lightcord')
conflicts=('lightcord-bin')
source=("$pkgname::git://github.com/Lightcord/Lightcord.git"
	"Lightcord.desktop"
	"https://raw.githubusercontent.com/Lightcord/Lightcord/master/LICENSE"
	"lightcord.png::https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")


pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP'
	 'd60e05000301e23b5819bdfbe8d9f52b'
	 'SKIP'
	 'SKIP')

build() {
  cd "$pkgname" 
  npm run devInstall 
  npm run build
}

package() {
    # taken from lightcord-bin
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


