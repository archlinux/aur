# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=vetu
pkgver=0.5.3
pkgrel=1
pkgdesc="virtualization toolset to effortlessly run Cloud Hypervisor-backed virtual machines on Linux hosts"
arch=('x86_64')
url="https://github.com/cirruslabs/vetu"
license=('Fair')
depends=('glibc')
makedepends=('go')
source=("https://github.com/cirruslabs/vetu/archive/v${pkgver}.tar.gz")
sha256sums=('13caf3fcd4d6d60ae2eb33dff502ec588ccd72918fe15cb8530837f745a4b170')
install=vetu.install

build() {
  cd "${srcdir}/vetu-${pkgver}"

  ldflags="-linkmode=external -X github.com/cirruslabs/vetu/internal/version.Version=${pkgver}"
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    --ldflags="$ldflags" \
    -o vetu \
    ./cmd/...
}

package() {
  cd "${srcdir}/vetu-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/vetu/LICENSE"
  install -Dm755 vetu "${pkgdir}/usr/bin/vetu"
}
