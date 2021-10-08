# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=cilium-git
pkgver=1.11.0rc0.r35.gda746075e6
pkgrel=1
pkgdesc="API-aware Networking and Security for Containers based on BPF"
arch=('x86_64')
url="https://cilium.io/"
license=('Apache')
depends=('docker' 'iproute2' 'clang')
makedepends=('go' 'lib32-glibc' 'bazel' 'ninja' 'docker')
optdepends=('consul' 'etcd')
conflicts=()
source=("${pkgname}::git+https://github.com/cilium/cilium" "cilium.sysusers")
sha256sums=('SKIP'
            'f47ee5b436304aa55ffad29fd68e31be4b1261d3f81ba2a7a370e522705833e8')

pkgver() {
	cd "${srcdir}/${pkgname}"

	version=$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)
	release=$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')

	echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}


prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/cilium/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/cilium/cilium"
}

build() {
	cd "${srcdir}/go/src/github.com/cilium/cilium"
	export GOPATH="${srcdir}/go"

	echo "${pkgver}" > VERSION
	make PKG_BUILD=1 V=1 build
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" PKG_BUILD=1 V=1 -i install
	install -Dm644 "$srcdir/cilium.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/cilium.conf"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 "${srcdir}/${pkgname}/contrib/systemd/"*.{service,mount} \
		"${pkgdir}/usr/lib/systemd/system/"
}
