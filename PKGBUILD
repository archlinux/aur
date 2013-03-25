#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=lxpolkit-git
pkgver=20130324
pkgrel=1
pkgdesc='A simple PolicyKit authentication agent for LXDE'
arch=('i686' 'x86_64')
url="http://blog.lxde.org/?p=674"
license=('GPL')
groups=('lxde')
provides=('lxpolkit')
conflicts=('lxpolkit')
depends=('gtk2>=2.12.0' 'polkit')
makedepends=('git' 'intltool')
source=('automake-1.12.patch'
	'autogen.patch')
md5sums=('c8855c4c750e8b60a9870fa3ef23fd29'
         'eb74ca8c5346f28fc7978638fabccb50')

_gitroot="git://lxde.git.sourceforge.net/gitroot/lxde/lxpolkit"
_gitname="lxpolkit"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname"
    git checkout -- configure.ac
    git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/${_gitname}"
  
  patch -p1 < ${srcdir}/automake-1.12.patch
  patch -p1 < ${srcdir}/autogen.patch

  ./autogen.sh
  #aclocal
  #automake
  #autoconf
  ./configure --prefix="/usr" --sysconfdir="/etc"
  make
}
package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
}
