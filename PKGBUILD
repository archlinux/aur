# Maintainer: Georg Graßnick <dev.grassnick at mailbox dot org>

pkgname=ymuse
pkgver=0.8
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
	"c62ac661e3cc489203476089512e19144f09f93fdf08d1acf11bd847ea1cdf27488ab9754228f1982323cb65b4e34b63fb76446fd66cf2e2d9b0678c8e969c2e"
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
