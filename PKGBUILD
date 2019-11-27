# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=2.0.8
pkgrel=1
pkgdesc="High-performance MySQL proxy with a GPL license"
arch=('x86_64' 'amd64')
url="http://proxysql.com"
_github_url="https://github.com/sysown/proxysql"
license=('GPL')
makedepends=('cmake' 'automake' 'bzip2' 'make' 'gcc' 'git' 'openssl' 'patch')
depends=('openssl')
provides=('proxysql')
source=("https://github.com/sysown/${pkgname}/archive/v${pkgver}.tar.gz"
	"proxysql.sysusers"
	"proxysql.tmpfiles")
sha256sums=('06493dce04e29e81c5e1085070e8c0762f6900b8ab7055b0f80dc78a038e0861'
            '8b074c0d72e4b66349a84a13fdb65918145fcaf6a8697ba99304bd603d097735'
            '6f48bd54c6b8592cd84006e991d3cbd8b38a460c6e72091acdca05f6781ae380')

build() {
	cd "${pkgname}-${pkgver}"
	make cleanall
	make
}

package() {
	install -Dm 0755 "${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -o "${pkgname}" -g "${pkgname}" -Dm 0600 "${pkgname}-${pkgver}/etc/${pkgname}.cnf" "${pkgdir}/etc/${pkgname}.cnf"
	install -Dm 0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
