# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='9d4f658de1d17d2d92b22de6f6e93dd3295aa299'
pkgbase=lesspassgo
pkgname=('lesspassgo' 'lesspassgo-server')
pkgver=2018.05.09
pkgrel=4
arch=('any')
url='https://github.com/tuxlinuxien/lesspassgo'
license=('MIT')
makedepends=('go-pie')
source=("https://github.com/tuxlinuxien/${pkgname}/archive/${_commit}.tar.gz"
        "lesspassgo-server.conf"
        "lesspassgo-server.service"
        "lesspassgo-server.sysusers")
sha256sums=('99273ad1eab14c915beae2260b6663c66772fc10143b3364dbe98ba08eeb18f1'
            '732503800bd05bb2f443d6f1fecb1d3fc3fa82074e8dc8cf01aa746817236e5b'
            '97d450dfde9723007205d9c15645e6ad31b494648ea4636c2b80dbb4ba12dc2e'
            '86bca7f9d667f076e4c9e0f88fee60676baca7027d5a9619a8e60277f8d29f35')

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/tuxlinuxien"
  ln -fsT "${srcdir}/${pkgname}-${_commit}" "${srcdir}/src/github.com/tuxlinuxien/${pkgname}"
  cd "${srcdir}/src/github.com/tuxlinuxien/${pkgname}"
  go get -v -gcflags "all=-trimpath=${GOPATH}/src" -asmflags "all=-trimpath=${GOPATH}/src" ./...
}

package_lesspassgo() {
  pkgdesc='LessPass password generator cli written in Go'

  # binary
  install -Dm755 bin/lesspassgo "${pkgdir}/usr/bin/lesspassgo"
}

package_lesspassgo-server() {
  pkgdesc='LessPass API compatible server written in Go'
  backup=("etc/${pkgname}.conf")

  # binary
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # home dir
  install -dm750 -o 156 -g 156 "${pkgdir}/var/lib/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # user
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
