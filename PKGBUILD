# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Maintainer:  Eric Berquist <eric.berquist at gmail dot com>
# Contributor: Gao xiang<hughgao01@gmail.com>

pkgname=gamess
pkgver=2021R2.1
pkgrel=1
pkgdesc="The General Atomic and Molecular Electronic Structure System"
arch=('x86_64')
url="https://www.msg.chem.iastate.edu/gamess/gamess.html"
license=('custom')
depends=('tcsh' 'blas' 'python' 'libxc' 'perl')
makedepends=('python-jinja' 'gcc-fortran')
checkdepends=('inetutils')
install=$pkgname.install

# You have to get the package from the official website
# and put into the current directory.
source=("local://gamess-current.tar.gz"
        "comp.patch")
sha256sums=('36a07e3567eec3b804fca41022b45588645215ccf4557d5176fb69d473b9521c'
            '4960b568cfbcc1dce65fe0c1b67973362fed3f59aa1c9223ef1b6453bae35990')

prepare() {
  cd "$srcdir/$pkgname"

  # You may comment out two lines below to let GAMESS choose compiler options.
  patch -p1 < "$srcdir/comp.patch"
  echo "Compiler flags '-O3 -march=native -mno-fma' are enabled by default."

  # Shared LIBXC
  sed -i 's@$GMS_PATH/libxc_lib/lib/libxcf03.a $GMS_PATH/libxc_lib/lib/libxc.a@-lxcf03 -lxc@g' lked

  # Blas-agnostic
  sed -i 's/-lopenblas/-lblas/g' lked
}

build() {
  cd "$srcdir/$pkgname"
  python bin/create-install-info.py \
                                    --fortran_version=11.1 \
                                    --math=openblas \
                                    --mathlib_path=/usr/lib \
                                    --openmp \
                                    --libxc
  # Fixing the result of the configuring script
  sed -i 's/openblas/openblas-so/' install.info
  make modules -j1
  make
}

check() {
  echo "Please, wait for the computation of 48 test examples to finish."
  echo "It is going to take about 5 min depending on your CPU frequency."
  cd "$srcdir/$pkgname"

  # Prepare the launch script "rungms" to testing.
  sed -i '/set GMSPATH=/c\set GMSPATH=$PWD' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  mkdir scr
  sed -i '/set USERSCR=/c\set USERSCR=$PWD\/scr' rungms

  # Fixing the number of tests
  sed -i 's/47/48/' runall

  # Fixing 43rd test
  sed -i '/dirscf=.true./d' tests/standard/exam43.inp

  # Start testing with the use of 1 CPU core.
  ./runall 00
  tests/standard/checktst
  rm -r scr
}

package() {
  cd "$srcdir/$pkgname"

  # Fixing rungms
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
