# Maintainer: Gao xiang<hughgao01@gmail.com>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>

pkgname=gamess
pkgver=2019R1
pkgrel=1
pkgdesc="The General Atomic and Molecular Electronic Structure System"
arch=('x86_64')
url="http://www.msg.ameslab.gov/GAMESS/GAMESS.html"
license=('custom')
depends=('tcsh' 'openblas-lapack' 'python')
makedepends=('python-jinja')
install=${pkgname}.install

# You have to get the package from the official website
# and put into the current directory.
source=("local://gamess-current.tar.gz"
        "opt.patch")
sha256sums=('2faabb66a61323249e66a993b65c5c237058d7c5d9bca4de49b3ad680b2006a6'
            '145c0f1624db736e0d587ec896151a8b33d11d4fe4c6a429c824cdbfe83db4c3')

prepare() {
  cd $srcdir/$pkgname
  
  # You may comment out two lines below to let GAMESS choose compiler options.
  patch -p1 < $srcdir/opt.patch
  msg2 "Compiler options '-O3 -march=native -mno-fma' are enabled by default."
  
  # Uncomment the following line out to use external LAPACK. May be unsafe.
  #sed -i "s/dgeev.o dgesvd.o zheev.o//g" lked
}

build() {
  cd $srcdir/$pkgname
  python bin/create-install-info.py \
                                    --fortran_version=8.2 \
                                    --math=openblas \
                                    --mathlib_path=/usr/lib
  # Unfortunately, parallel build was broken in 2019R1.
  make -j1
}

check() {
  msg2 "Please, wait for the computation of 47 test examples to end."
  msg2 "It is going to take about 5 min depending on your CPU frequency."
  cd $srcdir/$pkgname
  
  # Prepare the launch script "rungms" to testing.
  sed -i '/set GMSPATH=/c\set GMSPATH=$PWD' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  mkdir scr
  sed -i '/set USERSCR=/c\set USERSCR=$PWD\/scr' rungms
  
  # Start testing on 1 CPU core.
  ./runall 00
  tests/standard/checktst
  rm -r scr
}

package() {
  cd $srcdir/$pkgname
  
  # Fix rungms
  sed -i '/set GMSPATH=/c\set GMSPATH=/opt/gamess' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  sed -i '/set USERSCR=/c\set USERSCR=$HOME\/.gamess' rungms
  
  install -dm755 $pkgdir/opt/gamess
  install -dm755 $pkgdir/usr/bin
  install -m755 *.x $pkgdir/opt/gamess
  install -m755 run* $pkgdir/opt/gamess
  install -m755 *.DOC $pkgdir/opt/gamess
  install -m755 gms-files.csh $pkgdir/opt/gamess
  
  cp -r auxdata machines qmnuc tests tools vb2000 $pkgdir/opt/gamess
  
  ln -sf $pkgdir/opt/gamess/rungms $pkgdir/usr/bin
}
