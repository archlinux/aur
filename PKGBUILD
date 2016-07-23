# Maintainer: Olaf Bauer <hydro@freenet.de>
# Contributor: erm67

pkgname=projectx-cvs
pkgver=0.91.0.10.r20110331
pkgrel=2
pkgdesc="DVB demux tool for repairing and analyzing different stream types"
url="http://sourceforge.net/projects/project-x"
arch=('any')
license=('GPL')
makedepends=('cvs' 'java-environment')
depends=('java-environment' 'bash')
provides=('projectx')
conflicts=('projectx')
source=(projectx)
md5sums=('d2c2582e21fae4a7c99ce26589800eab')
options=('!makeflags')

_cvsroot=":pserver:anonymous@project-x.cvs.sourceforge.net:/cvsroot/project-x"
_cvsmod="Project-X"

prepare() {
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -f $_cvsmod
    cd $_cvsmod
  fi
  cd ..
  [[ -d $_cvsmod-build ]] && rm -r $_cvsmod-build
  cp -r $_cvsmod $_cvsmod-build
}

build() {
  cd ${srcdir}/
  
  cp -r ${srcdir}/$_cvsmod ${srcdir}/$_cvsmod-build
  cd ${srcdir}/$_cvsmod-build

  sed -i 's,^Exec=.*,Exec=projectx,' projectx.desktop

  chmod +x build.sh && ./build.sh

}

package() {
  cd ${srcdir}/$_cvsmod-build
  install -D -m0755 $srcdir/projectx $pkgdir/usr/bin/projectx
  install -D -m0644 ProjectX.jar $pkgdir/usr/share/java/projectx/projectx.jar
  install -D -m0644 lib/commons-net-1.3.0.jar \
          $pkgdir/usr/share/java/projectx/lib/commons-net-1.3.0.jar
  install -D -m0644 lib/jakarta-oro-2.0.8.jar \
          $pkgdir/usr/share/java/projectx/lib/jakarta-oro-2.0.8.jar
  install -D -m0644 projectx.desktop $pkgdir/usr/share/applications/projectx.desktop
}
