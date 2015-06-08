# Contributor: erm67

pkgname=projectx-cvs
pkgver=0.91.0.10.r20110331
pkgrel=1
pkgdesc="DVB demux tool for repairing and analyzing different stream types"
url="http://sourceforge.net/projects/project-x"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('cvs' 'java-environment' 'apache-ant')
depends=('java-environment' 'glibc' 'bash')
provides=('projectx')
conflicts=('projectx')
source=(projectx
	http://sourceforge.net/p/project-x/patches/_discuss/thread/9f638374/33d2/attachment/pjxgcc.tar.bz2)
md5sums=('d2c2582e21fae4a7c99ce26589800eab'
         'bb3e5d77a9ccc7a3fc86f9243d82c624')
noextract=('pjxgcc.tar.bz2')
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
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
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
  rm -r c_src
  bsdtar -xjf ${srcdir}/pjxgcc.tar.bz2

  mv htmls resources
  mv ReadMe.txt resources
  echo "CVS version "$pkgver >resources/ReleaseNotes.txt
  sed -i 's,^Exec=.*,Exec=projectx,' projectx.desktop
  
  ant
  cd c_src/idct_gcc
  find . -name "*.o" -exec rm {} \;
  sed -i '5,28d' Makefile

  CFLAGS+=" -fPIC -I/usr/lib/jvm/$(archlinux-java get)/include -I/usr/lib/jvm/$(archlinux-java get)/include/linux" make
}
package() {
  cd ${srcdir}/$_cvsmod-build
  install -D -m0755 $srcdir/projectx $pkgdir/usr/bin/projectx
  install -D -m0644 projectx.jar $pkgdir/usr/share/java/projectx/projectx.jar
  install -D -m0644 lib/libidctgcc.so \
          $pkgdir/usr/lib/projectx/libidctgcc.so
  install -D -m0644 lib/commons-net-1.3.0.jar \
          $pkgdir/usr/share/java/projectx/lib/commons-net-1.3.0.jar
  install -D -m0644 lib/jakarta-oro-2.0.8.jar \
          $pkgdir/usr/share/java/projectx/lib/jakarta-oro-2.0.8.jar
  install -D -m0644 projectx.desktop $pkgdir/usr/share/applications/projectx.desktop
}
