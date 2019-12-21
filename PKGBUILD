# Maintainer:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf-git
pkgver=0.0.6.r41.e7a82fc
pkgrel=2
pkgdesc='BPF library'
depends=('libelf' 'linux-api-headers>=5.4')
url='https://github.com/libbpf/libbpf'
license=('custom')
makedepends=('rsync')
arch=('x86_64')
provides=('libbpf')
conflicts=('libbpf')
source=("git+https://github.com/libbpf/libbpf")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}/src"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/src"
  DESTDIR="${pkgdir}" make prefix=/usr install install_headers
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname%-git}/LICENSE"
  install -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${pkgname%-git}/LICENSE.BSD-2-Clause"
  pushd "${pkgdir}/usr"
  mv lib64 lib
  popd
}
