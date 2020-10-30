# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-git
pkgver=r375.d0ea1fd
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
optdepends=('picom: transparency support')
makedepends=('npm' 'nodejs' 'git')
conflicts=('lightcord-bin')
source=("$pkgname-$pkgver::git://github.com/Lightcord/Lightcord.git"
	"Lightcord.desktop"
	"lightcord.png::https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")

md5sums=('SKIP'
	    'd60e05000301e23b5819bdfbe8d9f52b'
	    'SKIP')

pkgver() {
	cd "$srcdir/Lightcord"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "Lightcord" 
  npm run devInstall 
  npm run build
}

package() {
    # taken from lightcord-bin
    # Create the folder structure
    install -d "$pkgdir"/opt/lightcord
    install -d "$pkgdir"/usr/share/pixmaps

    # Copy files over and set rights
    cp -a "$srcdir/Lightcord/builds/linux-unpacked"/. "$pkgdir"/opt/lightcord
    cp -a "$srcdir/lightcord.png" "$pkgdir"/opt/lightcord
    chmod 755 "$pkgdir"/opt/lightcord/lightcord
    # Link icon and add Desktop
    ln -s /opt/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$srcdir"/Lightcord.desktop -t "$pkgdir"/usr/share/applications
}


