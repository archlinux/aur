# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>

pkgname=codimd
pkgver=1.6.0
pkgrel=1
pkgdesc="real-time collaborative markdown notes"
arch=('any')
url="https://demo.codimd.org/"
license=('AGPL3')
depends=('nodejs>=8.5' 'npm')
optdepends=('postgresql: database'
            'mariadb: database'
						'sqlite: database')
makedepends=('yarn' 'bash')
backup=("opt/${pkgname}/config.json" "opt/${pkgname}/.sequelizerc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codimd/server/archive/${pkgver}.tar.gz"
        "sysusers.conf"
        "codimd.service")
sha512sums=('50ebf76c365e821c8aec675a975000bf920b44bed939493ea0956ec621aa80ae33a3664654f7d01437f4f5864a73028a635fc11753c229808863c519c5a39998'
            '3de436650b33f272c7229ae2d336cfcbc2f06ae095bc2fad4b72a86f84283511ad79930b6f0d88acf371215f4784b9625f5da8bdd1331b41241d2fb849b7c646'
            '85deb726c8b8d0cde43544b809e26273c901f0e006f502e3452f177ddf1dd393686d54510c2d986662dbbe3b68a33c8f03c8edc21d555a4869835fa4b986851f')

build()
{
	cd "server-${pkgver}"
	bin/setup
	yarn run build
}

package()
{
	install -m0755 -d "${pkgdir}/opt"
	cp -r "server-${pkgver}" "${pkgdir}/opt/${pkgname}"

	install -Dm0644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" codimd.service
}
