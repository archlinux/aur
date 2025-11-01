# Maintainer: D-Jy <duan@d-jy.net>

pkgbase='nps'
pkgname=('nps' 'npc')
pkgver=0.33.10
pkgrel=1
pkgdesc="A lightweight, high-performance intranet penetration proxy with web UI"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/djylb/nps"
license=('GPL3')
depends=('glibc')
makedepends=('go')
install='.INSTALL'
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/djylb/nps/archive/refs/tags/v${pkgver}.tar.gz"
  "npc.service"
  "nps.service"
)
sha256sums=('9fc08cf3ec272d5b6c97e76c67613dbc94e338cca75b4c1cfd7cc4bb44651325'
            'c668c61dc1d61f87c75430277c4962e71860ab066d3acaaab578b811b781b33e'
            'da9a34b86e9d9f42c0fb57f23b887de89d9de0d7c6a0f6fb34d6741755d35237')

prepare() {
  cd ${srcdir}/${pkgbase}-${pkgver}
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgbase}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/npc ./cmd/npc/npc.go
  go build -o build/nps ./cmd/nps/nps.go
}

packaging() {
  install -Dm 755 build/${1} ${pkgdir}/usr/bin/${1}
  install -Dm 644 ${srcdir}/${1}.service ${pkgdir}/usr/lib/systemd/system/${1}.service

  for conf in $2
  do
    install -Dm644 conf/$(basename "$conf") -t ${pkgdir}/etc/${pkgbase}/conf/
  done
}

package_npc() {
  cd ${srcdir}/${pkgbase}-${pkgver}

  _name=`echo ${FUNCNAME} | cut -d _ -f 2`

  backup=(
    "etc/${pkgbase}/conf/npc.conf"
    "etc/${pkgbase}/conf/multi_account.conf"
  )

  packaging "${_name}" "${backup[*]}"
}

package_nps() {
  cd ${srcdir}/${pkgbase}-${pkgver}

  _name=`echo ${FUNCNAME} | cut -d _ -f 2`

  backup=(
    "etc/${pkgbase}/conf/nps.conf"
  )

  packaging "$_name" "${backup[*]}"

  install -d "${pkgdir}/etc/${pkgbase}/web/views" "${pkgdir}/etc/${pkgbase}/web/static"
  find web/views  -type f -exec install -Dm644 {} "${pkgdir}/etc/${pkgbase}/{}" \;
  find web/static -type f -exec install -Dm644 {} "${pkgdir}/etc/${pkgbase}/{}" \;
}
