
_pluginname=upnp
pkgname=vdr-plugin-$_pluginname-git
pkgver=20130105
revision=1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="For archvdr project!!! UPnP plugin for VDR"
url="http://projects.vdr-developer.org/projects/plg-upnp/"
license="GPL"
makedepends=('git')
depends=('vdr>=1.7.27''libupnp' 'sqlite' 'boost-libs' 'tnt' 'tntdb')
source=()
md5sums=()
conflicts=('vdr-plugin-upnp')

_gitroot=git://projects.vdr-developer.org/vdr-plugin-upnp.git
_gitname=upnp

build() {
  unset CXXFLAGS
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1

  sed -i Make.config -e 's/VDRPLUGINLIBDIR\ ?=\ \/usr/VDRPLUGINLIBDIR\ ?=\ $(DESTDIR)\/usr/'
  sed -i Make.config -e 's/VDRCFGDIR\ ?=\ \/etc/VDRCFGDIR\ ?=\ $(DESTDIR)\/etc/'
  
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" DESTDIR=$pkgdir   install || return 1
  make VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       INCLUDES=-I/usr/include/vdr \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" DESTDIR=$pkgdir install-subplugins || return 1
}

