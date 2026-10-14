# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-notify
pkgver=0.1.1
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
sha256sums=('0858c88f4fa8e681a44c0240271185ea9742a2dc57af8e031af3b7e530cef5fc')

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
