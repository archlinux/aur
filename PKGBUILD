# Maintainter: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=nwchem
pkgver=7.0.0
pkgrel=1
pkgdesc="Ab initio computational chemistry software package"
arch=('x86_64')
url="http://www.nwchem-sw.org/index.php/Main_Page"
license=('ECL')
depends=('python' 'scalapack')
makedepends=('gcc-fortran')
optdepends=()
install=nwchem.install
source=("https://github.com/nwchemgit/nwchem/archive/v$pkgver-release.tar.gz"
        "config.sh"
        "nwchemrc")
sha256sums=('dc03194513a6d2deecde6e80135b68419dca35483c9ecb45e35c5a028e27b15f'
            'ae97d6dbdc2c11802b8699564ad433c4b8aef67263bbd8f4d64a549debd3b1da'
            'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

prepare(){
  # Fix CUDA
  sed -i 's/$(CUDA_FLAGS)/$(CUDA_FLAGS) --compiler-options -fPIC/g' \
  "$srcdir/$pkgname-$pkgver-release/src/config/makefile.h"
}

build() {
  cd "$srcdir/$pkgname-$pkgver-release"
  source "$srcdir/config.sh"
  cd src
  make nwchem_config
  make 64_to_32
  make
  ../contrib/getmem.nwchem
}

package() {
  cd "$srcdir/$pkgname-$pkgver-release"
  export TARGET=LINUX64
  install -d -m 755 "$pkgdir/usr/bin"
  install -d -m 755 "$pkgdir/usr/share/$pkgname"
  install -d -m 755 "$pkgdir/etc/skel"
  install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
  install -d -m 755 "$pkgdir/usr/share/$pkgname/libraryps"
  install -m 755 "bin/${TARGET}/$pkgname" "$pkgdir/usr/bin"
  cp -r src/basis/libraries "$pkgdir/usr/share/$pkgname"
  cp -r src/data "$pkgdir/usr/share/$pkgname"
  cp -r src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} "$pkgdir/usr/share/$pkgname/libraryps"
  chmod -R go=rX "$pkgdir/usr/share/$pkgname"
  chmod -R u=wrX "$pkgdir/usr/share/$pkgname"
  install -m 644 "$srcdir/nwchemrc" "$pkgdir/etc/skel/.nwchemrc"
  install -m 0644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname"
}
