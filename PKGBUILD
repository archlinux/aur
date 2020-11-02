# Maintainer: Watanabe Fumihiko <random at chars dot jp>

pkgname=freenitori
pkgver=0.0.1
pkgrel=1
pkgdesc="Open source, general purpose Discord utility."
arch=("x86_64")
url="https://${pkgname}.jp/"
license=("GPL")
depends=()
makedepends=("go" "make" "bash")
backup=("etc/${pkgname}/nitori.conf")
source=(
  "git+https://git.randomchars.net/RandomChars/FreeNitori.git"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('SKIP'
            'acbf6fa0c8c035bb9a59cd18986eaef7cdfa751fa04385d8e842e9f8d5c5318c'
            'bb280c416e90f01fb1cc717b524f707e8a9da4ba4f6d728b899024aa277d3f84'
            'cb8d60723616d8153505850a6ec8cb5458c34a833e5d5bc87b3efcce1486202b')

build() {
  cd "FreeNitori"
  export GOPATH="${PWD}/../go"
  make deps
  make build
}

package() {
  cd "FreeNitori"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori-chatbackend"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori-shell"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori-supervisor"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori-webserver"
  install -Dm644 "assets/nitori.conf" "${pkgdir}/etc/${pkgname}/nitori.conf"
  install -Dm644 "plugins/badger.so" "${pkgdir}/etc/${pkgname}/plugins/badger.so"
  cd ..
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
