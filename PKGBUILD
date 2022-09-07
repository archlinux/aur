# Maintainer: Henrique Dante de Almeida <hdante@gmail.com>
pkgname=randomutils
pkgver=53.10.19
pkgrel=1
epoch=1
pkgdesc='Utilities for generating 64-bit cryptographic random numbers'
arch=('x86_64')
url="https://gitlab.com/hdante/randomutils/"
source=('https://gitlab.com/hdante/randomutils/-/archive/r1-53.10.19/randomutils-r1-53.10.19.tar.gz')
sha256sums=('8036cd3a6f06ddd68ddde2b33abb0dfd218cdf559b0313e3ea2c90bf54ac1235')
license=('GPL3')
makedepends=('git' 'zig' 'asciidoc')
optdepends=('bash: running examples'
            'words: default dictionary for mempassword')

if check_option "debug" "y"
then
	_mode="-Ddebug"
else
	_mode="-Drelease-safe"
fi

if check_option "strip" "y"
then
	_strip="-Dstrip"
fi

check() {
  cd "${srcdir}/${pkgname}-r${epoch}-${pkgver}"
  zig build test
}

build() {
  cd "${srcdir}/${pkgname}-r${epoch}-${pkgver}"
  zig build $_mode $_strip
  zig build manpages
}

package() {
  cd "${srcdir}/${pkgname}-r${epoch}-${pkgver}"
  zig build $_mode $_strip -p "${pkgdir}/usr"
  zig build manpages -p "${pkgdir}/usr"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
  cp README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
