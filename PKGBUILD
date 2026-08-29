# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=1.21.0
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience, forked from cinny.'
url=https://github.com/SableClient/Sable
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"https://github.com/SableClient/Sable/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('25218f5d1875165d7d934c270503ac9debe9f97e149e88eba4111d296d3e0fef3f05deb9578fcfc1d70deea48b650e9360fb5cf8176115d4ca200a0dd3170603')

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
