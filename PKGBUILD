# Maintainer: devvick <root@devvick.eu>

pkgname=zerotier-systemd-manager-git
pkgver=r52.b4db027
pkgrel=1
pkgdesc="Get ZeroTier playing nice with systemd-networkd and -resolved"
arch=('any')
url="https://github.com/zerotier/zerotier-systemd-manager"
license=("BSD-3-Clause")
depends=('zerotier-one')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname/-git/-bin}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o zerotier-systemd-manager ./mgr.go
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  _output="${srcdir}/${pkgname%-git}"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.service" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.service"
  install -Dm644 "${_output}/contrib/zerotier-systemd-manager.timer" "${pkgdir}/usr/lib/systemd/system/zerotier-systemd-manager.timer"
  install -Dm755 "${_output}/zerotier-systemd-manager" "${pkgdir}/usr/bin/zerotier-systemd-manager"
  install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
