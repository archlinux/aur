# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=fped-git
pkgver=20130217
pkgrel=1
pkgdesc="Footprint Editor for KiCad used by Qi Hardware developers"
arch=('i686' 'x86_64')
url='http://svn.openmoko.org/trunk/eda/fped'
license=('GPL2')
depends=('imagemagick' 'ttf-liberation' 'netpbm' 'gtk2' 'flex' 'transfig' 'desktop-file-utils')
makedepends=('git')
provides=('fped')
conflicts=('fped' 'fped-svn')
replaces=('fped' 'fped-svn')
install=fped.install
source=(fped.png
		fped.desktop)
md5sums=('378b510a463478d8a48272cdf1a69e51'
         'adb6d02938f257b44b54c0d7724e8968')

_gitroot=git://projects.qi-hardware.com/fped.git
_gitname=fped

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make  PREFIX=$pkgdir/usr install

  install -Dm644 ${srcdir}/fped.desktop ${pkgdir}/usr/share/applications/fped.desktop
  install -Dm644 ${srcdir}/fped.png ${pkgdir}/usr/share/pixmaps/fped.png

}

# vim:set ts=2 sw=2 et:
