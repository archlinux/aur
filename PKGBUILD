# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-tray
pkgver=0.1.1
pkgrel=1
pkgdesc="StatusNotifierItem and DBusMenu tray daemon for sysc-shell"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-tray"
license=('BSD-3-Clause')
depends=('systemd')
optdepends=('sysc-shell: tray presentation')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-tray/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be9557f36bc24258b184cb4edc5df58efef504db7c20262b2eb4c2680881bc73')

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
  install -Dm644 contrib/sysc-tray.service "${pkgdir}/usr/lib/systemd/user/sysc-tray.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "${pkgdir}/usr/lib/systemd/user/sysc-tray.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
