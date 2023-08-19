# Maintainer: Tarn W. Burton <twburton@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

pkgname=ccl
pkgver=1.12.2
pkgrel=2
pkgdesc="A Common Lisp implementation."
arch=("x86_64")
makedepends=("m4")
url="http://ccl.clozure.com"
license=("Apache")
provides=("common-lisp" "ccl")
conflicts=("ccl-bin" "ccl-git")
source=("https://github.com/Clozure/ccl/releases/download/v${pkgver}/ccl-${pkgver}-linuxx86.tar.gz")
sha256sums=('a94fda3daf26ce8c3d08e0db0e6e9907995acc10e0f8aad2125790b93eaa1556')

build() {
  cd "$srcdir/$pkgname/lisp-kernel/linuxx8664"
  make clean
  make
  cd ../..
  echo "(ccl:rebuild-ccl :clean t)" | ./lx86cl64 --no-init --quiet --batch
}

function install_dir() {
  src=$1
  shift
  dest=$1
  shift
  find $src -type f -not -name "*.o" -print | while read path_
  do
    if [ $(type -P "$path_") ] ; then
        mode=755
    else
        mode=644
    fi
    install -TDm $mode "$path_" "${dest}/$(realpath --relative-to=$src $path_)"
  done
}

package() {
  cd "$srcdir/$pkgname"

  usrdir="$pkgdir/usr"
  libdir="$usrdir/lib/ccl"

  install_dir bin "$libdir/bin"
  install_dir cocoa-ide "$libdir/cocoa-ide"
  install_dir compiler "$libdir/compiler"
  install_dir level-0 "$libdir/level-0"
  install_dir level-1 "$libdir/level-1"
  install_dir lib "$libdir/lib"
  install_dir library "$libdir/library"
  install_dir lisp-kernel "$libdir/lisp-kernel"
  install_dir mac-ui "$libdir/mac-ui"
  install_dir objc-bridge "$libdir/objc-bridge"
  install_dir level-1 "$libdir/level-1"
  install_dir tools "$libdir/tools"
  install_dir x86-headers64 "$libdir/x86-headers64"
  install_dir xdump "$libdir/xdump"
  install -Dm 755 -t $libdir lx86cl64
  install -Dm 644 -t $libdir lx86cl64.image
  install_dir examples "$usrdir/share/ccl/examples"
  install_dir doc "$usrdir/share/doc/ccl"

  bindir="$usrdir/bin"
  install -d $bindir
  cat > "$usrdir/bin/ccl" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/lx86cl64 "\$@"
EOF
  chmod +x "$bindir/ccl"
}
