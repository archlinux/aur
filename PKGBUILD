# Maintainer: Watanabe Fumihiko <random@chars.jp>

pkgname=freenitori
pkgver=2.1.0
pkgrel=1
pkgdesc="Open source, general purpose Discord utility."
arch=("x86_64")
url="https://${pkgname}.jp/"
license=("GPL")
depends=()
makedepends=("go" "make")
backup=("etc/${pkgname}/nitori.conf")
source=(
  "git+https://git.randomchars.net/${pkgname}/${pkgname}.git"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('SKIP'
            '39a1d66caace0434566a8a434cc8552e83fdbadf48b362830a8917921b6ecec5'
            '89719b5009884f17fed228d2cb0562c4e71f3a6dc61618d8989d632a2fa5a953'
            '9c387032930c51ca0232839c29e95dc66e6f1feb46e0d3a1d1ba8fe3b910c57f')

build() {
  cd "${pkgname}"
  git checkout v${pkgver}
  git config advice.detachedHead false
  export GOPATH="${PWD}/../go"
  make
}

package() {
  cd "${pkgname}"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori"
  install -Dm755 "build/nitorictl" "${pkgdir}/usr/bin/nitorictl"
  ./build/freenitori || true
  install -Dm644 "nitori.conf" "${pkgdir}/etc/${pkgname}/nitori.conf"
  cd ..
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
