# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=cilium-git
pkgver=1.0.90.5304.ac2be0922
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

# create a fake go path directory and pushd into it
# $1 real directory
# $2 gopath directory
_fake_gopath_pushd() {
	mkdir -p "$GOPATH/src/${2%/*}"
	rm -f "$GOPATH/src/$2"
	ln -rsT "$1" "$GOPATH/src/$2"
	pushd  "$GOPATH/src/$2" >/dev/null
}

_fake_gopath_popd() {
	popd >/dev/null
}

pkgver() {
	cd "${srcdir}/${pkgname}"

	VERSION=$(<VERSION)
	echo "${VERSION}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	git reset HEAD --hard
	git submodule update --init
}

build() {
	cd "${srcdir}"

	export GOPATH="${srcdir}"
	_fake_gopath_pushd cilium-git github.com/cilium/cilium

	mkdir -p "${srcdir}/vendor/src"
	for v in vendor/*; do
		if test ${v} = vendor/src; then continue; fi
		if test -d ${v}; then
			mv -fv ${v} "${srcdir}/vendor/src/"
		fi
	done
	export GOPATH="${GOPATH}:${srcdir}/vendor"

	export CCACHE_DISABLE=1
	export PKG_BUILD=1

	make clean
	make -C daemon apply-bindata
	make V=1 plugins bpf cilium daemon monitor cilium-health bugtool

	export CC="/usr/bin/gcc"
	export CXX="/usr/bin/g++"

	cd envoy
	bazel clean
	bazel build //:envoy --action_env=PATH="$PATH"

	_fake_gopath_popd
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
