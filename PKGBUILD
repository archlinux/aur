# Maintainer: Jeremy Kescher <jeremy@kescher.at>
pkgname=mjpeg-proxy-git
_pkgname=mjpeg-proxy
pkgver=r38.99e4412
pkgrel=1
pkgdesc="Republish MJPEG HTTP image streams using a server in Go"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/vvidic/mjpeg-proxy"
license=('GPL3')
makedepends=(
  'go'
  'git'
)
provides=('mjpeg-proxy')
conflicts=('mjpeg-proxy')
source=(
    "$_pkgname::git+https://github.com/vvidic/mjpeg-proxy.git"
    "service"
    "tmpfiles"
)
sha256sums=('SKIP'
            '698c307c758f5b911d8bf054f2ed74bf707bf8eb18ad9e6475fd8abd6b15fbea'
            'afb78ea67a8faa7a384155ff12bc12f4e5aff861f0531aca7cc3804224cdb13a')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  go build -o $_pkgname
}

package() {
  cd "$srcdir"
  install -Dm755 $_pkgname/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
  install -Dm644 $_pkgname/sources.json "${pkgdir}"/etc/mjpeg-proxy/sources.json
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/mjpeg-proxy.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_pkgname.conf
}
