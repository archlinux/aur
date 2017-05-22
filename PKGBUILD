# Maintainer: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>
pkgname=tinyos-tools
pkgver=1.4.2
pkgrel=1
pkgdesc="Development-tools for TinyOS"
arch=('i686' 'x86_64')
license=('GPL')
options=(!libtool)
url="http://www.tinyos.net/"
depends=('python2' 'perl' 'bash' 'nesc' 'java-runtime' 'tinyos')
makedepends=('which')
source=("http://tinyos.stanford.edu/tinyos/dists/source/${pkgname}-${pkgver}.tar.gz" 
				"new-pacman-not-symlink-but-realpath.patch")
md5sums=('8dddae18128ce26258090c01cea46c0b' 
	 			 'a30efc6f2215e6b0878b7c4ecfca501e')



prepare() {
	cd $srcdir/$pkgname-$pkgver
	patch -p0 -i "${srcdir}/new-pacman-not-symlink-but-realpath.patch"
}


build() {
  #don't build the libraries for both architecture
  if [ "${CARCH}" == "x86_64" ]; then
    sed -i 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-64."/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  else
    sed -i 's/JNIVERSIONS="-32. -64."/JNIVERSIONS="-32."/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  fi

  #change python to python2 where needed
  sed -i 's/ python/ python2/' ${srcdir}/${pkgname}-${pkgver}/tools/configure.ac
  #this is not needed anymore, but I leave it as a comment. someone might forget about @pathpython@ again
#   for pyfile in `grep -ld recurse '#!.*[/, ]python' *`
#   do
#     sed -i 's/#!.*python/#!\/usr\/bin\/env python2/' $pyfile
#   done
 
  #setting up tinyos variables if needed
  if [ "${TOSDIR}" == "" ]; then
    if [ -f /etc/profile.d/tinyos.sh ]; then
      source /etc/profile.d/tinyos.sh
    fi
  fi

  #AM_CONFIG_HEADER is obsolate
  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/ `find | grep configure.in`
 
  cd ${srcdir}/${pkgname}-${pkgver}/tools/
  ./Bootstrap
  cd ${srcdir}/${pkgname}-${pkgver}/tools
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/tools
  make DESTDIR="${pkgdir}/" install
  
  
  jni=${pkgdir}`/${pkgdir}/usr/bin/tos-locate-jre --jni`
  if [ $? -eq 0 ]; then
    if [ "${CARCH}" = "x86_64" ]; then
      bits=64
    else
      bits=32
    fi
    echo "Installing $bits-bit Java JNI code in $jni ... "
    for lib in ${pkgdir}/usr/lib/tinyos/*.so; do 
      realname=`basename $lib | sed -e s/-$bits\.so/.so/`
      install -D $lib "$jni/$realname" || exit 1
    done
    echo "done."
  fi
}
