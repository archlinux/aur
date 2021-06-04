# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=gost-engine
pkgver=1.1.1.r496.9b492b3
pkgrel=1
pkgdesc='Russian GOST R 34.10 and GOST R 34.11-2012 Crypto Algorithms for OpenSSL'
arch=('x86_64')
license=('Apache 2.0')
url='https://github.com/gost-engine/engine'
depends=('openssl')
makedepends=('cmake' 'git')
conflicts=('openssl-gost')
provides=('openssl-gost')

_gitbranch="openssl_1_1_1"
source=(
  "gost-engine::git+https://github.com/gost-engine/engine.git#branch=${_gitbranch}"
  'gost.cnf'
  "${pkgname:?}.install"
)

sha256sums=('SKIP'
            '04c3483d758e393d9831d2be4cee1eafd806eea15055438be7c7b4caeeccbfe6'
            '5da9d605aaf45af5623d96de6cc8b68fa385601beb28fcba6054aa5811b9a4f4')
sha512sums=('SKIP'
            '431f810f822a347135d10c99f98ed2516e6afe310def77fc9aa0b41dc0578b05e2684f77e1062ea934961720f6d11f73f27e38548bccfe61709e81f8d53c484e'
            'dbaf26e67350bd2c4ddf265f204473be02eaf74223a49d09d9c22c0adae2c1898e2c04dfbe1096694dc47cd56c4e3cf44310c5bab04c7a83e375b9665ffdf23a')

install=${pkgname:?}.install

pkgver() {

  cd "${srcdir:?}/gost-engine" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/gost-engine build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  echo "1.1.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

prepare() {

  openssl_version=$(openssl version | grep -ho "1\.[0-9]\.\w*")
  if ! echo "${openssl_version}" | grep -iq "1.1.1"; then
    echo -e "\E[1m\E[31mOpenSSL version ${openssl_version} is not compatible! \E[0m"
    exit 1
  fi

  cd "${srcdir:?}/gost-engine" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/gost-engine build directory! Prepare Failed! \E[0m"
    exit 1
  )

  if [ -d build ]; then
    rm -rf build
  fi

  # Fix ==> WARNING: Package contains reference to $srcdir
  # gost.so.1.1 contain path to source files
  # strings gost.so.1.1 | grep "src\/gost-engine"
  # Show containing strings
  sed -i "$ a\ \nset(CMAKE_C_FLAGS \"\${CMAKE_C_FLAGS} -fdebug-prefix-map=\\\\\"\${CMAKE_SOURCE_DIR}\\\\\"=. -Wno-builtin-macro-redefined -D'__FILE__=\\\\\"\$(subst \$(realpath \${CMAKE_SOURCE_DIR})/,,\$(abspath \$<))\\\\\"'\")" \
    "${srcdir:?}/${pkgname:?}/CMakeLists.txt"

}

build() {

  cd "${srcdir:?}/gost-engine" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/gost-engine build directory! Build Failed! \E[0m"
    exit 1
  )

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSL_ROOT_DIR=/usr \
    -DOPENSSL_INCLUDE_DIR=/usr/include \
    -DOPENSSL_LIBRARIES=/usr/lib \
    -DOPENSSL_ENGINES_DIR=/usr/lib/engines-1.1 \
    -B build \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build --config Release

}

package() {

  cd "${srcdir:?}/gost-engine" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/gost-engine build directory! Package Failed! \E[0m"
    exit 1
  )

  install -Dm644 "${srcdir:?}/gost.cnf" "${pkgdir:?}/etc/ssl/gost.cnf"
  install -Dm644 "${srcdir:?}/${pkgname:?}/LICENSE" "${pkgdir:?}/usr/share/licenses/${pkgname:?}/LICENSE"
  DESTDIR="${pkgdir:?}" cmake --install build --config Release

}
