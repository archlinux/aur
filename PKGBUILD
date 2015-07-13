# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor rtfreedman (rob<d0t>til<d0t>freedman<aT>gmail<d0t>com
# 
## enable/disable gnome help files; adds makedepends+='yelp-tools'
_build_gnome_help="no" # yes|no

##
## list of locales to build see also: po/LINGUAS
## bg ca cs da de el es fr he hu it ja lt nl pl pt_BR ro ru sl sr sr@latin sv tr uk zh_CN zh_TW
##
## eg. export LINGUAS="bg ru"
##
#export LINGUAS="ru de" # uncomment to enable

pkgname=easytag-git
_gitname=easytag
pkgver=1565.0e3a7f5
pkgrel=1
pkgdesc="Utility for viewing and editing tags for most audio formats - git version"
arch=('i686' 'x86_64')
license=('GPL')
url='http://projects.gnome.org/easytag/'
depends=('id3lib' 'taglib' 'libid3tag' 'gtk3' 'libvorbis' 'flac' 'speex' 'opusfile' 'wavpack' 'desktop-file-utils')
makedepends=('git' 'intltool' 'appdata-tools')
## depends on building gnome help files
if [ "$_build_gnome_help" = 'yes' ]; then
  echo -e "\n>>>\n>>> Build with GNOME help files\n>>>\n"
  makedepends+=('yelp-tools')
fi

provides=('easytag')
conflicts=('easytag')
install="$pkgname.install"
source=("git://git.gnome.org/easytag")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
#  git describe --always | sed -e 's|-|.|g'
#  git describe --always | sed 's/^easytag.//;s/-/./g'
}

prepare() {
  cd "$_gitname"
  ## remove  'node/directory;' from MimeType
  sed -i 's/inode\/directory;//' data/easytag.desktop.in
  ## disable-gnome-help-files
  if [ "$_build_gnome_help" != 'yes' ]; then
    echo -e "\n>>>\n>>> Build without GNOME help files\n>>>\n"
	sed -i 's@= help po@= po@' Makefile.am
	sed -e'/help\/Makefile/d' -e 's/AC_MSG_ERROR(\[yelp-tools/AC_MSG_WARN([yelp-tools/' -i configure.ac
	rm -fr help/
  fi
  ## add git rev to version
  sed "s/(\[EasyTAG\], \[\([0-9]\).\([0-9]\).\([0-9]\)\], /(\[EasyTAG\], [\1.\2.\3-$pkgver], /" -i configure.ac
  ./autogen.sh
}

build() {
  cd "$_gitname"
  ## avoid breaking the build
  #CFLAGS="$CFLAGS -Wno-error=deprecated-declarations"
  CXXFLAGS="$CXXFLAGS -Wno-error=deprecated-declarations"
  
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
}
