# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='9d4f658de1d17d2d92b22de6f6e93dd3295aa299'
pkgbase=lesspassgo
pkgname=('lesspassgo' 'lesspassgo-server')
pkgver=2018.05.09
pkgrel=5
arch=('any')
url='https://github.com/tuxlinuxien/lesspassgo'
license=('MIT')
makedepends=('go')
source=("https://github.com/tuxlinuxien/${pkgname}/archive/${_commit}.tar.gz"
        "lesspassgo-server.conf"
        "lesspassgo-server.service")
sha256sums=('99273ad1eab14c915beae2260b6663c66772fc10143b3364dbe98ba08eeb18f1'
            '732503800bd05bb2f443d6f1fecb1d3fc3fa82074e8dc8cf01aa746817236e5b'
            'bfaaca8ad7d1bcbc0a92d7d5ceadf7dc00592fe23084a70b18c8c89ede897d1d')

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
  # conf
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
