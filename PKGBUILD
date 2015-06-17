#Mantainer: M0Rf30
pkgname=portage-git
pkgver=12988.4c5b4a1
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'xmlto' 'rsync' 'eselect-git')
source=('portage::git://git.overlays.gentoo.org/proj/portage.git')
makedepends=('epydoc' 'git' 'docbook-xsl')
install=$pkgname.install


build() {
  cd portage
  sed 's/ChangeLog//g' -i Makefile
  make PREFIX=/usr
} 

package() {

 PORTDIR=$pkgdir/usr/portage
 DISTDIR=${PORTDIR}/distfiles
 PKGDIR=${PORTDIR}/packages
 RPMDIR=${PORTDIR}/rpm
 GLOBALS=$pkgdir/usr/share/portage/config/make.globals

 mkdir -p $PORTDIR $DISTDIR $PKGDIR $RPMDIR
 
 cd portage
 
 make DESTDIR=$pkgdir install
 
 if [ "$CARCH" = "i686" ] ; then
    sed 's/FCFLAGS/FDFLAGS/g' -i $GLOBALS
    sed 's/CFLAGS=""/CFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"/g' -i $GLOBALS
    sed 's/CXXFLAGS=""/CXXFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"/g' -i $GLOBALS
    sed 's/LDFLAGS=""/LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,--hash-style=gnu"/g' -i $GLOBALS
    sed 's/FDFLAGS/FCFLAGS/g' -i $GLOBALS

 else
    sed 's/FCFLAGS/FDFLAGS/g' -i $GLOBALS
    sed 's/CFLAGS=""/CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"/g' -i $GLOBALS
    sed 's/CXXFLAGS=""/CXXFLAGS="-march=x86-64 -mtune=core2 -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"/g' -i $GLOBALS
    sed 's/LDLAGS=""/LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,--hash-style=gnu"/g' -i $GLOBALS
    sed 's/FDFLAGS/FCFLAGS/g' -i $GLOBALS

 fi
    mkdir -p $pkgdir/etc/portage  
}

pkgver() {
  cd portage
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
