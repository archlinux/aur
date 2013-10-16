#Contributor: Zephyr
_pkgbasename=oxygen-gtk-git
pkgname=lib32-${_pkgbasename}
pkgver=20111118
pkgrel=1
pkgdesc="Port of the Oxygen theme to gtk"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('lib32-gtk2' "${_pkgbasename}" "lib32-dbus-glib")
makedepends=('git' 'cmake' 'gcc-multilib')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/oxygen-gtk"
_gitname="oxygen-gtk"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
	-DINSTALL_PATH_GTK_ENGINES=/usr/lib32/gtk-2.0/2.10.0/engines \
        ../${_gitname}
  make
  make DESTDIR=$pkgdir install
  rm -rf ${pkgdir}/usr/share

  rm -rf "$srcdir/$_gitname-build"
}
