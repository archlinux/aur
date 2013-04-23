# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-net-dbus-git
_pkgname=perl-net-dbus
pkgver=20130423
_pkgver=1.0.0
pkgrel=1
pkgdesc="Binding for DBus messaging protocol"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Net-DBus"
license=('GPL' 'PerlArtistic')
depends=('dbus' 'perl-xml-twig')
options=('!emptydirs')
replaces=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")
provides=("$_pkgname=$_pkgver")

_gitname="net-dbus"
_gitroot="git://gitorious.org/$_gitname/$_gitname.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd  "$srcdir/$_gitname-build"
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
