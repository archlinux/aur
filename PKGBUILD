# Maintainer: techknowlogick <techknowlogick at gitea dot io>
pkgname=ignite
pkgver=0.8.0
pkgrel=1
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
sha256sums=('3dfe778b9c3a604abe95878a6c0cc533c872c76c2ff211878a26f4ed14720e16'
            'd8719fd5744f790f78ff027eb8c82ad917d5a96a688e406f1ab6dcbf2bb9ec30')

build() {
	cd "$pkgname-$pkgver"
	# build assumes git repo, but we're building from tarball, so we need to set state to clean
	sed -i hack/ldflags.sh -e "s/IGNITE_GIT_TREE_STATE..dirty/IGNITE_GIT_TREE_STATE\=\"clean/i"
	go build -mod=vendor -ldflags "$(IGNITE_GIT_VERSION=v${pkgver} ./hack/ldflags.sh)" -o ignite ./cmd/ignite	
	go build -mod=vendor -ldflags "$(IGNITE_GIT_VERSION=v${pkgver} ./hack/ldflags.sh)" -o ignited ./cmd/ignited
}

package() {
 	install -D -m644 "$srcdir/ignited.service" "$pkgdir/usr/lib/systemd/system/ignited.service"
	install -D -m755 "$pkgname-$pkgver/ignite" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "$pkgname-$pkgver/ignited" "${pkgdir}/usr/bin/ignited"
}

