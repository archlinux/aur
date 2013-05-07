# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=libnotify-id-git
pkgver=20130129
pkgrel=1
pkgdesc="Gnome notification library, including ID patch"
arch=('i686' 'x86_64')
license=('GPL2.1')
url="http://library.gnome.org/devel/libnotify/"
depends=()
makedepends=('pkgconfig' 'git' 'gobject-introspection' 'gtk-doc' 'gnome-common-git')
options=('!libtool')
conflicts=('libnotify' 'libnotify-git')
provides=('libnotify=0.7.5')
source=('https://launchpadlibrarian.net/105791133/print-and-replace-id-v3.patch')
md5sums=('f75d23de7ee23e37ac36889ece359587')

_gitroot="git://git.gnome.org/libnotify.git"
_gitname="libnotify"


build() {
  cd ${srcdir}
  msg "Connecting to git.gnome.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot
  fi

  cd ${srcdir}/$_gitname
  patch -p1 < ../../print-and-replace-id-v3.patch
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
