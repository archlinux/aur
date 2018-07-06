# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cilium-git
pkgver=1.1.90.5728.e57ef0f58
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

	echo "${VERSION}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git reset HEAD --hard
	git clean -dfq

	git submodule update --init
}

build() {
	cd "${srcdir}/${pkgname}"

	mkdir -p src/github.com/cilium
	ln -s ../../../ src/github.com/cilium/cilium

	mkdir -p vendor/src
	for v in vendor/*; do
		test -z "$v" -o "$v" = "vendor/src" && continue
		if test -d "$v"; then
			mv -fv "$v" vendor/src/
		fi
	done
	export GOPATH="$(pwd):$(pwd)/vendor"

	export PKG_BUILD=1
	export CCACHE_DISABLE=1

	echo "${pkgver}" > VERSION

	make -C daemon apply-bindata
	make plugins bpf cilium daemon monitor cilium-health bugtool

	export CC="/usr/bin/gcc"
	export CXX="/usr/bin/g++"

	cd envoy
	bazel clean
	bazel build //:envoy --action_env=PATH="$PATH"
}

package() {
	cd "${srcdir}/${pkgname}"

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
