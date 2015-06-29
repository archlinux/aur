# Maintainer: sumito3478 <sumito3478@gmail.com>
pkgname=s3fuse
pkgver=0.15
pkgrel=1
pkgdesc="FUSE driver for Amazon S3 buckets"
arch=('x86' 'x86_64')
url="http://code.google.com/p/s3fuse/"
license=('Apache')
groups=()
depends=('boost-libs' 'fuse' 'curl' 'libxml2')
makedepends=('subversion' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svnurl=http://s3fuse.googlecode.com/svn/tags/release-$pkgver
_svnmod=s3fuse-release-$pkgver

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ ! -d "$_svnmod" ]; then
    svn co "$_svnurl" --config-dir ./ "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  export WITH_REV=1
  autoreconf --force --install || exit 1
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
