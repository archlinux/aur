# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=ironclad-tactics-hib
pkgver=1
pkgrel=1
pkgdesc='a fast-paced, card-based tactics game set in an alternate history Civil War – with steam-powered military robots (Humble Bundle version)'
url='http://www.zachtronics.com/ironclad-tactics/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('libgl' 'glu')
conflicts=('ironclad-tactics')
provides=('ironclad-tactics')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=desktop.install

source=("hib://IroncladTacticsDeluxe_Linux.tar.gz"
        "ironclad.png::http://fc06.deviantart.net/fs70/f/2013/303/a/9/ironclad_tactics_v1_by_gabbynaruto-d6scgn3.png"
        "ironclad.desktop")
md5sums=('1e83fd49ca88bc458c1a543eb1117714'
         '680c9a791d41cba2355a412f5b412ed6'
         'a12dd236131527ec3a41ff44b81ad84b')

package() {
  # Mono, used to launch the game, cannot handle spaces in paths, so it has to be installed to a space-less location.
  local destdir=/opt/ironclad
	install -d "$pkgdir"{"$destdir",/usr/{bin,share/{pixmaps,applications}}}

	# Install game files
  cp --no-preserve=ownership -r 'Ironclad Tactics'/* "$pkgdir$destdir"

	# Adapt and place launcher script.
  sed -i "2s|^|cd ${destdir}\nLD_LIBRARY_PATH=. |" "$pkgdir$destdir/ironcladtactics.sh"
  ln -s "$destdir/ironcladtactics.sh" "$pkgdir/usr/bin/ironcladtactics"

  # Install desktop file and icon
  install -m644 *.desktop "$pkgdir/usr/share/applications"
  install -m644 *.png "$pkgdir/usr/share/pixmaps"
}
