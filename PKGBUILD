# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=ccl
pkgver=1.12
pkgrel=1
pkgdesc="A Common Lisp implementation."
arch=("x86_64")
url="http://ccl.clozure.com"
license=("Apache")
provides=("common-lisp" "ccl")
conflicts=("ccl-bin" "ccl-git")

source=("https://github.com/Clozure/ccl/releases/download/v${pkgver}/ccl-${pkgver}-linuxx86.tar.gz"
        "0001.patch"
        "0002.patch"
        "0003.patch"
        "0004.patch")

sha256sums=('84a95aaf1d1abafba586e9ff079343b04fe374b98b38ed24d830f1fb7ed4ab34'
            '173f5ce2b7f72ea4b91b798d812d851d4d240e2e470d0942235cf5908d8555ec'
            '65deb1b12ceb15dad11a5db9f1e3f83ebb2db99820cf93da63765bd7c5fddf86'
            '3032b1bc0516318fc030588c2bfde017dff8493d064985be2546ac723035e1d6'
            '688d33fb905ed96761f73f65181027c1d00dfc6e0e9c086b3520bbd3c1c3eb19')

prepare() {
  cd "$pkgname"
  patch --forward --strip=1 --input="${srcdir}/0001.patch"
  patch --forward --strip=1 --input="${srcdir}/0002.patch"
  patch --forward --strip=1 --input="${srcdir}/0003.patch"
  patch --forward --strip=1 --input="${srcdir}/0004.patch"
}

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

