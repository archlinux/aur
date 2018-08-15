# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.1.61
pkgrel=1
pkgdesc="A simple terminal UI for git commands"
arch=("x86_64")
url="https://github.com/jesseduffield/${pkgname}"
license=("MIT")
depends=("glibc")
makedepends=("go-pie")
provides=("lazygit")
conflicts=("lazygit-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("c2d6f78b071405cd6713e1dc52a6e68edde2693ec631cb204807f352a635c8bc")
_commit="db140842f3c10921153b3e19e66dd72b39fa00f8"

build () {
  echo "Linking to repository path..."
  mkdir -p "${srcdir}/src/github.com/jesseduffield"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/jesseduffield/${pkgname}"
  cd "${srcdir}/src/github.com/jesseduffield/${pkgname}"
  
  echo "Building..."
  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin" go build -x -i -v -ldflags "-X main.commit=${_commit:0:7} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=${pkgver}" -o "${pkgname}.bin"
  
  echo "Removing link..."
  rm -rf "${srcdir}/src"
}

package () {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.bin" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _file in ${srcdir}/${pkgname}-${pkgver}/*.md ${srcdir}/${pkgname}-${pkgver}/docs/*.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
