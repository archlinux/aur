# Contributor: Matthew McGinn <mamcgi@gmail.com>
pkgname=proxysql
pkgver=2.1.0
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
# This patch pulled from GitHub is too big for the AUR, so need to pull it externally from author's GH.
# Pending this issue: https://github.com/sysown/proxysql/issues/2561
source=("https://github.com/sysown/${pkgname}/archive/v${pkgver}.tar.gz"
    "proxysql.sysusers"
    "https://raw.githubusercontent.com/xginn8/aur-bldr/master/patches/${pkgname}/libinjection_python_port.patch"
    "proxysql.tmpfiles")
sha256sums=('990413afe5999d4b573b855cc0ba6761df2e8e386cf74b4a49e179ef26fe0104'
            '8b074c0d72e4b66349a84a13fdb65918145fcaf6a8697ba99304bd603d097735'
            'fadc103f88e699d0920f617ad9982a76504673a00aba0e2d4c0223bbc9a1a4a6'
            '6f48bd54c6b8592cd84006e991d3cbd8b38a460c6e72091acdca05f6781ae380')

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
