# Contributor: Yarema aka Knedlyk <yupdamin@gmail.com>


_pluginname=image
pkgname=vdr-plugin-${_pluginname}-git
pkgver=2
pkgrel=1
pkgdesc="For archvdr project! Plugin that allows to display of digital images  on the TV screen"
arch=('i686' 'x86_64' 'arm')
url="http://projects.vdr-developer.org/projects/plg-image"
license=('GPL')
depends=('vdr' 'ffmpeg' 'libexif' 'netpbm')
optdepends=('file: for better filetype detection')
conflicts=('vdr-image')
options=()
install=
source=()
md5sums=()

build() {
  unset CXXFLAGS
  unset CPPFLAGS
  unset CFLAGS

  cd ${srcdir}

  _githost="git://projects.vdr-developer.org"
  _gitrepo="vdr-plugin-image.git"
#  _gitid=ab902d3962df5dbe8c8d707da96cdf279ca3b439

  if [ -e $srcdir/vdr-plugin-${_pluginname} ]; then	  
    cd $srcdir/vdr-plugin-${_pluginname}
    git checkout master
    git pull --rebase
    git checkout $_gitid
  else
    git clone ${_githost}/${_gitrepo}
    cd $srcdir/vdr-plugin-${_pluginname}
    git checkout $_gitid
  fi

  if [ -e $srcdir/vdr-plugin-${_pluginname}-build ]; then
    rm -rf $srcdir/vdr-plugin-${_pluginname}-build
  fi

  cp -r $srcdir/vdr-plugin-${_pluginname} $srcdir/vdr-plugin-${_pluginname}-build

  cd $srcdir/vdr-plugin-${_pluginname}-build

  #sed -e 's/so i18n/so/'g -i Makefile

  make VDRDIR="/usr/include/vdr" LIBDIR="." \
    LOCALEDIR="$pkgdir/usr/share/locale" \
    INCLUDES="-I/usr/include -I/usr/include/vdr -I." all || return 1
  
  mkdir -p $pkgdir/usr/lib/vdr/plugins 						|| return 1
  install -m 755 libvdr-${_pluginname}.so.* \
    $pkgdir/usr/lib/vdr/plugins/			|| return 1
}

# vim:set ts=2 sw=2 et:
