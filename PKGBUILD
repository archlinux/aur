# Maintainer: Watanabe Fumihiko <random@chars.jp>

pkgname=freenitori
pkgver=1.12.4
pkgrel=3
pkgdesc="Open source, general purpose Discord utility."
arch=("x86_64")
url="https://${pkgname}.jp/"
license=("GPL")
depends=()
makedepends=("go" "make" "bash")
backup=("etc/${pkgname}/nitori.conf")
source=(
  "git+https://git.randomchars.net/FreeNitori/FreeNitori.git"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('SKIP'
            '7b50e0e628828635d639238b003da5749a38b5942d765418cdeb466bcce95782'
            '89719b5009884f17fed228d2cb0562c4e71f3a6dc61618d8989d632a2fa5a953'
            'cb8d60723616d8153505850a6ec8cb5458c34a833e5d5bc87b3efcce1486202b')

build() {
  cd "FreeNitori"
  git checkout v${pkgver}
  git config advice.detachedHead false
  export GOPATH="${PWD}/../go"
  make
}

package() {
  cd "FreeNitori"
  install -Dm755 "build/freenitori" "${pkgdir}/usr/bin/freenitori"
  install -Dm755 "build/nitorictl" "${pkgdir}/usr/bin/nitorictl"
  ./build/freenitori || true
  install -Dm644 "nitori.conf" "${pkgdir}/etc/${pkgname}/nitori.conf"
  cd ..
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
