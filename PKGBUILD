#Contributor:Andrea Tarocchi <valdar@email.it> 
pkgname=cwiid-git
#pkgver=`date +%Y%m%d`
pkgver=20130619
pkgrel=2
pkgdesc="Cwiid-git is the bleeding edge version of a wiimote's driver and utility tools"
arch=(i686 x86_64)
url="http://github.com/abstrakraft/cwiid"
license=('GPL')

depends=('bluez4' 'gtk2' 'python2')
makedepends=('git' 'make')
conflicts=('cwiid' 'cwiid-svn')
provides=('cwiid' 'cwiid-svn')
install=cwiid.install
source=(fix_libbluethoot.patch)
md5sums=('d92745847f5ba534c2914be1d2b36092')

_gitroot=git://github.com/abstrakraft/cwiid.git
_gitname=cwiid
_builddir=$_gitname-build

build() {
  export PYTHON=python2
  export LDFLAGS=

  cd $srcdir/
  msg "Connecting to github.com GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build

  cd $_builddir
  
  git am --signoff < ../../fix_libbluethoot.patch

  aclocal
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc --with-python=python`python2 --version 2>&1 | cut -d ' ' -f2` --disable-ldconfig
# OLD CONFIG OPTIONS:
# usefull options: LDFLAGS=-L/usr/lib/python2.7

  make
# OLD MAKE OPTIONS:
# CPPFLAGS=-I/usr/include/python2.7 || return 1
}
package() {  
  cd $srcdir/
  cd $_builddir
  make DESTDIR="${pkgdir}" install 

# OLD BUILD WAY:
#  aclocal
#  autoreconf
  
#  ./configure --disable-ldconfig --prefix=/usr --sysconfdir=/etc --with-cwiid-plugins-dir=/lib/cwiid/plugins
#  make LDFLAGS=-L../libcwiid || return 1

#  install -d $startdir/pkg/usr/bin
#  install -d $startdir/pkg/etc
#  install -d $startdir/pkg/usr/lib
#  install -d $startdir/pkg/usr/include

#  make install LDFLAGS=-L../libcwiid prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc install

#  install -D -m644 ./wminput/README $pkgdir/usr/share/doc/cwiid/wminput
}