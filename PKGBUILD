# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=natscli-git
pkgver=r3153.cc0a8e3
pkgrel=1
pkgdesc="The NATS Command Line Interface"
arch=(x86_64)
url="https://github.com/nats-io/natscli"
license=('Apache')
makedepends=("go")
conflicts=('natscli-bin' 'natscli')
provides=('nats')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}/nats"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
		.
}

package() {
	cd "${srcdir}/${pkgname}/nats"
	install -D -m755 nats ${pkgdir}/usr/bin/nats
}
