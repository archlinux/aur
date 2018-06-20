# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=1.4.9
pkgrel=2
pkgdesc="High-performance MySQL proxy with a GPL license"
arch=('x86_64' 'amd64')
url="http://proxysql.com"
license=('GPL')
makedepends=('cmake' 'automake' 'bzip2' 'make' 'gcc' 'git' 'openssl' 'patch')
depends=('openssl')
provides=('proxysql')
source=("https://github.com/sysown/${pkgname}/archive/v${pkgver}.tar.gz"
        "curl.patch")
sha256sums=('28ee75735716ab2e882b377466f37f5836ce108cfcfe4cf36f31574f81cce401'
            'dda1b8905f6192917b7b1d73148580d3f8c31a3011cc2699ef48189cc981d5fa')

build() {
	cd "${pkgname}-${pkgver}"
        patch -p1 "./deps/Makefile" < "${srcdir}/curl.patch"
        make cleanall
        make
}

package() {
        useradd mysql
        groupadd mysql
        install -Dm 0755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -Dm 0600 "${srcdir}/${pkgname}-${pkgver}/etc/${pkgname}.cnf" "${pkgdir}/etc/${pkgname}.cnf"
        mkdir -p "${pkgdir}/var/lib/${pkgname}" 
        install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
