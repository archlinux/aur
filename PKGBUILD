# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase='swift-git'
pkgname=('swift-im-git' 'swiften-git')
pkgver=3.0beta2.r87.gd5f0735
pkgrel=1
arch=('i686' 'x86_64')
url="http://swift.im/"
license=('GPL3')
makedepends=('python2' 'openssl' 'boost' 'qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-x11extras')
source=("git://swift.im/swift")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/swift"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^swift\.//'
}

# Those options need to be consistent between each scons invocation.
_scons_options='qt5=1 max_jobs=1 optimize=1 debug=0 swiften_dll=1 cxxflags="-DBOOST_SIGNALS_NO_DEPRECATION_WARNING=1"'
_directory='swift'

build() {
  cd "$srcdir/$_directory"
  QTDIR=/usr ./scons $_scons_options Swift Swiften
}

package_swift-im-git() {
  pkgdesc='XMPP client written in C++ with Qt and Swiften'
  depends=("swiften-git=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit' 'qt5-x11extras')
  optdepends=('qt5-svg: for SVG avatars')
  provides=('swift-im=3.0')
  conflicts=('swift-im')

  cd "$srcdir/$_directory"
  QTDIR=/usr ./scons $_scons_options SWIFT_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}

package_swiften-git() {
  pkgdesc='XMPP library written in C++ with Boost'
  depends=('boost-libs')
  provides=('swiften=3.0')
  conflicts=('swiften')

  cd "$srcdir/$_directory"
  QTDIR=/usr ./scons $_scons_options SWIFTEN_INSTALLDIR="$pkgdir/usr/" "$pkgdir/usr/"
}
