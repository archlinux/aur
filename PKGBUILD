# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c*m" | sed -e 's/-//ig' -e 's/*//ig' -e 's/(A)/@/i' -e 's/#/o/i' -e 's/(dot)/\./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=gost-engine
pkgver=1.1.1
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
  "$pkgname.install"
  '0001-openssl_cnf.patch'
  '0002-fix_err.patch'
)

sha256sums=(
  'SKIP'
  'c37297f70f48336a47bab6ac7af5e07c8734037a27237dde5d7d3c2d6366b8ac'
  '5f8c1d0219f28bdc0dff17c80952585b5cc2036ea7594a005278a5e7ab6aace0'
  'c4165b22a9db180932c6442ee26e04e73bb68a2af5ceb23cabf0c89db3a9b31e'
)

sha512sums=(
  'SKIP'
  '68de2dd5f85655778432d56330e5ecd39c6cea7bf6e9a31441e2c7cfbdd5dc5ae1fdaaf070825fd4c3852afd2ac96781ed1b119544978a32bcce795708cfb2de'
  '1448ecb3a175e326f4dda1e411eab1df9fd9ad7b19862fc01b1aa0be39a5f7a32187c81975c8fff0f34f169fa9fb137fd5c9dff328b412bac116519ea31e3fef'
  'd4fb5f9637554b0883b911234696924ece563ed73e2e48e329e4b4173402d98036df38f36b7cfa238cfbf66826d2f547815cfc3483d18723778aeb1fff5aab38'
)

install=$pkgname.install

_wdir() {
  cd "${srcdir}/gost-engine"
}

prepare() {
  _wdir
  if [ -d build ]; then
      rm -rf build
  fi
  git checkout openssl_1_1_1
  patch --forward --strip=1 --input="${srcdir}/0002-fix_err.patch"
}

build() {
  _wdir
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
  _wdir
  mkdir -p "${pkgdir}/etc/ssl"
  cp "${srcdir}/0001-openssl_cnf.patch" "${pkgdir}/etc/ssl"
  DESTDIR="$pkgdir" cmake --build build --target install --config Release
}
