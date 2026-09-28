# Maintainer: Jumping Bean
# Contributor: Anton Kudelin <kudelin at proton dot me>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=nwchem
pkgver=7.3.1
pkgrel=1
pkgdesc="Ab initio computational chemistry software package"
arch=(x86_64)
url="https://nwchemgit.github.io"
license=(ECL)

depends=(python openmpi scalapack libxcrypt)
makedepends=(gcc-fortran tcsh bc inetutils)

install=nwchem.install

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/nwchemgit/nwchem/archive/v$pkgver-release.tar.gz"
  config.sh
  nwchemrc
)

sha256sums=(
  '394d1cef35350896ef16e365b073055239b1294cc21b4cc6bae27b401cc8f1d4'
  '66bdc0f583566fa5450cb0752eaf4dd58343f99600cac5d7c85fac39fd2c7174'
  'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver-release/src"

  # Fix CUDA
  sed -i 's/$(CUDA_FLAGS)/$(CUDA_FLAGS) --compiler-options -fPIC/g' \
    config/makefile.h
}

build() {
  cd "$srcdir/$pkgname-$pkgver-release"

  export NWCHEM_TARGET=LINUX64

  source "$srcdir/config.sh"

  cd src
  make nwchem_config
  make 64_to_32
  make
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
  install -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname"
}
