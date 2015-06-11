# Maintainer: archlinux at carstenfeuls dot de
pkgname=aprx-svn
pkgver=596
pkgrel=1
pkgdesc="Lightweight APRS digipeater and i-Gate interface"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://wiki.ham.fi/Aprx.en"
license=('custom')
depends=('glibc')
makedepends=('subversion')
backup=('etc/aprx.conf')
source=('http://ham.zmailer.org/oh2mqk/aprx/aprx-2.08.svn593.tar.gz'
        'aprx.service')
sha256sums=('609e1b863e9cdd402aa205a9094328d5973219cff0ebcac5f6e1987ccedf5c6b'
            'd510592068d1ef0e83ef104bb5af82da861d3418cfa6cf3a70be585fec96bb53')

_svntrunk="http://repo.ham.fi/svn/aprx/trunk/"
_svnmod="aprx"


#prepare(){
#  cd "$srcdir"
#  if [ -d $_svnmod/.svn ]; then
#    (cd $_svnmod && svn up -r $pkgver)
#  else
#    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
#  fi
#
#  msg "SVN checkout done or server timeout"
#  msg "Starting make..."
#
#  rm -rf "$srcdir/$_svnmod-build"
#  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
#}

build() {
# For a small memory system without writeable /tmp add --with-embedded   
#  cd "$srcdir/$_svnmod-build"
   cd "aprx-2.08.svn593"
  ./configure --prefix=/usr 
  make
}

package() {
 # cd "$srcdir/$_svnmod-build"
  cd "aprx-2.08.svn593"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/" install
  cp ${srcdir}/aprx.service ${pkgdir}/usr/lib/systemd/system
  mkdir -p "${pkgdir}/usr/bin"
  mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin
  rmdir ${pkgdir}/sbin
}
