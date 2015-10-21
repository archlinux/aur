# $Id$
# Maintainer: vri <t.j.a.devries(at)gmail(dot)com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

# for customization
_pkgname=cpp-netlib
_ext=
_basedir=/usr
_boost=boost${_ext}

pkgname=${_pkgname}${_ext}
pkgver=0.11.2
pkgrel=1
pkgdesc="A library that provides application layer protocol support using modern C++ techniques"
arch=('i686' 'x86_64')
url="http://cpp-netlib.github.com/"
license=('custom')
depends=("boost${_ext}>=1.54.0")
optdepends=('openssl: for https')
makedepends=("cmake>=2.8.10")
#options=(staticlibs)
source=(
         http://downloads.cpp-netlib.org/$pkgver/$_pkgname-$pkgver-final.tar.gz
         )
sha256sums=(
         '71953379c5a6fab618cbda9ac6639d87b35cab0600a4450a7392bc08c930f2b1'
         )

build() {
  install -d $srcdir/build
  cd $srcdir/build
  cmake -DBOOST_ROOT=$_basedir -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF -DCPP-NETLIB_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}${_basedir} ../"$_pkgname-$pkgver-final"
  make
#  make test
}

package() {
  cd $srcdir/build
  make install

  install -d ${pkgdir}${_basedir}/lib
  if test "$CARCH" == x86_64; then
    mv ${pkgdir}${_basedir}/lib64/* ${pkgdir}${_basedir}/lib
    rmdir ${pkgdir}${_basedir}/lib64
  fi
  for _file in $(find ${pkgdir}${_basedir}/lib/cmake/cppnetlib -type f -name "*.cmake");
  do
    sed -i -e "s|${pkgdir}${_basedir}/lib64|${_basedir}/lib|g" $_file
    sed -i -e "s|${pkgdir}${_basedir}|${_basedir}|g" $_file
  done

  #Install license
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  cd "$srcdir/$_pkgname-$pkgver-final"
  install -Dm644 LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE_1_0.txt
}
