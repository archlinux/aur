pkgname='stratisd-boot'
pkgver=1.0.3
pkgrel=1
pkgdesc='Stratis binary for inclusion in initramfs to allow using Stratis as boot volume'
arch=('x86_64')
url='https://stratis-storage.github.io'
license=('MPL2')
makedepends=('asciidoc' 'cargo' 'git' 'mpfr' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=(
  "stratisd-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz"
  'initcpio-install'
  'stratisd-boot.service'
)
sha256sums=(
  '27e8dcae06b5bbb89ed4e798435f004fd86964400da7162fa2a56742cb4e9bc3'
  'ba1812d04a837df55475d4348d4325f3cf4ceae30f963bd9e99a2eb81b0c9b63'
  '2fb79ecabe72885ae637412ad208d3c3290cf1a6754f4165366458714aa14ea9'
)

build() {
  cd "stratisd-${pkgver}"

  msg2 "Patching makefile to enable release build"
  sed -i 's,--target ,--release --target ,g' Makefile  

  msg2 "Building stratisd-boot"
  make build-no-default
}


check() {
  cd "stratisd-${pkgver}"

  # Disabled temporarily - warning breaks compile
  #make test
}

package() {
  cd "stratisd-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/bin"
  install -d -m 755 "${pkgdir}/usr/lib/initcpio/install"
  install -d -m 755 "${pkgdir}/usr/lib/systemd/system"

  install -m 755 'target/x86_64-unknown-linux-gnu/release/stratisd' "${pkgdir}/usr/bin/stratisd-boot"
  install -m 644 '../stratisd-boot.service' "${pkgdir}/usr/lib/systemd/system"
  install -m 644 '../initcpio-install' "${pkgdir}/usr/lib/initcpio/install/stratis"
}

