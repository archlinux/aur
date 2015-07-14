# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgname=hunspell-smj
pkgver=1.0beta9.20110318
pkgrel=1
pkgdesc="Lule Sámi / Julevsámegiella (smj) dictionary for Hunspell"
arch=('i686' 'x86_64')
url="http://www.divvun.no/en/userdocs/X-spell/install_linux.html"
license=('GPL')
depends=('hunspell')
# Can't find a static link to the file of this pkgver, so this PKGBUILD might eventually need changes
source=(http://divvun.no/static_files/hunspell-smi.tar.gz)
md5sums=('0e568da241f65dbe2771c2b314aae319')

build() {
  cd $srcdir/hunspell-smi-$pkgver/
  make -f Makefile.smi || return 1
  make DESTDIR=$startdir/pkg -f Makefile.smi install || return 1

  # Ensure that LibreOffice finds them:
  mkdir -p $startdir/pkg/usr/share/hunspell
  ln -s $startdir/pkg/usr/share/myspell/dicts/smj{,_NO,_SE}.{dic,aff} $startdir/pkg/usr/share/hunspell/

  # Remove the dictionaries we don't need (separate packages for them):
  rm -f $startdir/pkg/usr/share/myspell/dicts/se{,_NO,_SE,_FI}.{dic,aff}
  rm -f $startdir/pkg/usr/share/myspell/dicts/sma{,_NO,_SE}.{dic,aff}

  # I believe dictionary.lst should be a user-configurable file, in
  # any case it would get overwritten if new packages wanted to do the
  # same thing, and the dictionaries seems to work without this:
  rm -f $startdir/pkg/usr/share/myspell/dicts/dictionary.lst
}
