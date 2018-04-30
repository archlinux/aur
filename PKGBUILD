# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
pkgname=msva-perl-git
pkgver=20110926
pkgrel=1
pkgdesc="Perl Monkeysphere Validation Agent"
arch=(i686 x86_64)
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=(monkeysphere gtk2-perl perl-http-server-simple perl-regexp-common perl-json perl-gnupg-interface perl-any-moose perl-net-server perl-convert-asn1 perl-crypt-x509 perl-file-homedir perl-config-general)
makedepends=('git')
provides=(msva-pearl monkeysphere-validation-agent)
conflicts=(msva-perl)

_gitroot="git://git.monkeysphere.info/msva-perl"
_gitname="msva-perl"

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  }

build() {
  cd "$srcdir/$_gitname-build"

  make || return 1
  }

  package() {
  install -m 755 -D msva-perl $pkgdir/usr/bin/msva-perl
  install -m 644 -D msva-perl.1 $pkgdir/usr/share/man/man1/msva-perl.1
  install -m 755 -d $pkgdir/usr/share/perl5/vendor_perl/
  cp -R {Net,Crypt} $pkgdir/usr/share/perl5/vendor_perl/
} 
