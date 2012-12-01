# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit-svn
pkgver=136302
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'elementary<1.8' 'enchant' 'gstreamer0.10-base'
         'gperf' 'libtiff' 'libsoup' 'libxslt' 'libxt' 'sqlite3')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby')

_svntrunk=https://svn.webkit.org/repository/webkit/trunk
_svnmod=Webkit

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --depth immediates --config-dir ./ -r "$pkgver" "$_svnmod"
    cd "$_svnmod"
    svn up --set-depth infinity Source -r "$pkgver"
    svn up --set-depth infinity Tools -r "$pkgver"
    svn up --set-depth infinity WebKit.xcworkspace -r "$pkgver"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake "$srcdir/$_svnmod-build" \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DPORT=Efl \
	-DSHARED_CORE=OFF \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 "$srcdir/$_svnmod-build/Source/WebCore/LICENCE-APPLE" \
  	"$pkgdir/usr/share/licenses/$pkgname/LICENSE-APPLE"

  install -Dm644 "$srcdir/$_svnmod-build/Source/WebCore/LICENCE-LGPL-2" \
  	"$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL-2"

  rm -r "$srcdir/$_svnmod-build"
}
