# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=1.20.0
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience, forked from cinny.'
url=https://github.com/SableClient/Sable
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(pnpm nvm)

source=(sable-${pkgver}.tar.gz::"https://github.com/SableClient/Sable/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5d89702e4a62086f33eb1961b47cf4aca2acd3e852604a02c730b1cdbe6d110c54b5b9f413312dfb6b7faee238e477fac22cb77e56d631966f7d45ac0f6ea4d4')

prepare() {
        source /usr/share/nvm/init-nvm.sh

        cd "${srcdir}"/"Sable-${pkgver}"

        nvm install
        nvm use

	pnpm i
}

build() {
	if [ ! ${sableBase} ]; then
		sableBase='/'
	fi
	sed -i "s|/|${sableBase}|g" "${srcdir}"/"Sable-${pkgver}"/build.config.ts
	cd "Sable-${pkgver}"

        source /usr/share/nvm/init-nvm.sh
        nvm use 24

	pnpm run build
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
