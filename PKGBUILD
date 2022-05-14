# Maintainer: zhs <zhao4she4@tuta.io>
# largely based on the release version one by techknowlogick 
pkgname=ignite-git
_pkgname=ignite
pkgver=r1819.c4162ac6
pkgrel=1
pkgdesc="Weaveworks Ignite, combines Firecracker MicroVMs with Docker/OCI images to unify containers and VMs, GIT version."
arch=('x86_64')
url="https://github.com/weaveworks/ignite"
makedepends=('go' 'git')
depends=('containerd' 'cni-plugins')
license=('apache')
provides=('ignite-git')
conflicts=('ignite')
source=(
	"git+https://github.com/weaveworks/ignite/"
	"ignited.service"
)
sha256sums=('SKIP'
            'd8719fd5744f790f78ff027eb8c82ad917d5a96a688e406f1ab6dcbf2bb9ec30')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	# build assumes git repo, but we're building from tarball, so we need to set state to clean
	# sed -i hack/ldflags.sh -e "s/IGNITE_GIT_TREE_STATE..dirty/IGNITE_GIT_TREE_STATE\=\"clean/i"
  # no need for above when building from git
	go build -mod=vendor -ldflags "$(./hack/ldflags.sh)" -o ignite ./cmd/ignite	
	go build -mod=vendor -ldflags "$(./hack/ldflags.sh)" -o ignited ./cmd/ignited
	go build -mod=vendor -ldflags "$(./hack/ldflags.sh)" -o ignite-spawn ./cmd/ignite-spawn
}

package() {
 	install -D -m644 "$srcdir/ignited.service" "$pkgdir/usr/lib/systemd/system/ignited.service"
	install -D -m755 "${_pkgname}/ignite" "${pkgdir}/usr/bin/ignite"
	install -D -m755 "${_pkgname}/ignited" "${pkgdir}/usr/bin/ignited"
	install -D -m755 "${_pkgname}/ignite-spawn" "${pkgdir}/usr/bin/ignite-spawn"
}

