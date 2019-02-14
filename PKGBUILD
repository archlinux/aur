# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fabla-git
_pkgname=fabla
pkgver=1.3.2.r9.gabeb3e9
pkgrel=1
pkgdesc="A sampler LV2 plugin"
arch=('i686' 'x86_64')
url="http://openavproductions.com/fabla/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'cairomm' 'libsndfile' 'ntk')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" 'openav-fabla')
source=("$_pkgname::git+https://github.com/openAVproductions/openAV-Fabla.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed -r 's/^release.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make install

  # move READMEs for drumkit to doc directory
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  for kit in 808 EasternHop HardElectro SavageDrums; do
      mv "$pkgdir/usr/lib/lv2/fabla$kit.lv2/README" "$pkgdir/usr/share/doc/$pkgname/README-$kit"
  done
}
