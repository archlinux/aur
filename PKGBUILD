# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='c2cc20d59e56c903c15abc9e0ad5618e463035d1'
pkgbase=lesspassgo
pkgname=('lesspassgo' 'lesspassgo-server')
pkgver=2018.05.09
pkgrel=1
arch=('any')
url='https://github.com/tuxlinuxien/lesspassgo'
license=('MIT')
makedepends=('go')
source=("https://github.com/tuxlinuxien/${pkgname}/archive/${_commit}.tar.gz"
        "lesspassgo-server.conf"
        "lesspassgo-server.service"
        "lesspassgo-server.sysusers")
sha256sums=('cd04fe98d549e7a83ac494dbafeb9ad96c379f6a7c31b3ccc5a53fbdbea38f4f'
            'f72ac06e46a801c8633bcae408bdc7fd68659ec44fe9435c469098c83844212e'
            '97d450dfde9723007205d9c15645e6ad31b494648ea4636c2b80dbb4ba12dc2e'
            '86bca7f9d667f076e4c9e0f88fee60676baca7027d5a9619a8e60277f8d29f35')

build() {
  export GOPATH="${srcdir}"
  mkdir -p "${srcdir}/src/github.com/tuxlinuxien"
  ln -fsT "${srcdir}/${pkgname}-${_commit}" "${srcdir}/src/github.com/tuxlinuxien/${pkgname}"
  #cd "${srcdir}/src/github.com/tuxlinuxien/${pkgname}/cmd/lesspassgo"
  cd "${srcdir}/src/github.com/tuxlinuxien/${pkgname}"
  go get -v ./...
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
