# Maintainer: Nomadcxx <nomadx@users.noreply.github.com>
pkgname=privacybit
pkgver=0.1.0
pkgrel=1
pkgdesc="Privacy audit for Linux desktops"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/privacybit"
license=('GPL-3.0-or-later')
depends=('systemd')
makedepends=('git' 'go>=1.26.4')
optdepends=(
  'flatpak: inspect Flatpak applications'
  'iproute2: inspect VPN routes'
  'sudo: run reviewed package removal actions'
)
source=("${pkgname}::git+https://github.com/Nomadcxx/privacybit.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -buildvcs=false -o privacybit ./cmd/privacybit
  go build -buildvcs=false -o privacybit-helper ./cmd/privacybit-helper
  go build -buildvcs=false -o privacybit-installer ./cmd/privacybit-installer
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 privacybit "${pkgdir}/usr/bin/privacybit"
  install -Dm755 privacybit-helper "${pkgdir}/usr/bin/privacybit-helper"
  install -Dm755 privacybit-installer "${pkgdir}/usr/bin/privacybit-installer"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
