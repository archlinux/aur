# Maintainer: marazmista <marazmista@gmail.com>

pkgname=radeon-profile-git
pkgbase=radeon-profile
pkgver=20161003.r0.g4347b27
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
source=("git+https://github.com/marazmista/$pkgbase.git")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/$pkgbase"
git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
cd "$srcdir/$pkgbase/radeon-profile"

lrelease radeon-profile.pro
qmake-qt5
make
}

package() {
cd "$srcdir/$pkgbase/radeon-profile"

install -Dm755 "radeon-profile" "$pkgdir/usr/bin/radeon-profile"

install -Dm644 "extra/radeon-profile.png" "$pkgdir/usr/share/pixmaps/radeon-profile.png"
install -Dm644 "extra/radeon-profile.desktop" "$pkgdir/usr/share/applications/radeon-profile.desktop"

cd translations
for translation in *.qm
do
install -Dm644 $translation "$pkgdir/usr/share/radeon-profile/$translation"
done
}
