# Maintainer: Sam S. <smls75@gmail.com>

pkgname=aquaria-data-hib
pkgver=1.1.3+h20100504
pkgrel=2
pkgdesc="A 2D fantasy action-adventure game (Humble Bundle version; game data only)"
url='http://www.bit-blot.com/'
arch=('any')
license=('custom: "commercial"')
makedepends=('pngrim-git')
provides=('aquaria-data=1.1.3')
install='aquaria-data-hib.install'
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=('hib://aquaria-lnx-humble-bundle.mojo.run')
md5sums=('8b24ddeeb553e028bbd501102f891cc2')

build () {
  cd $srcdir
  
  # Remove binaries & libraries, and other redundant files
  rm data/{aquaria,xdg-open,lib*}
  rm data/README-linux.txt
  rm -r data/gfx/nag

  # Process PNG textures so that no white borders appear when zoomed out
  msg2 "Fixing game textures..."
  while read line; do echo -n '.'; done < <(  # show progress as dots
    find */ -name '*.png' | xargs pngrim
  ); echo
}

package() {
  cd $pkgdir

  # Install game files
  mkdir -p usr/share/aquaria
  cp -rT "$srcdir/data" usr/share/aquaria

  # Install documentation
  mkdir -p usr/share/doc/aquaria
  mv -T usr/share/aquaria/docs usr/share/doc/aquaria/original

  # Install icon
  install -Dm644 "$srcdir/data/aquaria.png" usr/share/pixmaps/aquaria.png
}
