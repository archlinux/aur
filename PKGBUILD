# Contributor: Various

_pkgname=aria2
pkgname=aria2-git
pkgver=1.16.4.30.gb292ae1
pkgrel=1
epoch=1
pkgdesc="Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink"
arch=('i686' 'x86_64')
url="http://aria2.sourceforge.net/"
license=('GPL')
depends=('gnutls' 'libxml2' 'sqlite3' 'c-ares' 'ca-certificates')
makedepends=('git' 'cppunit' 'python-sphinx')
provides=('aria2')
conflicts=('aria2' 'aria2-daemon-svn')
source=('git://github.com/tatsuhiro-t/aria2.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|release.||'
}

build(){
  cd $srcdir/$_pkgname

  autoreconf -i
  ./configure --prefix=/usr --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR=${pkgdir} install

  # add bash completion (aria2 automatically installs to a temporary target directory)
  install -d ${pkgdir}/usr/share/bash-completion/completions
  install -m644 ${pkgdir}/usr/share/doc/aria2/bash_completion/aria2c \
    ${pkgdir}/usr/share/bash-completion/completions
  rm -rf ${pkgdir}/usr/share/doc/aria2/bash_completion
} 

