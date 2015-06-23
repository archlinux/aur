_pluginname=dxr3
pkgname=vdr-plugin-$_pluginname-git
pkgver=20121029
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Dxr3 VDR-Plugin (0.2-branch)"
url="http://linuxtv.org/vdrwiki/index.php/Dxr3-plugin"
license="GPL"
makedepends=('vdr' 'git')
depends=('vdr' 'gettext' 'pkgconfig' 'ffmpeg' 'em8300')
backup=()
source=()
md5sums=()

_gitroot=git://dxr3plugin.git.sourceforge.net/gitroot/dxr3plugin/dxr3plugin
_gitname=dxr3-plugin

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
    git checkout -b 0.2-branch --track origin/0.2-branch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd  $srcdir/$_gitname-build

  mkdir -p $pkgdir/usr/lib/vdr/plugins/ || return 1
  
  sed -i Makefile -e "s:CXXFLAGS = :CXXFLAGS = -D__STDC_CONSTANT_MACROS :"
  sed -i dxr3ffmpeg.c -e "s:avcodec_init\(\):\/\/avcodec_init\(\):"
  
  make CXXFLAGS=-D__STDC_CONSTANT_MACROS VDRDIR=/usr/include/vdr \
       LIBDIR=. \
       LOCALEDIR="$startdir/pkg/usr/share/locale/" all || return 1
  
  mkdir -p $pkgdir/usr/lib/vdr/plugins						|| return 1
  install -m 755 libvdr-*.so.*		$pkgdir/usr/lib/vdr/plugins/		|| return 1

}

