# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>
pkgname='mod_spnego-git'
_pkgname=mod_spnego
pkgver=20120124
pkgrel=5
pkgdesc="HTTP Negotiate\Kerberos support for apache2."
arch=('i386' 'x86_64')
url="https://github.com/lha/mod_spnego"
license=('Open source')
depends=('apache>=2.0' 'heimdal')
provides=('mod_spnego')
optdepends=()
makedepends=('git')
install=mod_spnego-git.install

_gitroot="https://github.com/lha/mod_spnego.git"
_gitname="mod_spnego"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  msg ""

  msg "Starting make..."
  make || return 1
}

package() {
  mkdir -p $startdir/pkg/usr/lib/httpd/modules
  mkdir -p $startdir/pkg/usr/share/doc/$pkgname/
  install -m 755 $srcdir/$_gitname/.libs/$_gitname.so $startdir/pkg/usr/lib/httpd/modules || return 1
  install -m 644 $srcdir/$_gitname/README $startdir/pkg/usr/share/doc/$pkgname/ || return 1
}
