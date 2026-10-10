# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=sysc-clipboard
pkgver=0.1.2
pkgrel=1
pkgdesc="Encrypted clipboard history daemon for sysc-shell"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-clipboard"
license=('BSD-3-Clause')
depends=('systemd')
optdepends=('gnome-keyring: Secret Service for encrypted persistence' 'keepassxc: alternative Secret Service provider' 'sysc-shell: clipboard history panel')
makedepends=('go>=1.26.4')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-clipboard/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e111cc8deb6a1bb8c9d3f81f8a49b3638c1403d86faf9811b0f45629e1454922')

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
  install -Dm644 contrib/sysc-clipboard.service "${pkgdir}/usr/lib/systemd/user/sysc-clipboard.service"
  sed -i 's|%h/.local/bin/|/usr/bin/|g' "${pkgdir}/usr/lib/systemd/user/sysc-clipboard.service"
  sed -i 's|WantedBy=default.target|WantedBy=graphical-session.target|' "${pkgdir}/usr/lib/systemd/user/sysc-clipboard.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
