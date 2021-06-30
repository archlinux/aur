# Maintainer: Gao xiang<hughgao01@gmail.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Eric Berquist <eric.berquist at gmail dot com>

pkgname=gamess
pkgver=2020R2
pkgrel=3
pkgdesc="The General Atomic and Molecular Electronic Structure System"
arch=('x86_64')
url="https://www.msg.chem.iastate.edu/gamess/gamess.html"
license=('custom')
depends=('tcsh' 'blas' 'python')
makedepends=('python-jinja' 'gcc-fortran')
checkdepends=('inetutils')
install=${pkgname}.install

# You have to get the package from the official website
# and put into the current directory.
source=("local://gamess-current.tar.gz"
        "opt.patch"
        "tests.patch")
sha256sums=('5eb9242751159b6de244055e1bbb5987e052f913d47ce5eb8a4c6d262361cdc3'
            '4ed0f7c17df595c02a7cc42b777cf64005eb84fedb5b6306936241b20dd523e3'
            '38a14c4d428b54838b55ed19cc9aa6741992c2e7b66a0180994d264de71c6bf2')

prepare() {
  cd "$srcdir/$pkgname"

  patch -p1 < "$srcdir/tests.patch"
  
  # You may comment out two lines below to let GAMESS choose compiler options.
  patch -p1 < "$srcdir/opt.patch"
  echo "Compiler flags '-O3 -march=native -mno-fma' are enabled by default."
  
  # Optimizations can safely be more aggressive.
  sed -i 's/ -fno-aggressive-loop-optimizations//g' comp
  
  # Fixes for GCC Fortran > 9
  sed -i 's/-ffree-line-length-none/-ffree-line-length-none -fallow-argument-mismatch/g' comp
  sed -i 's/-Ofast -ffast-math/-Ofast -ffast-math -fallow-argument-mismatch/g' comp

  # Blas-agnostic
  sed -i 's/-lopenblas/-lblas/g' lked
}

build() {
  cd "$srcdir/$pkgname"
  python bin/create-install-info.py \
                                    --fortran_version=10.2 \
                                    --openblas \
                                    --mathlib_path=/usr/lib \
                                    --openmp
  make modules -j1
  make
}

check() {
  echo "Please, wait for the computation of 47 test examples to finish."
  echo "It is going to take about 5 min depending on your CPU frequency."
  cd "$srcdir/$pkgname"
  
  # Prepare the launch script "rungms" to testing.
  sed -i '/set GMSPATH=/c\set GMSPATH=$PWD' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  mkdir scr
  sed -i '/set USERSCR=/c\set USERSCR=$PWD\/scr' rungms
  
  # Fixing the number of tests
  sed -i 's/47/48/' runall
  
  # Start testing with the use of 1 CPU core.
  ./runall 00
  tests/standard/checktst
  rm -r scr
}

package() {
  cd "$srcdir/$pkgname"
  
  # Fix rungms
  sed -i '/set GMSPATH=/c\set GMSPATH=/opt/gamess' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  sed -i '/set USERSCR=/c\set USERSCR=$HOME\/.gamess' rungms
  
  install -dm755 "$pkgdir/opt/gamess"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 *.x "$pkgdir/opt/gamess"
  install -m755 run* "$pkgdir/opt/gamess"
  install -m755 gms-files.csh "$pkgdir/opt/gamess"
  
  cp -r auxdata tools vb2000 "$pkgdir/opt/gamess"
  
  ln -sf /opt/gamess/rungms "$pkgdir/usr/bin"
}
