# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=lazygit
pkgver=0.1.51
pkgrel=1
pkgdesc="A simple terminal UI for git commands"
arch=("x86_64")
url="https://github.com/jesseduffield/${pkgname}"
license=("MIT")
depends=("glibc")
makedepends=("go-pie")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("6690a7922c8692de6f75f6865cfc20ae2710f4e78e627bbd3e71306405f26721")

build () {
  echo "Linking to repository path..."
  mkdir -p "${srcdir}/src/github.com/jesseduffield"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/jesseduffield/"
  cd "${srcdir}/src/github.com/jesseduffield/${pkgname}-${pkgver}"
  
  echo "Building..."
  GOPATH="${srcdir}" PATH="$PATH:$GOPATH/bin" go build -x -i -v -ldflags "-X main.commit=${pkgver##*.} -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(cat VERSION).${pkgver##*.}" -o "${pkgname}.bin"
  
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
