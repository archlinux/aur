# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap-git
pkgver=2.27.1.1844.318029c
pkgrel=1
pkgdesc='Swiss army knife for network attacks and monitoring'
url='https://github.com/bettercap/bettercap'
arch=('x86_64')
license=('GPL3')
depends=('libpcap' 'libnetfilter_queue' 'iproute2' 'glibc' 'libnfnetlink')
makedepends=('go' 'git')
optdepends=('bettercap-caplets: scripts (caplets) and proxy modules')
provides=('bettercap')
conflicts=('bettercap')
source=(${pkgname}::git+https://github.com/bettercap/bettercap)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  find . -type f -exec sed 's|/usr/local|/usr|g' -i {} +
}

build() {
  cd ${pkgname}
  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"
  go build
}

package() {
  cd ${pkgname}
  install -Dm 755 bettercap -t "${pkgdir}/usr/bin"
  install -Dm 644 bettercap.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
