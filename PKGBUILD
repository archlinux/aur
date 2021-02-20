# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=dapr-cpp-sdk
pkgname=${_pkgname}-git
pkgver=v0.3.0.r0.gf5ec06b
pkgrel=1
pkgdesc="C++ SDK for Dapr "
arch=('x86_64')
url="https://github.com/dapr/cpp-sdk"
license=('MIT')
makedepends=('protobuf>=3')
depends=('grpc' 'dapr-cli')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=(
	"${_pkgname}::git+https://github.com/dapr/cpp-sdk"
	'dapr-cpp-sdk.pc.template'
)
sha256sums=(
	'SKIP'
	'83b817de81c47650c340ac39066258c8d97fd29ac7619442e08e205a35b9e747'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	make refresh_proto_files

	ver="$(git describe --long --tags)"
	sed -e "s/<tag-version>/${ver}/" ../dapr-cpp-sdk.pc.template > ../dapr-cpp-sdk.pc
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -m644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	soname_lib="$(basename out/libdapr.*.so)"
	install -m644 -D "out/${soname_lib}" "${pkgdir}/usr/lib/${soname_lib}"
	ln -s "/usr/lib/${soname_lib}" "${pkgdir}/usr/lib/libdapr.so"

	install -m644 -D ../dapr-cpp-sdk.pc "${pkgdir}/usr/lib/pkgconfig/dapr-cpp-sdk.pc"
}
