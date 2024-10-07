# Maintainer: Jack Roehr <jack@seatgull.com>
# Contributor: Justin Kromlinger <hashworks@archlinux.org>

pkgname=vector-git
pkgver=0.19.0.r5796.g43eaf93020
pkgrel=1
pkgdesc="A high-performance observability data pipeline"
arch=("x86_64")
_target="$CARCH-unknown-linux-gnu"
url="https://vector.dev"
license=("MPL2")
options=(!lto) # TODO: Build with LTO
backup=(
	"etc/vector/vector.yaml"
)
conflicts=("vector" "vector-bin")
depends=("glibc" "gcc-libs")
# https://github.com/vectordotdev/vector/blob/master/docs/DEVELOPING.md#bring-your-own-toolbox
makedepends=(
	"cargo"
	"cmake"
	"git"
	"perl"
	"protobuf"
	"python"
	"zlib"
)
checkdepends=(
	"cargo-nextest"
)
source=(
	"${pkgname}::git+https://github.com/vectordotdev/vector"
	"${pkgname%-git}.sysusers"
	"${pkgname%-git}.tmpfiles"
)
sha512sums=(
	'SKIP'
	'4f7a5d63f4e89018d1f0e9aa0fba2bb5c448d7031a7ff40c82878f574243e075c2fca020e78c4c71b1caa1a5bd1f06b496a5d3ab432f01d145233fd6c9ec4b87'
	'c192492df09d131f9174d2acbb7f265c280eb6d678589b8c93bacc47ae55c51573a5477d715897f8580ced420730992fb68bee78b374f1cc042888ea6b5512fd'
)

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	cargo fetch \
		--locked
}

build() {
	cd "${pkgname}"
	cargo build \
		--frozen \
		--release \
		--locked \
		--target "${_target}"
}

package() {
	install -Dm644 "${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
	install -Dm644 "${pkgname%-git}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"

	cd "${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/PRIVACY.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASES.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/VERSIONING.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASES.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm755 "target/${_target}/release/vector" "${pkgdir}/usr/bin/vector"

	install -Dm644 "config/vector.yaml" "${pkgdir}/etc/vector/vector.yaml"
	#install -Dm644 "config/agent/vector.yaml" "${pkgdir}/etc/vector/agent/vector.yaml"
	#install -Dm644 "config/aggregator/vector.yaml" "${pkgdir}/etc/vector/aggregator/vector.yaml"
	cp -r config/examples "${pkgdir}/usr/share/doc/${pkgname}/examples"

	install -Dm644 "distribution/systemd/vector.service" "${pkgdir}/usr/lib/systemd/system/vector.service"
	install -Dm644 "distribution/systemd/hardened-vector.service" "${pkgdir}/usr/lib/systemd/system/hardened-vector.service"
	install -Dm644 "distribution/systemd/vector.default" "${pkgdir}/etc/default/vector"
}
