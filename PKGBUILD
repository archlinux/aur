# $Id$
# Maintainer: vri <t.j.a.devries(at)gmail(dot)com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

# for customization
_pkgname=cpp-netlib
_ext=
_basedir=/usr
_boost=boost${_ext}

pkgname=${_pkgname}${_ext}
pkgver=0.12.0
pkgrel=2
pkgdesc="A library that provides application layer protocol support using modern C++ techniques"
arch=('i686' 'x86_64')
url="http://cpp-netlib.github.com/"
license=('custom')
depends=()
optdepends=('openssl: for https')
makedepends=('cmake>=2.8.10' 'boost' 'boost-libs' 'asio')
#options=(staticlibs)
source=(
         http://downloads.cpp-netlib.org/$pkgver/$_pkgname-$pkgver-final.tar.gz
         OPENSSL_NO_SSL3.patch
         )
sha256sums=(
         'a0a4a5cbb57742464b04268c25b80cc1fc91de8039f7710884bf8d3c060bd711'
         'e7b4b7ecdafb51211d9be65fd179e8cd7cea71480aaeb4f30f11d5c8fc251f03'
         )

prepare() {
        cd "$pkgname-$pkgver-final"
        patch -Np0 -i "$srcdir/OPENSSL_NO_SSL3.patch"
}

build() {
  install -d $srcdir/build
  cd $srcdir/build
  # use asio from system
  sed -i -e "s|include_directories(deps/asio/asio/include)||g" $srcdir/$_pkgname-$pkgver-final/CMakeLists.txt
  cmake -DBOOST_ROOT=$_basedir -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF -DCPP-NETLIB_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}${_basedir} ../"$_pkgname-$pkgver-final"
#  cmake -DBOOST_ROOT=$_basedir -DCPP-NETLIB_BUILD_TESTS=ON -DCPP-NETLIB_BUILD_EXAMPLES=ON -DCPP-NETLIB_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}${_basedir} ../"$_pkgname-$pkgver-final"
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
