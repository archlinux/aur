# Maintainer: Dylan <dylan@hashflo.net>

pkg_base=dogecoin
pkgname=('dogecoin-daemon')
pkgver=1.10
_git_branch=master
pkgrel=1
arch=('i686' 'x86_64')
url='http://dogecoin.com/'
makedepends=('boost' 'automoc4' 'protobuf')
conflicts=('dogecoin-qt') # why can't weeee be friends... (/usr/bin/dogecoind exists in filesystem)
license=('MIT')
_git_base_url=github.com/$pkg_base/$pkg_base/
_git_raw_base_url=github.com/$pkg_base/$pkg_base/
source=(
    https://$_git_base_url/archive/$_git_branch.tar.gz
    https://raw.$_git_base_url$_git_branch/contrib/debian/examples/$pkg_base.conf
    https://raw.$_git_base_url$_git_branch/contrib/debian/manpages/$pkg_base'd.1'
    https://raw.$_git_base_url$_git_branch/contrib/debian/manpages/$pkg_base.conf.5
    $pkgname.install
)
sha256sums=(
    '8dc2125a5e36fd20b471ab63a8db837566528b3a23079fdc24da8573d7d98d1a'
    '1daa77c34dc9b849da6582212e700c8c7ff32a1825cb03ab24fa4df0e2921609'
    'e1ff69595c1eb43e801fae557fd395b65bb806dbc2dc0fe16807ab0344e8a866'
    '34afb1af9e1e628dc32b7a320e23b66b3f384a64cb7cfca500332489a9ca6cd5'
    '87b5a5c7cbfa9ebb959453858068fca4289bf465b42c8bc12944ab184639e224'
)

build() {
  cd $srcdir/$pkg_base-$_git_branch
  ./autogen.sh
  #CXXFLAGS='$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1'
  ./configure --enable-cxx --prefix=/usr --with-gui=no --disable-tests --without-miniupnpc --with-incompatible-bdb
  make
}

package_dogecoin-daemon() {
  pkgdesc='Dogecoin is a peer-to-peer network based digital currency - daemon'
  depends=(boost-libs openssl)
  cd $srcdir/$pkg_base-$_git_branch
  install -Dm755 src/$pkg_base'd' $pkgdir/usr/bin/$pkg_base'd'
  install -Dm644 $srcdir/$pkg_base.conf $pkgdir/usr/share/doc/$pkgname/examples/$pkg_base.conf
  install -Dm644 $srcdir/$pkg_base'd.1' $pkgdir/usr/share/man/man1/$pkg_base'd.1'
  install -Dm644 $srcdir/$pkg_base.conf.5 $pkgdir/usr/share/man/man5/$pkg_base.conf.5
  install -Dm644 COPYING '$pkgdir/usr/share/licenses/$pkgname/COPYING'
}
