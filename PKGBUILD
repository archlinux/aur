# Maintainer: marazmista <marazmista@gmail.com>

pkgname=radeon-profile-git
pkgbase=radeon-profile
pkgver=20160729
pkgrel=1
pkgdesc="App for display info about radeon card"
url="http://github.com/marazmista/radeon-profile"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'libxkbcommon-x11' 'libxrandr')
makedepends=('qt5-tools') 
optdepends=('radeon-profile-daemon: system daemon for reading card info'
	'lm_sensors: to show gpu temperature' 
	'sudo: start with root privilages without password' 
	'mesa-demos: for glxinfo' 
	'xorg-xdriinfo: display driver name' 
	'xorg-xrandr: show card connected outputs'
	'xf86-video-ati: radeon open source driver')
provides=('radeon-profile')
replaces=('radeon-profile')
source=("https://github.com/marazmista/radeon-profile/archive/$pkgver.tar.gz")
sha256sums=('SKIP')
 
build() {

tar xvf $pkgver.tar.gz

mkdir -p build
cd build


lrelease ../$pkgbase-$pkgver/radeon-profile/radeon-profile.pro
cp ../$pkgbase-$pkgver/radeon-profile/*.qm .

qmake-qt5 ../$pkgbase-$pkgver/radeon-profile
make
}
 
package() {
cd build
make prefix="${pkgdir}" install

install -Dm644 "$srcdir/build/radeon-profile" "$pkgdir/usr/bin/radeon-profile"
chmod +x "$pkgdir/usr/bin/radeon-profile"

install -Dm644 "$srcdir/$pkgbase-$pkgver/radeon-profile/extra/radeon-profile.png" "$pkgdir/usr/share/pixmaps/radeon-profile.png"
install -Dm644 "$srcdir/$pkgbase-$pkgver/radeon-profile/extra/radeon-profile.desktop" "$pkgdir/usr/share/applications/radeon-profile.desktop"

for translation in *.qm
do
install -Dm644 "$translation" "$pkgdir/usr/share/radeon-profile/$translation"
done 
}