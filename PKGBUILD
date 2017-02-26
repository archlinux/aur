# Maintainer: alex korobtsov <korobcoff@gmail.com>
# Maintainer: Alexander Bantyev <balsoft@yandex.ru>
pkgname=qomp
pkgver=0.7.5
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player"
arch=('i686' 'x86_64')
url="http://qomp.sourceforge.net/"
license=('GPL2')
depends=( 'taglib' 'qt5-base' 'qt5-tools' 'qt5-multimedia'
'qt5-xmlpatterns' 'gstreamer0.10-bad-plugins'
'gstreamer0.10-base-plugins' 'gstreamer0.10-ffmpeg'
'gstreamer0.10-good-plugins' 'gstreamer0.10-ugly-plugins' )
makedepends=('git' 'make' 'cmake' 'libcue')
source=(git+https://github.com/qomp/qomp)
md5sums=('SKIP') 

pkgver() {
  cd qomp
 git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

_gitroot=https://github.com/qomp/
_gitname=qomp
_plugins="filesystemplugin;urlplugin;prostopleerplugin;myzukaruplugin;yandexmusicplugin;lastfmplugin;tunetofileplugin;mprisplugin;notificationsplugin"
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
  cd "$srcdir/$_gitname-build/"
  git submodule init
  git submodule update
  
  # BUILD HERE
  
cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
	-DUSE_QT5=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_PLUGINS=${_plugins}

make
}

package() {
  cd "$srcdir/$_gitname-build/"
  make DESTDIR="$pkgdir/"  install

}

