# Maintainer: Phundahl
pkgname=tailtui
pkgver=1.1.0
pkgrel=1
pkgdesc="A brutalist, keyboard-centric terminal user interface for Tailscale"
arch=('x86_64' 'aarch64')
url="https://github.com/Phundahl/tailtui"
license=('MIT')
depends=('tailscale')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phundahl/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('edd85463e0f9789c88a70b7875cafd10cf22205ba4381d87b6de4f1bf95c41e9')

build() {
  cd "${pkgname}-${pkgver}"
  
  # Arch Linux standarder for sikre og optimerede Go-byg
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  go build -ldflags "-X main.version=${pkgver} -extldflags \"${LDFLAGS}\"" -o "${pkgname}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Læg den binære fil i /usr/bin/
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # Læg licensen i Arch's standard-mappe for licenser
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
