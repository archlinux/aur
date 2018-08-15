# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.1.58
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
sha256sums=("82f15a341d068efe7d88596a1da400cc0c508b17688de67f37cbce97840228e6")
_commit="8cc8c4c2288bef2ea6d3dd652723087f993baa3f"

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
