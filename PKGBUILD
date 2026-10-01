# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=1.22.11
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience, forked from cinny.'
url=https://github.com/SableClient/Sable
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"https://github.com/SableClient/Sable/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ddc6eb0ca6f7846cd156a2ce07c5aeb0a4058ad23d3e41c54666d5936e28fea4f070ff76d0fbbc1764c549dea54326e03ed0eee671df19e0ee59bd00f370d1af')

prepare() {
        cd "${srcdir}"/"Sable-${pkgver}"

        mise install
        mise run setup
}

build() {
	if [ ! ${sableBase} ]; then
		sableBase='/'
	fi
	sed -i "s|/|${sableBase}|g" "${srcdir}"/"Sable-${pkgver}"/build.config.ts
	cd "Sable-${pkgver}"

        mise run build
}

package() {
	backup=('etc/webapps/sable/config.json')
	cd "Sable-${pkgver}"
	install -d "$pkgdir/usr/share/webapps/sable"
	cp -r dist/* "$pkgdir/usr/share/webapps/sable"
	install -d "$pkgdir/etc/webapps/sable"
	mv "${pkgdir}/usr/share/webapps/sable/config.json" \
		"${pkgdir}/etc/webapps/sable/config.json"
	ln -sfr "${pkgdir}/etc/webapps/sable/config.json" \
		"${pkgdir}/usr/share/webapps/sable/config.json"
}
