# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# "Plagiarized" from
# https://slackbuilds.org/slackbuilds/14.2/libraries/pgtcl-ng/
# https://pkgsrc.se/databases/pgtclng

pkgname=pgtcl-ng
pkgver=r394
_truncname="pgtclng-code-$pkgver-trunk"
pkgrel=1
pkgdesc="PostgreSQL Tcl Next-Generation"
arch=("x86_64")
url="http://pgtclng.sourceforge.net/"
license=("unknown")
makedepends=("docbook-xsl" "links")
depends=("postgresql" "postgresql-libs" "tcl>=8.6" "tcl<8.7")
conflicts=("pgtcl")
provides=("pgtcl" "libpgtcl")
source=("$_truncname.zip::https://sourceforge.net/code-snapshots/svn/p/pg/pgtclng/code/$_truncname.zip")
sha1sums=("f8aa4c0d5c478dced25d59353a9370cc2a2e35b5")

build() {

  # https://stackoverflow.com/questions/2615002/how-to-generate-pdf-from-docbook-5-0
  # http://www.sagehill.net/presentations/DocBook4Tutorial/DocBook4Tutorial.pdf
  cd "$srcdir/$_truncname/doc"
  make
  make INSTALL

  # https://sourceforge.net/p/tcl/mailman/message/17760659/
  # No, you don't need the --enable-64bit switch on AMD x86_64 linux

  # file:///home/darren/.cache/yay/pgtcl-ng/pgtclng-code-r394-trunk/doc/INSTALL.html

  cd "$srcdir/$_truncname/src"
  autoreconf
  # /usr/lib/tclConfig.sh
  ./configure \
    --prefix=/usr \
    --with-tcl=/usr/lib/ \
    --with-tclinclude=/usr/include/ \
    --with-postgres-include=/usr/include/postgresql \
    --with-postgres-lib=/usr/lib/postgresql \
    --enable-shared
  make

}

# Test HammerDB w/ pgtcl make'd but not installed
# https://wiki.tcl-lang.org/page/auto_path
# https://wiki.tcl-lang.org/page/TCLLIBPATH
# export LD_LIBRARY_PATH="/home/darren/.cache/yay/pgtcl-ng/pkg/usr/lib"
# export      TCLLIBPATH="/home/darren/.cache/yay/pgtcl-ng/pkg/usr/lib"

package() {

  # mkdir /home/darren/.cache/yay/pgtcl-ng/pkg
  # pkgdir=/home/darren/.cache/yay/pgtcl-ng/pkg
  # pkgname=pgtcl-ng

  # git status -s | rev | sort | rev
  cd "$srcdir/$_truncname/doc"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 \
    *.html \
    version.xml \
    INSTALL \
    "$pkgdir/usr/share/doc/$pkgname"

  cd "$srcdir/$_truncname/src"
  make DESTDIR="$pkgdir" install
  rmdir "$pkgdir/usr/bin" || exit 1

}
