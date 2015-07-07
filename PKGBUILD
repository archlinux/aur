pkgname=vorbis-tools-svn
pkgver=LATEST
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Extra tools for Ogg-Vorbis"
url="http://www.xiph.org/vorbis"
license=('GPL2')
depends=('libao>=1.0.0' 'libvorbis' 'curl>=7.16.2')
makedepends=('subversion')
provides=('vorbis-tools=1.4.0')
conflicts=('vorbis-tools')

_svntrunk=http://svn.xiph.org/trunk/vorbis-tools
_svnmod=vorbis-tools

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh --prefix=/usr --without-speex --without-flac --without-kate
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  rm -rf "$srcdir/$_svnmod-build"
}

