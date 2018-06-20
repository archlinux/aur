# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=1.4.9
pkgrel=1
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
            'd058af6ab4ae9edbd2d646cacdfdacb1ab77462f21ed70f54b78d9c275d7225a')

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
