# Maintainer: Wasylq <wasylq@protonmail.com>
pkgname=fss
pkgver=1.35.1
pkgrel=1
pkgdesc='Scrapes all scenes and metadata from a studio URL'
arch=('x86_64' 'aarch64')
url='https://github.com/Anastylosis/FSS'
license=('GPL-3.0-only')
makedepends=('go>=1.26')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Anastylosis/FSS/archive/v${pkgver}.tar.gz")
# The real sha256 is populated by `updpkgsums` in the release workflow before
# the package is committed to AUR — see .github/workflows/release.yml. The
# 'SKIP' placeholder lets makepkg parse the file locally without the source.
sha256sums=('d8ea6d8790541a4eefdf8beeafc60df4c27ce9f770a36129fb1419b4ce4d4bf6')

build() {
  cd "FSS-${pkgver}"
  export CGO_ENABLED=0
  # The source tarball carries no .git, so there is no commit to stamp; the
  # channel says where the build came from instead. It used to be smuggled
  # through main.commit, which cost the field its actual meaning.
  go build -ldflags "-s -w -X main.version=${pkgver} -X main.channel=aur -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" -o fss .
}

package() {
  cd "FSS-${pkgver}"
  install -Dm755 fss "${pkgdir}/usr/bin/fss"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
