# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Predrag Radovic <predrg@gmail.com>

pkgname=crtmpserver-svn
pkgdesc="high performance streaming server"
arch=(i686 x86_64)
pkgrel=2
url="http://www.rtmpd.com/"
license=('GPL')
depends=('openssl')
makedepends=('subversion' 'cmake')
provides=('crtmpserver')
conflicts=('crtmpserver')
pkgver=811

build() {
  cd "$srcdir"
  
  # svn crud
  msg "Starting SVN checkout"

  if [ -d ${pkgname#-svn}/.svn ]; then
    (cd ${pkgname#-svn} && svn up --non-interactive --no-auth-cache --username anonymous --password "")
  else
    svn co --non-interactive --no-auth-cache --username anonymous --password "" 'https://svn.rtmpd.com/crtmpserver/trunk' --config-dir ./ ${pkgname#-svn}
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing sources..."

  if [ -d $srcdir/${pkgname#-svn}-build ] ; then
    rm -rf "$srcdir/${pkgname#-svn}-build"
  fi
  cp -r "$srcdir/${pkgname#-svn}" "$srcdir/${pkgname#-svn}-build"
  cd "$srcdir/${pkgname#-svn}-build"

  # build
  cd builders/cmake
  cmake -DCRTMPSERVER_INSTALL_PREFIX=/usr
  make

}

package(){
  cd "$srcdir/${pkgname#-svn}-build"/builders/cmake
  mv $pkgdir/usr/{sbin,bin}
  make DESTDIR="$pkgdir" install
}
