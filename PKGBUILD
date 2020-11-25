# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='2d157f99bd683d127aac8ca1f5f396120b721c9e'
pkgname=supersonic
pkgver=2020.11.24
pkgrel=1
pkgdesc='A Subsonic music server implemented in C++'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/davidgfnet/supersonic-cpp'
license=('Unlicense')
depends=('fcgi' 'openssl' 'sqlite' 'taglib')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidgfnet/${pkgname}-cpp/archive/${_commit}.tar.gz"
        "argparse.hpp::https://raw.githubusercontent.com/hbristow/argparse/43edb8acf2135509590631a0ac4582e3741016bf/argparse.hpp"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.socket")
sha256sums=('7686430618849103b5fa9de416add6e7e854187c44e4416ce420612139baf8de'
            '7e43bf60bac7445e2c8dcf307928ed6e62b7940071b43a5a6674a04d6476e61b'
            '4a48d22aed461d9ea52bfd91c32835dbead08d47157d9e49062561db63113f41'
            '3ffba956ec0044df1fd5e7e4fe18188e341634d1763994ebbf47498067fca676'
            'df937e7a8922a04d69ed9db46774d67d565a0fe2738661119311c44ba365a047')

prepare() {
  mv argparse.hpp "${pkgname}-cpp-${_commit}"/argparse
}

build() {
  cd "${pkgname}-cpp-${_commit}"
  make
}

package() {
  # binaries
  install -D -m755 "${srcdir}/${pkgname}-cpp-${_commit}/supersonic-scanner" \
    "${pkgdir}/usr/bin/supersonic-scanner"
  install -D -m755 "${srcdir}/${pkgname}-cpp-${_commit}/supersonic-server" \
    "${pkgdir}/usr/bin/supersonic-server"

  # readme
  install -Dm644 "${srcdir}/${pkgname}-cpp-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}/${pkgname}.socket" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
}
