# Maintainer: Georg Graßnick <dev.grassnick at mailbox dot org>

pkgname=ymuse
pkgver=0.17
pkgrel=2
pkgdesc="Easy, functional, and snappy client for Music Player Daemon"
arch=("x86_64" "aarch64")
url="https://yktoo.com/en/software/ymuse/"
license=("Apache")
depends=("gtk3")
optdepends=("mpd")
makedepends=("go")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz"
	"ymuse.desktop"
	"gotk3.patch"
)
sha512sums=(
	"3beefe0582df71f06c1da9e27d9daf3c8abc259c7d153ec645f571e89eef4339d114317eafc7f0cbf302053355347c0865e50d02df684180704d4cfa8789b8e8"
	"dbf124b2be06036faecb0a5af76b6b44bfdfcd7461c69807a6fcfb3008131072412387e888d9c6777ef9549aa2ae1fafb296d904a9b525dff4b09cc36400a6ff"
	"10aeae92246376ea4e90ba0180e4c677b32dfd831d54722bf8fa9a7ed4c6d54882f87befda3973482dcf9af081e6a5ec9d0d50167c171d14f2b4ab64326a75ca"
)

prepare() {
	cd "${pkgname}-${pkgver}"

	# Use newer version
	# The included gotk3 version does does not support recent go releases
	# See https://github.com/gotk3/gotk3/issues/726
	patch -p1 < ../gotk3.patch
}


build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "${pkgname}-${pkgver}"
	go generate
	go build -ldflags "-s -w -X main.version=${pkgver} -X main.date=$(date --iso-8601=seconds)"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ymuse "${pkgdir}/usr/bin/ymuse"

	for file in $(find resources/icons -type f); do
		install -Dm644  ${file} "${pkgdir}"/usr/share/icons/${file#resources/icons}
	done

	for file in $(find resources/i18n -type f -name *.mo); do
		install -Dm644  ${file} "${pkgdir}"/usr/share/locale/${file#resources/i18n/generated}
	done

	install -Dm644 "${srcdir}"/ymuse.desktop -t "${pkgdir}"/usr/share/applications/
}
