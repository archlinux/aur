# Maintainer: Georg Graßnick <dev.grassnick at mailbox dot org>

pkgname=ymuse
pkgver=0.12
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
	"5c171427166469188f1a8c9c890b62e8d168c0b117585d0526013cc3d9c612c0b955b6023c35ccb88f98c3a597279840284a33f6438894c989651ba2efc5cb0e"
	"dbf124b2be06036faecb0a5af76b6b44bfdfcd7461c69807a6fcfb3008131072412387e888d9c6777ef9549aa2ae1fafb296d904a9b525dff4b09cc36400a6ff"
)

build() {
	cd "${pkgname}-${pkgver}"
	go generate
	go build
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
