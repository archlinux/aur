# Maintainer: WB2FKO <mph at sportscliche dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
# Contributor: Bob Finch <w9ya at qrparci dot net> 
pkgname=xastir-cvs
pkgver=20130206
pkgrel=1
pkgdesc="X Amateur Station Tracking and Information Reporting"
arch=('i686' 'x86_64')
url="http://www.xastir.org/"
license=('GPL')
depends=('gv' 'gpsman' 'gpsmanshp' 'libpng' 'libxml2'
'lesstif' 'shapelib' 'curl' 'libax25' 'gdal' 'imagemagick' 'pcre')
optdepends=('festival: sound support')
makedepends=('cvs' 'autoconf' 'automake')
source=( $pkgname.desktop
                $pkgname.png
		README
                http://downloads.sourceforge.net/xastir/xastir-sounds.tgz)
md5sums=('68b7ac2954b975a36eba1d89d61d8da3'
         '315f926326c3aef27ce7c60d944737f1'
         '720136bf7086091bde488a5aa1df9cfd'
         '4201e7079cb5b2bd8a7c34dccfa3f2bb')

# Fetch the very latest sources from CVS
_cvsroot=":pserver:anonymous:@xastir.cvs.sourceforge.net:/cvsroot/xastir"
_cvsmod="xastir"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
 
# Install a menu item with icon
  cd $srcdir
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
# Copy audio alarm sound files
  install -m644 sounds/* $pkgdir/usr/share/xastir/sounds/
# Uncomment the next line if using kernel AX.25
# chmod 4555 $pkgname/usr/bin/xastir
}
