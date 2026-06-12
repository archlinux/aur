# Maintainer: Peter Blackman (Peter AT PBlackman dot plus dot com>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jens Adam <jra@byte.cx>

pkgname=lazarus-gtk2
_lazarus_tag=4_8
pkgver=4.8
pkgdesc='Delphi-like IDE for FreePascal GTK2 version'
pkgrel=1
url='http://www.lazarus.freepascal.org/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'MPL-1.1')
arch=('x86_64')
makedepends=('fpc' 'fpc-src' 'gtk2' 'rsync')
options=(!makeflags libtool staticlibs !strip)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('461551b197d41502381be17e80bcb9194350e4c9acc018dc45d06b7d804de17b50fbfdb1b76acfc4ed8ffd8b2b84e9a8725d500084360978aaa4eebb26063dba')

build() {
  cd "lazarus-lazarus_${_lazarus_tag}"

  # build GTK2 IDE
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=gtk2 clean bigide
  # move GTK binaries
  mv lazarus lazarus-gtk2
  mv startlazarus startlazarus-gtk2
}

package() {
  depends=('lazarus' 'gtk2' 'glibc' 'glib2' 'libx11' 'gdk-pixbuf2' 'at-spi2-core' 'cairo' 'pango')
  conflicts=('lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')

  cd "lazarus-lazarus_${_lazarus_tag}"

  # install GTK binaries
  install -Dm755 lazarus-gtk2 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-gtk2 "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
    -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}
