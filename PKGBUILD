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
            'a807e7d48cc90cd5bf2a343b25f773ebe972775233c8491fb1389fb03005bf1db80bdf5cb22c93e69924a29e4b1e389ffaac3a0d4ecbfc13d74c0027973fda58')

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
