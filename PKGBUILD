# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=kolide-git
pkgver=2.3.0.r1.gbf9ae6ec
pkgrel=1
pkgdesc="osquery command and control"
url="https://www.kolide.co/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('osquery-git' 'mysql' 'redis')
makedepends=('go' 'go-bindata' 'nodejs-webpack' 'yarn')
install="kolide.install"
source=("${pkgname}::git+https://github.com/kolide/fleet.git"
        "kolide.sysusers" "kolide.conf.d" "kolide.service")
sha256sums=('SKIP'
            '3a76a40ee8b7e3b35f9bed7427874627d90574266994c740e8472b9010a5d410'
            '5def2c2a76ec625ce77859597fbdb9d1b3271fdef76e93988220c7e63e84aa51'
            '3e336962a204f979110a4273a4277ca5117441029a32cf2a5dd042d6c734a522')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/kolide"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/kolide/fleet"
}

build() {
	cd "${srcdir}/go/src/github.com/kolide/fleet"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	export PATH="${GOPATH}/bin:${PATH}"

	make deps
	make generate
	make

	./build/fleet version --full
}

package() {
	cd "${srcdir}/go/src/github.com/kolide/fleet"

	install -Dm755 "build/fleet" "${pkgdir}/usr/bin/fleet"

	install -Dm644 "${srcdir}/kolide.sysusers" "${pkgdir}/usr/lib/sysusers.d/kolide.conf"
	install -Dm644 "${srcdir}/kolide.service" "${pkgdir}/usr/lib/systemd/system/kolide.service"
	install -Dm644 "${srcdir}/kolide.conf.d" "${pkgdir}/etc/conf.d/kolide"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/kolide/LICENSE"
}
