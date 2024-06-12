# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=figurine
pkgname=${_pkgname}-git
pkgver=1.3.0.r0.d51c245
pkgrel=1
pkgdesc="Print your text in style"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/arsham/${_pkgname}"
license=('Apache')
makedepends=('git' 'make' 'go')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

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

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make linux LINUX_ARCH="${_arch}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "deploy"
  bsdtar -xf "${_pkgname}_linux_${_arch}_v${pkgver%%.r*}.tar.gz"
  install -Dm755 "deploy/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
