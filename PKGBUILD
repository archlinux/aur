# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=prisonarchitect-hib
pkgver=update5b
pkgrel=1
pkgdesc='Prison construction and management simulation (Humble Bundle version)'
url='http://www.introversion.co.uk/prisonarchitect/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('glu')
conflicts=('prisonarchitect')
provides=('prisonarchitect')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
install=desktop.install

source=("hib://prisonarchitect-${pkgver}-linux.tar.gz"
        "prisonarchitect.png::http://www.introversion.co.uk/prisonarchitect/images/tier/tier_icon250.png"
        "prisonarchitect.desktop")
md5sums=('cf8c3efde8188021e64363127451b8de'
         'd8df107c67e1474fabf56cbd90b174ed'
         '9e6cf081869d3e0949fe803a01907d50')

build() {
  # Remove unneded architectures.
  find -name 'PrisonArchitect.*' -executable \! -name "PrisonArchitect.$CARCH" -delete
}

package() {
  local destdir="/opt/prisonarchitect"
	install -d "$pkgdir"{"$destdir",/usr/{bin,share/{pixmaps,applications}}}

	# Install game files
	cp -r --no-preserve=ownership prisonarchitect*/* "$pkgdir$destdir"

	# Point launcher script to the correct directory
	sed -i "s|^base=.*|base=$destdir|" "$pkgdir$destdir/PrisonArchitect"

	# Link executable
	ln -s "$destdir/PrisonArchitect" "$pkgdir/usr/bin/prisonarchitect"

  # Install desktop file and icon
  install -m644 *.desktop "$pkgdir/usr/share/applications"
  install -m644 *.png "$pkgdir/usr/share/pixmaps"
}
