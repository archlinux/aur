# Maintainer:  Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.32
pkgrel=1
pkgdesc="Tool to regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout."
arch=('i686' 'x86_64')
url="http://joeyh.name/code/pristine-tar/"
license=('GPL')
depends=('perl' 'xdelta')
conflicts=('pristine-tar-git')
source=(http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.tar.gz
        0002-Use-posix-tar-format-by-default.patch
        0003-Mangle-PAX-headers-when-using-posix-tar-format.patch
        0004-Remove-all-timestamps-from-extended-PAX-headers.patch
        0010-workaround-for-some-broken-pristine-tar-branche.patch)
sha256sums=('1df928c89fa3adb72ac1fcbc28253b392a7692b6f5a77c2855933253a4598d57'
            'a41617db19c85b18b9b157b2cb3e523f5484472b434cc9f69717499e268e7fcf'
            'c8848744d934eebe9d672f92f57b05929edc13f608835c7da367479ce1bdd992'
            'a6ddb2602d536fa1f4a2e6f748ad8bac2aa49d8f533e3b5993f2f77716bcdb73'
            'b7a3713c327fd68e49818ad38d5f550870095eebd094a5bd85dd59e815fde9a1')

prepare() {
  cd "$srcdir/$pkgname"

  # three patches used in the Tizen tools package (improvements for POSIX tar support)
  patch -Np1 -i "$srcdir"/0002-Use-posix-tar-format-by-default.patch
  patch -Np1 -i "$srcdir"/0003-Mangle-PAX-headers-when-using-posix-tar-format.patch
  patch -Np1 -i "$srcdir"/0004-Remove-all-timestamps-from-extended-PAX-headers.patch

  # extra patch for Tizen compat
  patch -Np1 -i "$srcdir"/0010-workaround-for-some-broken-pristine-tar-branche.patch
}

build() {
  cd "$srcdir/$pkgname"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$pkgname"

  make install DESTDIR=$pkgdir PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d $pkgdir/usr/share/doc/pristine-tar
  install -D GPL TODO delta-format.txt $pkgdir/usr/share/doc/pristine-tar
}

# vim:set ts=2 sw=2 et:
