# Maintainer: Wasylq <wasylq@protonmail.com>
pkgname=fss
pkgver=1.17.0
pkgrel=1
pkgdesc='Scrapes all scenes and metadata from a studio URL'
arch=('x86_64' 'aarch64')
url='https://github.com/Wasylq/FSS'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go>=1.25')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Wasylq/FSS/archive/v${pkgver}.tar.gz")
# The real sha256 is populated by `updpkgsums` in the release workflow before
# the package is committed to AUR — see .github/workflows/release.yml. The
# 'SKIP' placeholder lets makepkg parse the file locally without the source.
sha256sums=('81363e0c33e8093d0b88ee2e39e09f728076225790c878e0c50ea863c38a49eb')

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
