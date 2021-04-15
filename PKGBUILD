# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=2.1.1
pkgrel=1
pkgdesc="High-performance MySQL proxy with a GPL license"
arch=('x86_64' 'amd64')
url="http://proxysql.com"
_github_url="https://github.com/sysown/proxysql"
license=('GPL')
makedepends=('cmake' 'automake' 'bzip2' 'make' 'gcc' 'git' 'patch' 'python2')
depends=('openssl' 'gnutls')
provides=('proxysql')
backup=("etc/proxysql.cnf")
source=("https://github.com/sysown/${pkgname}/archive/v${pkgver}.tar.gz"
    "proxysql.sysusers"
    "shared-libs.patch"
    "proxysql.tmpfiles")
sha256sums=('182483b33c879572bbf78bda0efb1b890485c847fac11c2106f2b3357355001a'
            '8b074c0d72e4b66349a84a13fdb65918145fcaf6a8697ba99304bd603d097735'
            'f8fa05ccbb75974c38d845ee70c3ec3e801c4cb4a7e04c05789ce25f4da9c0c8'
            '6f48bd54c6b8592cd84006e991d3cbd8b38a460c6e72091acdca05f6781ae380')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/shared-libs.patch"
}

build() {
    export GIT_VERSION=$(git --version | awk '{print $NF}')
    cd "${pkgname}-${pkgver}"
    make cleanall
    make
}

package() {
    install -Dm 0755 "${srcdir}/${pkgname}-${pkgver}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 0644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/etc/${pkgname}.cnf" "${pkgdir}/etc/${pkgname}.cnf"
}
