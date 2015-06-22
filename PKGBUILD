# Contributor: Karapetov Alexey <karapetov at gmail dot com>
# Contributor: Lobtsov Alexander <alex at lobtsov dot com>
pkgname=sphinx-svn
pkgver=5125
pkgrel=1
pkgdesc="Free open-source SQL full-text search engine (SVN version, with libsphinxclient, with systemd support)"
arch=(i686 x86_64)
url="http://www.sphinxsearch.com"
license=('GPL')
depends=('libmysqlclient')
makedepends=(
    'subversion'
    'fakeroot'
)

provides=("sphinx")
conflicts=("sphinx")

# https://bbs.archlinux.org/viewtopic.php?id=77214
options=('!makeflags')

_svntrunk=http://sphinxsearch.googlecode.com/svn/trunk
_svnmod=sphinx

source=(
    'sphinx.service'
)

sha256sums=('847218ba5cd0b8f5a3b0d851352ffca1085229bfdf2779cbe2eff5e5eef99351')

package() {
  cd "$srcdir"

  msg "SVN co/up..."

  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "...done or server timeout"
  msg "Cleaning dirs..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/$_svnmod-build"
  msg "Starting sphinx make..."

  ./configure --prefix=/usr \
  --exec-prefix=/usr \
  --program-prefix=sphinx- \
  --localstatedir=/var/lib/sphinx \
  --sysconfdir=/etc/sphinx \
  --enable-id64
  make || return 1
  make DESTDIR=${pkgdir} -j4 install || return 1

  cd "$srcdir/$_svnmod-build/api/libsphinxclient"
  msg "Starting libsphinxclient make..."

  sed -i 's/\/lib\/cpp/\/usr\/bin\/cpp/g' ./configure

  ./configure --prefix=/usr \
  --exec-prefix=/usr \
  --program-prefix=sphinx- \
  --localstatedir=/var/lib/sphinx \
  --sysconfdir=/etc/sphinx \
  --enable-id64
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  msg "Install service file..."

  install -Dm644 "${srcdir}/sphinx.service" "${pkgdir}/usr/lib/systemd/system/sphinx.service"
}
