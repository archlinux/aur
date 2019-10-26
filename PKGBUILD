# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=realize
pkgver=2.0.2
pkgrel=2
pkgdesc="Golang live reload and task runner"
arch=('x86_64')
url="https://github.com/oxequa/realize"
license=('GPL')
conflicts=('realize-git')
provides=('realize')
depends=('glibc')
makedepends=('go>=1.11' 'git')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oxequa/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8e68504710552a487dcec92e6295d18ea830d29192c4c3d1af316589861a04325b99765eb0051adb7ecb8ff344d98bf667453d7bbd8e6d588a44db446f267a56')

prepare() {
  # setup env variables & dirs
  mkdir -p "${srcdir}/go"
  export GOPATH="${srcdir}/go"
  export GO111MODULE=on

  # initialize module & add dependencies to go.mod
  cd "${srcdir}/${pkgname}-${pkgver}"
  if [ ! -f go.mod ]; then
    go mod init github.com/oxequa/realize
    go mod tidy
  fi

  # download dependencies
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  go build -o "${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/realize"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
