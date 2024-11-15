# Maintainer: Bin Jin <bjin@ctrl-d.org>

pkgname=vetu
pkgver=0.9.1
pkgrel=1
pkgdesc="virtualization toolset to effortlessly run Cloud Hypervisor-backed virtual machines on Linux hosts"
arch=('x86_64')
url="https://github.com/cirruslabs/vetu"
license=('Fair')
depends=('glibc')
makedepends=('go')
source=("https://github.com/cirruslabs/vetu/archive/v${pkgver}.tar.gz")
sha256sums=('17afb62aa43c2081504b30abadc9ec0a376c2faf1529cfa680e3e97ddc83db4e')
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
