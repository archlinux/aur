# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=2.4.5
pkgrel=1
pkgdesc="High-performance MySQL proxy with a GPL license"
arch=('x86_64' 'amd64')
url="http://proxysql.com"
_github_url="https://github.com/sysown/proxysql"
license=('GPL')
makedepends=('cmake' 'automake' 'bzip2' 'make' 'gcc' 'git' 'patch' 'python')
depends=('openssl' 'gnutls')
provides=('proxysql')
backup=("etc/proxysql.cnf")
source=("https://github.com/sysown/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "proxysql.sysusers"
    "shared-libs.patch"
    "proxysql.tmpfiles")
sha256sums=('5fcd3f430f65dd9387d6f166b8dea5947ca89ed141c48e301ab4018aad4e17ae'
            '8b074c0d72e4b66349a84a13fdb65918145fcaf6a8697ba99304bd603d097735'
            'f28bef1b1f9763afe2929ff5f01b9f04c42a606086d5aaa627523cf5f81fb21d'
            '6f48bd54c6b8592cd84006e991d3cbd8b38a460c6e72091acdca05f6781ae380')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/shared-libs.patch"
}

build() {
    export GIT_VERSION=$(git --version | awk '{print $NF}')
    sed -i -e 's@^\(\s\+cd curl/curl \&\& ./configure .*\) \(--with-ssl=.*\)$@\1 --without-zstd \2@' ${pkgname}-${pkgver}/deps/Makefile
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
