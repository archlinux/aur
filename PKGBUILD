# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
pkgname=supercronic
# renovate: datasource=github-releases depName=aptible/supercronic
pkgver=0.2.50
pkgrel=1
pkgdesc='A crontab-compatible job runner, designed specifically to run in containers'
arch=(aarch64 arm armv6h armv7h i686 pentium4 riscv64 x86_64)
url='https://github.com/aptible/supercronic'
license=(MIT)
provides=(${pkgname})
makedepends=(
	git # Sources
	go  # Build
)
conflicts=(
	${pkgname}-bin
	${pkgname}-git
)
options=(
	!strip     # Stripping symbols would break the output binary
	!emptydirs # Remove empty directories from package because why not
)
source=("${pkgname}::git+https://github.com/aptible/${pkgname}.git#tag=v${pkgver}")
b2sums=('45feb41ee1d730602102bc6a55244bfcc8e3d268471dd8090ac9ce481147a59a2aa3666323a715a863c4f12b23353ce1dabd4c2aaa0d5b809abad3a7975e82ee')

build() {
	export GOPATH="${srcdir}/gopath/"
	export CGO_ENABLED=0

	cd "${srcdir}/${pkgname}/"
	go build \
		-trimpath \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.Version=v${pkgver}"
}

check() {
	"${srcdir}/${pkgname}/${pkgname}" -version
}

package() {
	install -Dm755 \
		"${srcdir}/${pkgname}/${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 \
		"${srcdir}/${pkgname}/README.md" \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 \
		"${srcdir}/${pkgname}/LICENSE.md" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
