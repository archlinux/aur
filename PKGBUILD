# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='ecb58e0f90ed65d4bde3e1254294593dc5406c30'
pkgbase=lesspassgo
pkgname=('lesspassgo' 'lesspassgo-server')
pkgver=2020.08.02
pkgrel=1
arch=('any')
url='https://github.com/tuxlinuxien/lesspassgo'
license=('MIT')
makedepends=('go')
source=("https://github.com/tuxlinuxien/${pkgname}/archive/${_commit}.tar.gz"
        "lesspassgo-server.conf"
        "lesspassgo-server.service")
sha256sums=('7f4948e80364d5e6d8ad8a6a2b2bf13998a725d519d6bea3b3ddcabde3f70ffa'
            '732503800bd05bb2f443d6f1fecb1d3fc3fa82074e8dc8cf01aa746817236e5b'
            'bfaaca8ad7d1bcbc0a92d7d5ceadf7dc00592fe23084a70b18c8c89ede897d1d')

prepare() {
  cd "${pkgbase}-${_commit}"
  mkdir -p build/
}

build() {
  cd "${pkgbase}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS} -Wno-return-local-addr"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${_commit} -extldflags ${LDFLAGS}"
  go build -o build -ldflags="${_LDFLAGS}" "./cmd/..."
}

package_lesspassgo() {
  pkgdesc='LessPass password generator cli written in Go'

  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${_commit}/build/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}

package_lesspassgo-server() {
  pkgdesc='LessPass API compatible server written in Go'
  backup=("etc/${pkgname}.conf")

  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${_commit}/build/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
