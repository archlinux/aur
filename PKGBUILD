# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=figurine
pkgver=1.3.0
pkgrel=1
pkgdesc="Print your text in style"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/arsham/${pkgname}"
license=('Apache')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e969f4f9e617201fc92d5467c7af11578a4f3d1f025ad2110ee2c56a663cbdf0')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
   aarch64)
    _arch="arm64"
    ;;
  armv7h)
    _arch="arm"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

build() {
  cd "${srcdir}/${_pkgsrc}"
  make linux LINUX_ARCH="${_arch}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "deploy"
  bsdtar -xf "${pkgname}_linux_${_arch}_.tar.gz"
  install -Dm755 "deploy/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}