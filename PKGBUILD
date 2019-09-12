# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=76.0.3809.87
pkgrel=2
arch=('any')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
makedepends=('git' 'ninja' 'cmake' 'gn')
source=("${pkgname}.tar.gz::https://github.com/btwiuse/naiveproxy/archive/v${pkgver}-${pkgrel}.tar.gz"
        "build_x86.sh")
md5sums=('f3b1ba2190b0564cc7e38aa6a2147676'
         '5257d87a1b4db16c8eb24e19d2570ed6')

build(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  ./tools/import-upstream.sh
  if [[ "$(uname -m)" =~ ^(i686|i386)$ ]]; then
    ( cd src; ../../build_x86.sh )
  else
    ( cd src; ./get-clang.sh )
    ( cd src; ./build.sh )
  fi
  popd
}

check(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  # ./tests/basic.sh src/out/Release/naive
  popd
}

package(){
  pushd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
