# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=nwchem
pkgver=7.2.0
pkgrel=1
pkgdesc="Ab initio computational chemistry software package"
arch=('x86_64' 'aarch64')
url="https://nwchemgit.github.io"
license=('ECL')
depends=('python' 'scalapack' 'libxcrypt')
makedepends=('gcc-fortran' 'tcsh' 'bc' 'inetutils')
install=nwchem.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwchemgit/nwchem/archive/v$pkgver-release.tar.gz"
        "config.sh"
        "nwchemrc")
sha256sums=('321c57a1994fd12546cb0d5f86c3bd8bd305d4420a9d7d416f3d765c428cdae4'
            'f4854dd5ff4be5c1103c6dd8c403a080f519220926edfb17154e658e34fea584'
            'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-release/src"

  # Fix CUDA
  sed -i 's/$(CUDA_FLAGS)/$(CUDA_FLAGS) --compiler-options -fPIC/g' \
    config/makefile.h
}

build() {
  cd "$srcdir/$pkgname-$pkgver-release"
  source "$srcdir/config.sh"

  cd src
  make nwchem_config
  make 64_to_32 > /dev/null
  make > /dev/null
  ../contrib/getmem.nwchem

  cd util
  make version
  make

  cd ..
  make link
}

package() {
  export TARGET=LINUX64
  cd "$srcdir/$pkgname-$pkgver-release"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/etc/skel"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/$pkgname/libraryps"
  install -m755 "bin/${TARGET}/$pkgname" "$pkgdir/usr/bin"

  cp -r src/basis/libraries "$pkgdir/usr/share/$pkgname"
  cp -r src/data "$pkgdir/usr/share/$pkgname"
  cp -r src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} \
    "$pkgdir/usr/share/$pkgname/libraryps"

  chmod -R go=rX "$pkgdir/usr/share/$pkgname"
  chmod -R u=wrX "$pkgdir/usr/share/$pkgname"

  install -m644 "$srcdir/nwchemrc" "$pkgdir/etc/skel/.nwchemrc"
  install -m0644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname"
}
