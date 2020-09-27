pkgname='stratisd-boot'
pkgver=2.1.0
pkgrel=2
pkgdesc='Stratis binary for inclusion in initramfs to allow using Stratis as boot volume'
arch=('x86_64')
url='https://stratis-storage.github.io'
license=('MPL2')
depends=('cryptsetup')
makedepends=('asciidoc' 'cargo' 'git' 'mpfr' 'rust' 'systemd-libs'
             'llvm' 'clang')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=(
  "stratisd-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz"
  'initcpio-install'
  'stratisd-boot.service'
)
sha256sums=('6dbae1f46c1fb6cd3e367181243724b2b3c410bd44d5fba7d98c083d39bd691c'
            'ba1812d04a837df55475d4348d4325f3cf4ceae30f963bd9e99a2eb81b0c9b63'
            '2fb79ecabe72885ae637412ad208d3c3290cf1a6754f4165366458714aa14ea9')

build() {
  cd "stratisd-${pkgver}"

  msg2 "Patching makefile to enable release build"
  sed -i 's,--target ,--release --target ,g' Makefile  

  msg2 "Building stratisd-boot"
  make build-no-default
}

package() {
  cd "stratisd-${pkgver}"
  
  install -Dm 755 'target/debug/stratisd' -t "${pkgdir}/usr/bin/stratisd-boot"
  install -Dm 644 '../stratisd-boot.service' -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 '../initcpio-install' "${pkgdir}/usr/lib/initcpio/install/stratis"
}

