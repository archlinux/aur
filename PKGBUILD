# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=1.17.0
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience, forked from cinny.'
url=https://github.com/SableClient/Sable
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(pnpm)

source=(sable-${pkgver}.tar.gz::"https://github.com/SableClient/Sable/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('11ea0b57632d77bf1a8e3754ec0a4be6a014e039f303f6a8a00ab7e4b096b48184a8b487c13ffc2096af2c30942182fa35ff5acee3c6946cc8bd9d0be597bcc5')

prepare() {
	cd "sable-${pkgver}"
	pnpm i
}

build() {
	if [ ! ${sableBase} ]; then
		sableBase='/'
	fi
	sed -i "s|/|${sableBase}|g" "${srcdir}"/"sable-${pkgver}"/build.config.ts
	cd "sable-${pkgver}"

	pnpm run build
}

package() {
	backup=('etc/webapps/sable/config.json')
	cd "sable-${pkgver}"
	install -d "$pkgdir/usr/share/webapps/sable"
	cp -r dist/* "$pkgdir/usr/share/webapps/sable"
	install -d "$pkgdir/etc/webapps/sable"
	mv "${pkgdir}/usr/share/webapps/sable/config.json" \
		"${pkgdir}/etc/webapps/sable/config.json"
	ln -sfr "${pkgdir}/etc/webapps/sable/config.json" \
		"${pkgdir}/usr/share/webapps/sable/config.json"
}
