# Maintainer: Jonas Geiler <aur@jonasgeiler.com>
# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
pkgname=supercronic
# renovate: datasource=github-releases depName=aptible/supercronic
pkgver=0.2.51
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
b2sums=('985c9d2930bbf2d339a1fe6d3434b731f19ab09204047d1d1491f3c274aab65d9a4f17f05ea0433ea36c945220630306b50f826db9bf640d4794f024bb57e5f5')

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
