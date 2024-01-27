# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Maintainer:  Eric Berquist <eric.berquist at gmail dot com>
# Contributor: Gao xiang<hughgao01@gmail.com>

pkgname=gamess
pkgver=2023R2
pkgrel=1
pkgdesc="The General Atomic and Molecular Electronic Structure System"
arch=(x86_64)
url="https://www.msg.chem.iastate.edu/gamess/gamess.html"
license=(custom)
depends=(tcsh blas lapack libxc python perl)
makedepends=(python-jinja gcc-fortran)
checkdepends=(inetutils)

# You have to get the package from the official website
# and put into the current directory.
source=(local://gamess-current.tar.gz
        comp.patch
        make.patch)
md5sums=('489a8516c5a597d152b38264f42db519'
         '9b079fc23ac8d054e153bff6f77de68f'
         'a3c47d13c969a1a86c646673128ef187')
sha256sums=('2b7cf4af17fb2eab5bf3609bf820437728cd36d87f44857dce25bafa9e9622ad'
            'd666753d2916107fcddbc8d9a9518f56774e8865e3b9d8e858a93f9277f67e6f'
            '320015bbc221db06520aa842eac79f28c31b67ea434929659bffd70048ab32e5')
install=$pkgname.install

prepare() {
  cd "$srcdir/$pkgname"

  # You may comment out two lines below to let GAMESS choose compiler options.
  patch -p0 < "$srcdir/comp.patch"

  # Fixing compddi
  sed -i "s@set ARCH='-m64'@set ARCH='-march=native'@g" ddi/compddi

  # Shared LIBXC
  sed -i \
    's@$GMS_PATH/3rd-party/lib/libxcf03.a $GMS_PATH/3rd-party/lib/libxc.a@-lxcf03 -lxc@g' \
    lked
  patch -p0 < "$srcdir/make.patch"

  # Blas-agnostic
  sed -i 's/-lopenblas/-lblas -llapack/g' lked

  # Fixing rungms
  sed -i 's@/install.info@./install.info@g' rungms

  # Fixing a functional
  sed -i '/XC_GGA_X_HERMAN/d' source/libxc.src
}

build() {
  cd "$srcdir/$pkgname"
  python bin/create-install-info.py \
    --fortran_version=13.1          \
    --math=openblas                 \
    --mathlib_path=/usr/lib         \
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

  # Fixing rungms after tests
  sed -i '/set GMS_PATH=/c\set GMSPATH=/opt/gamess' rungms
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
