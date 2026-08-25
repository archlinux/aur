# Maintainer: Wasylq <wasylq@protonmail.com>
pkgname=fss
pkgver=1.30.1
pkgrel=1
pkgdesc='Scrapes all scenes and metadata from a studio URL'
arch=('x86_64' 'aarch64')
url='https://github.com/Anastylosis/FSS'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go>=1.26')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Anastylosis/FSS/archive/v${pkgver}.tar.gz")
# The real sha256 is populated by `updpkgsums` in the release workflow before
# the package is committed to AUR — see .github/workflows/release.yml. The
# 'SKIP' placeholder lets makepkg parse the file locally without the source.
sha256sums=('ca085ac2aa1df7a697163b13893a72e96dee91df026c6f55c6629c96172bd252')

build() {
  cd "FSS-${pkgver}"
  export CGO_ENABLED=0
  go build -ldflags "-s -w -X main.version=${pkgver} -X main.commit=aur -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" -o fss .
}

package() {
  cd "FSS-${pkgver}"
  install -Dm755 fss "${pkgdir}/usr/bin/fss"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
