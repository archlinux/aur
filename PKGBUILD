# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=norsk-ordbog  
pkgver=1
pkgrel=1 
pkgdesc="CLI dictionary lookup for 'Norsk Ordbog med dansk Forklaring, by Ivar Aaasen (1873)'"
url="http://huftis.org/artiklar/norsk-ordbog-i-terminalen/"
arch=('i686' 'x86_64')
license=('unknown') # The dictionary itself should be public domain by now, scripts most likely GPL considering the programmers track record
depends=()
makedepends=('tidyhtml' 'unoconv')
conflicts=()
replaces=()
backup=()
install=
source=("http://huftis.org/nedlasting/program/konverter-$pkgname.sh"
        "http://www.aasentunet.no/download.asp?object_id=C7B10D366BB84147B69F58ED0ABF21A4.zip"
	"http://huftis.org/nedlasting/program/$pkgname.sh"
	"http://huftis.org/nedlasting/program/forkortingar.dat")
md5sums=('4da738e5a6bfc67f9bb5108f395f2e3d'
         '97bf4bacada91e909416b91bc252b559'
         '1af84169c67fb742ee99371b3627d909'
         'c8c95d3e3d4c755b6125c8a6e1960903')
build() {
  cd $startdir/src

  # make:
  unoconv --timeout=90 -f html 1873-ordbok.doc || return 1
  # Increase the timeout if it doesn't (eventually) convert!
  sh konverter-$pkgname.sh || return 1
  sed -i'.tmp' 's%^mappe="$(dirname "$0")"%mappe="$(dirname "$0")/../share/dict/norsk-ordbog"%' $pkgname.sh
  chmod +x $pkgname.sh

  # make install:
  mkdir -p $startdir/pkg/usr/bin
  cp $pkgname.sh $startdir/pkg/usr/bin/$pkgname
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/dict/$pkgname
  cp $pkgname.dat forkortingar.dat $startdir/pkg/usr/share/dict/$pkgname
}