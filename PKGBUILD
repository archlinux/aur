# Maintainer: Georg Graßnick <dev.grassnick at mailbox dot org>

pkgname=ymuse
pkgver=0.16
pkgrel=1
pkgdesc="Easy, functional, and snappy client for Music Player Daemon"
arch=(x86_64)
url="https://yktoo.com/en/software/ymuse/"
license=("Apache")
depends=("gtk3")
optdepends=("mpd")
makedepends=("go")
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/yktoo/${pkgname}/archive/v${pkgver}.tar.gz"
	"ymuse.desktop"
)
sha512sums=(
	"25e3233641fe23001b08e49f37765d091c71564c43284c10faacbba77fe327322daf56d58fffec0f0324a50e096f76b0cc0591fa01e3428f6af7e59cb6a8003f"
	"dbf124b2be06036faecb0a5af76b6b44bfdfcd7461c69807a6fcfb3008131072412387e888d9c6777ef9549aa2ae1fafb296d904a9b525dff4b09cc36400a6ff"
)

build() {
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
