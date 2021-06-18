# Maintainer: Tarn W. Burton <twburton@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=ccl
pkgver=1.12.1
pkgrel=1
pkgdesc="A Common Lisp implementation."
arch=("x86_64")
url="http://ccl.clozure.com"
license=("Apache")
provides=("common-lisp" "ccl")
conflicts=("ccl-bin" "ccl-git")

source=("https://github.com/Clozure/ccl/releases/download/v${pkgver}/ccl-${pkgver}-linuxx86.tar.gz")

sha256sums=('923f2979144e96306cf5124800444e1c5cc0295fa9babb3ffc47a5631344b0aa')

build() {
  cd "$srcdir/$pkgname/lisp-kernel/linuxx8664"
  make clean
  make
  cd ../..
  echo "(ccl:rebuild-ccl :clean t)" | ./lx86cl64 --no-init --quiet --batch
}

package() {
  cd "$srcdir/$pkgname"

  usrdir="$pkgdir/usr"

  libdir="$usrdir/lib/$pkgname"
  install -d $libdir
  cp -a bin/ $libdir/
  cp -a cocoa-ide/ $libdir/
  cp -a compiler/ $libdir/
  cp -a level-0/ $libdir/
  cp -a level-1/ $libdir/
  cp -a lib/ $libdir/
  cp -a library/ $libdir/
  cp -a lisp-kernel/ $libdir/
  cp -a mac-ui/ $libdir/
  cp -a objc-bridge/ $libdir/
  cp -a tools/ $libdir/
  cp -a x86-headers64/ $libdir/
  cp -a xdump/ $libdir/
  cp lx86cl64 $libdir/
  cp lx86cl64.image $libdir/

  exampledir="$usrdir/share/$pkgname"
  install -d $exampledir
  cp -a examples $exampledir

  docdir="$usrdir/share/doc/$pkgname"
  install -d $docdir
  cp -a doc/* $docdir

  bindir="$usrdir/bin"
  install -d $bindir
  cat > "$usrdir/bin/ccl" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/lx86cl64 "\$@"
EOF
  chmod +x "$bindir/ccl"

  find $usrdir -type d -name .svn | xargs rm -rf
  find $libdir -name \*.o -delete
}

