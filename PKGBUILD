# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui
pkgver=0.5.2
pkgrel=2
pkgdesc="A web user interface to manage your WireGuard setup."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ngoduykhanh/${pkgname}"
license=(MIT)
makedepends=(git yarn npm go)
depends=(wireguard-tools bash glibc)
_tag=6bbe230fe8a25844cebe9997a5acf4645033f9b5 # git rev-parse v${pkgver}
source=(git+${url}.git#tag=${_tag}
        ${pkgname}.service
        99-wg.conf
        wgiptables.sh
        wg-reload.path
        wg-reload.service)
sha256sums=('SKIP'
            'c60cbe2d47c616a2f9984c6c57ef60e810c7e57ca5054a318b3da8770bf03b76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            'bc8b1cee00a541eab44dab5bd23afddb99d9c667a5d4d083d7bf9575b321052c'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '44d74ce9057193a34e2c6afc4996188bc9b26594cdb691f96076d1986b615e4f')
conflicts=(${pkgname}-bin)
install=${pkgname}.install

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ${pkgname}
  ./prepare_assets.sh
}

build() {
  cd ${pkgname}
  export GOPATH=${srcdir}
  export CGO_CPPFLAGS=${CPPFLAGS}
  export CGO_CFLAGS=${CFLAGS}
  export CGO_CXXFLAGS=${CXXFLAGS}
  export CGO_LDFLAGS=${LDFLAGS}
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname}
}

package() {
  install -Dm644 ${pkgname}/LICENSE                 -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm755 ${pkgname}/${pkgname}              -t ${pkgdir}/opt/${pkgname}/
  install -Dm644 ${srcdir}/${pkgname}.service       -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/wg-reload.{path,service} -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/99-wg.conf               -t ${pkgdir}/etc/sysctl.d/
  install -Dm755 ${srcdir}/wgiptables.sh               ${pkgdir}/opt/${pkgname}/wgiptables
}
