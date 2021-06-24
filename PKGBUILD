# Maintainer: techknowlogick <techknowlogick at gitea dot io>
pkgname=ignite
pkgver=0.9.0
pkgrel=0
pkgdesc="Weaveworks Ignite, combines Firecracker MicroVMs with Docker/OCI images to unify containers and VMs."
arch=('x86_64' 'aarch64')
url="https://github.com/weaveworks/ignite"
makedepends=('go' 'git')
depends=('containerd' 'cni-plugins')
license=('apache')
provides=('ignite')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/weaveworks/ignite/archive/v${pkgver}.tar.gz"
	"ignited.service"
)
sha256sums=('5b1c654f31f46213d2276b4d9fb74bb15f61505c3450b2d470a2c6ce882682e9'
            'd8719fd5744f790f78ff027eb8c82ad917d5a96a688e406f1ab6dcbf2bb9ec30')

build() {
	cd "$pkgname-$pkgver"
	# build assumes git repo, but we're building from tarball, so we need to set state to clean
	go build -mod=vendor -ldflags "$(IGNITE_GIT_VERSION=v${pkgver} ./hack/ldflags.sh)" -o ignite ./cmd/ignite	
	go build -mod=vendor -ldflags "$(IGNITE_GIT_VERSION=v${pkgver} ./hack/ldflags.sh)" -o ignited ./cmd/ignited
}

package() {
 	install -D -m644 "$srcdir/ignited.service" "$pkgdir/usr/lib/systemd/system/ignited.service"
	install -D -m755 "$pkgname-$pkgver/ignite" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "$pkgname-$pkgver/ignited" "${pkgdir}/usr/bin/ignited"
}

