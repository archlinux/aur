# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=tau
pkgver=2.23.1
pkgrel=1
pkgdesc="Profiling and tracing toolkit for Fortran, C, C++, Java and Python programs"
arch=('i686' 'x86_64')
url="http://www.cs.uoregon.edu/research/tau/home.php"
license=('custom')
depends=('gcc')
optdepends=('java-runtime: for ParaProf and other GUI utilities')
options=(staticlibs)
source=(http://tau.uoregon.edu/tau.tgz \
        tau.sh)
md5sums=('SKIP'
         '52fa5f1687fe0ad889aa411d1b5b9982')

pkgver() {
  _dirname=`tar --exclude="*/*/*" -tf tau.tgz`
  _dirname=`basename $_dirname`
  echo ${_dirname#*-}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure -LINUXTIMERS -pthread
  make install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _ARCH=$(grep TAU_ARCH= include/Makefile | cut -d'=' -f2)
  _MAKEFILE=`ls $_ARCH/lib/Makefile*`
  _MAKEFILE=`basename "$_MAKEFILE"`

  install -d -m755 "$pkgdir/opt/tau"
  cp -a $_ARCH "$pkgdir/opt/tau"

  # remove all references to "$pkgdir" from text files
  for FILE in "$pkgdir"/opt/tau/$_ARCH/bin/*; do
    if [ `file $FILE | grep -c "text"` -ne 0 ] ; then
      #echo "striping $srcdir/$pkgname-$pkgver from file $FILE"
      sed "s|$srcdir/$pkgname-$pkgver|/opt/tau|g" -i "$FILE"
    fi
  done
  sed -i "s|$srcdir/$pkgname-$pkgver|/opt/tau|g" "$pkgdir/opt/tau/$_ARCH/lib/$_MAKEFILE"

  # move man pages to correct location
  install -d -m755 "$pkgdir/usr/share"
  cp -a "$srcdir/$pkgname-$pkgver/man" "$pkgdir/usr/share"
  # install tau.sh to profile.d and update paths in tau.sh
  install -D -m755 "$srcdir/tau.sh" "$pkgdir/etc/profile.d/tau.sh"
  sed -i "s|_ARCH_|$_ARCH|" "$pkgdir/etc/profile.d/tau.sh"
  sed -i "s|_MAKEFILE_|$_MAKEFILE|" "$pkgdir/etc/profile.d/tau.sh"
  # install license
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix the conflict with gperftools
  mv "$pkgdir/opt/tau/$_ARCH/bin/pprof" "$pkgdir/opt/tau/$_ARCH/bin/pprof.tau"
  mv "$pkgdir/usr/share/man/man1/pprof.1" "$pkgdir/usr/share/man/man1/pprof.tau.1"
}

# vim:set ts=2 sw=2 et:
