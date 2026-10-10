# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-notify
pkgver=0.1.0
pkgrel=1
pkgdesc="Freedesktop notification daemon for sysc-shell"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-notify"
license=('BSD-3-Clause')
depends=('systemd')
optdepends=('sysc-shell: notification popups and history')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-notify/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3a22384d794f169abc6cbdd1b516f3ae4960d481c23f06e5ec75d4af05a4cb7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOTOOLCHAIN=local
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_ENABLED=0
  go build -buildvcs=false -o "${pkgname}" "./cmd/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 contrib/sysc-notify.service "${pkgdir}/usr/lib/systemd/user/sysc-notify.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "${pkgdir}/usr/lib/systemd/user/sysc-notify.service"
  sed -i 's|WantedBy=default.target|WantedBy=graphical-session.target|' "${pkgdir}/usr/lib/systemd/user/sysc-notify.service"
  sed -i 's|Type=simple|Type=dbus\nBusName=org.freedesktop.Notifications|' "${pkgdir}/usr/lib/systemd/user/sysc-notify.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
