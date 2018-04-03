# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cilium-git
pkgver=1.0.0.rc9.gf56cdf176
pkgrel=1
pkgdesc="API-aware Networking and Security for Containers based on BPF"
arch=('x86_64')
url="https://cilium.io/"
license=('Apache')
depends=('docker' 'iproute2' 'clang')
makedepends=('go' 'lib32-glibc' 'bazel')
optdepends=('consul' 'etcd')
conflicts=()
source=("${pkgname}::git+https://github.com/cilium/cilium" "cilium.sysusers")
sha256sums=('SKIP'
            'f47ee5b436304aa55ffad29fd68e31be4b1261d3f81ba2a7a370e522705833e8')

pkgver() {
	cd "${srcdir}/${pkgname}"

	VERSION=$(<VERSION)
	echo "${VERSION}.g$(git rev-parse --short HEAD)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/cilium"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/cilium/cilium"
}

build() {
	cd "${srcdir}/go/src/github.com/cilium/cilium"

	export GOPATH="${srcdir}/go"
	export PATH="$GOPATH/bin:$PATH"
	export PKG_BUILD=1

	make -C daemon apply-bindata
	make V=1 plugins bpf cilium daemon monitor cilium-health bugtool

	git submodule update --init
	cd envoy
	bazel clean
	bazel build //:envoy
}

package() {
	cd "${srcdir}/go/src/github.com/cilium/cilium"

	make DESTDIR="${pkgdir}" install

	install -Dm644 "$srcdir/cilium.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/cilium.conf"

	install -Dm644 "${srcdir}/${pkgname}/contrib/systemd/cilium.service" \
		"${pkgdir}/usr/lib/systemd/system/cilium.service"

	install -Dm644 "${srcdir}/${pkgname}/contrib/systemd/cilium-consul.service" \
		"${pkgdir}/usr/lib/systemd/system/cilium-consul.service"

	install -Dm644 "${srcdir}/${pkgname}/contrib/systemd/cilium-docker.service" \
		"${pkgdir}/usr/lib/systemd/system/cilium-docker.service"

	install -Dm644 "${srcdir}/${pkgname}/contrib/systemd/cilium-etcd.service" \
		"${pkgdir}/usr/lib/systemd/system/cilium-etcd.service"
}
