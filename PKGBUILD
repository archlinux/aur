# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=1.22.6
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience, forked from cinny.'
url=https://github.com/SableClient/Sable
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"https://github.com/SableClient/Sable/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6ab7a35f3fe33aa57626d7bdfca3fff45270d96613ffede7f6465dd037eae52ee25f99c0f1012994b61b6ad17451dd34b5745257bac24e9d6ca7fec0f87552ac')

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
