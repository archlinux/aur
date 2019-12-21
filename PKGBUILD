# Maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf
pkgver=0.0.4
pkgrel=1
pkgdesc='BPF library'
depends=('libelf' 'linux-api-headers')
url='https://github.com/libbpf/libbpf'
license=('custom')
makedepends=('rsync')
arch=('x86_64')
source=("git+https://github.com/libbpf/libbpf#tag=v0.0.4"
        "LICENSE"
        "LICENSE.BSD-2-Clause"
        "0001-Fix-Makefile-to-always-link-libelf-even-if-not-used.patch")
sha256sums=('SKIP'
            '847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349'
            '6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd'
            '7c4099472757d082f56a546f6d08a2418262f08e289b6b65e8fbbe33f9ddc2c3')

prepare () {
  cd "${srcdir}/${pkgname}"
  patch -p1 < "${srcdir}/0001-Fix-Makefile-to-always-link-libelf-even-if-not-used.patch"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  DESTDIR="${pkgdir}" make prefix=/usr install install_headers
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.BSD-2-Clause"
  pushd "${pkgdir}/usr"
  mv lib64 lib
  popd
}
