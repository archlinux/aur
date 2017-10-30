# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Peter <craven@gmx.net>
pkgname=crrcsim-hg
pkgver=0.9.13.r3.1fc598ff00b1
pkgrel=1
pkgdesc="Model airplane flight simulation program. Mercurial version."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/crrcsim/"
license=('GPL')
depends=('sdl>=1.2.5' 'portaudio' 'libjpeg' 'cgal')
groups=()
makedepends=('mercurial' 'gawk' 'plib>=1.8.4')
provides=('crrcsim')
conflicts=('crrcsim')
source=('hg+https://hg.code.sf.net/p/crrcsim/code')
sha256sums=('SKIP')

pkgver() {
  cd code

  echo "$(hg log -r. --template "{latesttag}").r$(hg log -r. --template "{latesttagdistance}").$(hg log -r. --template "{node|short}")"
}

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  rm -rf "$srcdir/code-build"
  cp -r "$srcdir/code" "$srcdir/code-build"
  cd "$srcdir/code-build"

  #
  # BUILD HERE
  #
  sed -i "s/boost_thread-mt/boost_thread/g" ./configure.ac
  sed -i "s/-lCGAL/\"-lCGAL -lgmp\"/g" ./configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/code-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
