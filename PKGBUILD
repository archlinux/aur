# Maintainer: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=osbuild-composer
pkgdesc='An HTTP service for building bootable OS images'
pkgver=51
pkgrel=1
url="https://www.osbuild.org"
arch=(x86_64)
license=(Apache)
depends=('dnf' 'qemu' 'osbuild' 'systemd')
makedepends=('go' 'systemd')
optdepends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/osbuild/osbuild-composer/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('705ab14ad8780dcd114d1c7f05d9ee4e5839e9e72918705272878a14502c1d1c')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build

  # Arch doesn't use /usr/libexec: edit service files
  sed -i 's,/usr/libexec,/usr/lib,g' distribution/osbuild-*.service
}

build() {
  cd $pkgname-$pkgver
  export LDFLAGS="-ldflags=-X=github.com/osbuild/osbuild-composer/internal/common.RpmVersion=${pkgname}-${pkgver}-${pkgrel}.${arch}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw ${LDFLAGS}"

  go build -o build/osbuild-composer ./cmd/osbuild-composer
  go build -o build/osbuild-worker ./cmd/osbuild-worker
}

package() {
  cd $pkgname-$pkgver

  # binaries
  install -Dm755 "build/osbuild-composer" "${pkgdir}/usr/lib/osbuild-composer/osbuild-composer"
  install -Dm755 "build/osbuild-worker" "${pkgdir}/usr/lib/osbuild-composer/osbuild-worker"
  install -Dm755 "dnf-json"               "${pkgdir}/usr/lib/osbuild-composer/dnf-json"

  # sysusers
  install -Dm644 distribution/osbuild-composer.conf "${pkgdir}/usr/lib/sysusers.d/osbuild-composer.conf"

  # systemd units
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 distribution/*.service "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 distribution/*.socket "${pkgdir}/usr/lib/systemd/system/"

  # repositories
  mkdir -p "${pkgdir}/usr/share/osbuild-composer/repositories"
  install -Dm644 repositories/*.json "${pkgdir}/usr/share/osbuild-composer/repositories"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
