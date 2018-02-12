# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=ccl
pkgver=1.11.5
pkgrel=2
pkgdesc="A Common Lisp implementation."
arch=("x86_64")
url="http://ccl.clozure.com"
license=("Apache")
provides=("ccl")
source=("https://github.com/Clozure/ccl/releases/download/v$pkgver/$pkgname-$pkgver-linuxx86.tar.gz")
sha256sums=("b80850d8d6ca8662499975f1cd76bf51affdd29e2025796ddcff6576fe704143")

build() {
  cd "$srcdir/$pkgname"
  echo "(ccl:rebuild-ccl :full t)" | ./lx86cl64 --no-init --quiet --batch
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
