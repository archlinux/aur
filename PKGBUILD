# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=gost-engine
pkgver=1.1.1_496.9b492b3
pkgrel=1
pkgdesc='Russian GOST R 34.10 and GOST R 34.11-201 crypto algorithms for OpenSSL'
arch=('i686' 'x86_64')
license=('Apache')
url='https://github.com/gost-engine/engine'

depends=('openssl')
makedepends=('cmake' 'git')
conflicts=('openssl-gost')
provides=('openssl-gost')

source=(
  'gost-engine::git+https://github.com/gost-engine/engine.git'
  'gost.cnf'
  "${pkgname}.install"
  '0001-fix_err.patch'
)

sha256sums=('SKIP'
  '04c3483d758e393d9831d2be4cee1eafd806eea15055438be7c7b4caeeccbfe6'
  'f96bd050f3ff7fe80f37841750d2c7e515fab24473f0f0fd309d6510834df4b1'
  'c4165b22a9db180932c6442ee26e04e73bb68a2af5ceb23cabf0c89db3a9b31e')
sha512sums=('SKIP'
  '431f810f822a347135d10c99f98ed2516e6afe310def77fc9aa0b41dc0578b05e2684f77e1062ea934961720f6d11f73f27e38548bccfe61709e81f8d53c484e'
  'b2db575cf9429b049b7d229a1b1a282d0849ca6d2b9f193c0b30b404614cd5895b61a6a611d382e71e02d75b4e6fd1f5235635cbb535e4f6b5feeb4d36471ad7'
  'd4fb5f9637554b0883b911234696924ece563ed73e2e48e329e4b4173402d98036df38f36b7cfa238cfbf66826d2f547815cfc3483d18723778aeb1fff5aab38')

install=$pkgname.install

pkgver() {

  cd "${srcdir}/gost-engine" || (
    echo "Can't cd to ${srcdir}/gost-engine build directory!"
    exit 1
  )

  echo "1.1.1_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

prepare() {

  cd "${srcdir}/gost-engine" || (
    echo "Can't cd to ${srcdir}/gost-engine build directory!"
    exit 1
  )

  if [ -d build ]; then
    rm -rf build
  fi

  git checkout openssl_1_1_1

  patch --forward --strip=1 --input="${srcdir}/0001-fix_err.patch"

}

build() {

  cd "${srcdir}/gost-engine" || (
    echo "Can't cd to ${srcdir}/gost-engine build directory!"
    exit 1
  )

  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSL_ROOT_DIR=/usr \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl \
    -DOPENSSL_LIBRARIES=/usr/lib \
    -DOPENSSL_ENGINES_DIR=/usr/lib/engines-1.1 \
    -DCMAKE_BUILD_TYPE=Release .

  cmake --build build --config Release

}

package() {

  cd "${srcdir}/gost-engine" || (
    echo "Can't cd to ${srcdir}/gost-engine build directory!"
    exit 1
  )


  mkdir -p "${pkgdir}/etc/ssl"
  cp -f "${srcdir}/gost.cnf" "${pkgdir}/etc/ssl"
  DESTDIR="${pkgdir}" cmake --build build --target install --config Release

}
