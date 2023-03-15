# Maintainer: fuero <fuerob@gmail.com>
pkgname=kwok
pkgver=0.1.0
pkgrel=1
pkgdesc='Kubernetes WithOut Kubelet - set up a cluster of thousands of (fake) nodes in seconds'
arch=('x86_64')
url="https://github.com/kubernetes-sigs/${pkgname}"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	use-goflags.patch
)
sha256sums=(
        'f8b5d01df09e1b68078c9754bb1922f1e9be3794fd519cd0de615280a0fff84d'
        '83cb15ccfed8df335747e65626d1159c3937b3445a51e36db28ee6778cbb9f39'
)

prepare(){
  cd "${pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/use-goflags.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_LDFLAGS_ALLOW=".*"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  make \
	EXTRA_LDFLAGS="-linkmode=external -w -s -v" \
	EXT_LDFLAGS="${LDFLAGS}" \
	VERSION="${pkgver}" \
	build
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  HOST_ARCH="$(uname -m | sed -e "s/x86_64/amd64/" -e "s/i386/386/")"
  for i in kwok kwokctl
  do
	strip "bin/linux/${HOST_ARCH}/${i}"
  	install -Dm755 "bin/linux/${HOST_ARCH}/${i}" "$pkgdir/usr/bin/${i}"
  done
}

# getver: https://github.com/kubernetes-sigs/kwok/releases
