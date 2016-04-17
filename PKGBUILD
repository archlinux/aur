# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=policyd
pkgname=("policyd-mysql" "policyd-pgsql" "policyd-sqlite")
pkgver=2.0.14
pkgrel=1
pkgdesc="multi-platform policy server for popular MTAs"
url="http://wiki.policyd.org/start"
arch=('any')
license=('GPLv2')
optdepends=("php: for webui use")
install=policyd.install
source=("http://download.policyd.org/v${pkgver}/cluebringer-v${pkgver}.tar.xz")
md5sums=('e75cd25a836b316846f5ad8bf09a69a2')

_package() {
    _db=$1
    cd "${srcdir}/cluebringer-v${pkgver}"

    # configure database
    cd database
    for i in  core.tsql access_control.tsql quotas.tsql amavis.tsql checkhelo.tsql checkspf.tsql greylisting.tsql
    do 
        ./convert-tsql ${_db} $i
    done > policyd.${_db}
    install -Dm644 policyd.${_db} "${pkgdir}/usr/share/policyd/policyd-rules.${_db}"
    cd ..

    # executables
    mkdir -p "${pkgdir}/usr/bin"
    cp cbpadmin "${pkgdir}/usr/bin"
    cp cbpolicyd "${pkgdir}/usr/bin"

    # libs
    mkdir -p "${pkgdir}/usr/lib/"
    cp -R cbp "${pkgdir}/usr/lib/policyd-2.0"

    # config file
    install -Dm644 cluebringer.conf "${pkgdir}/etc/cluebringer.conf"

    # supplements
    mkdir -p "${pkgdir}/usr/share/policyd-2.0"
    cp -R webui "${pkgdir}/usr/share/policyd-2.0"
    cp -R contrib/httpd "${pkgdir}/usr/share/policyd-2.0"
    cp -R contrib/postfix "${pkgdir}/usr/share/policyd-2.0"
    cp -R contrib/amavisd-new "${pkgdir}/usr/share/policyd-2.0"

    #false
}

package_policyd-mysql(){
    conflicts=("policyd-pgsql" "policyd-sqlite")
    depends=("perl-net-cidr" "perl-net-server" "perl-config-inifiles"
             "perl-cache-fastmmap" "perl-mail-spf" "mysql")
    
    _package mysql
}

package_policyd-pgsql(){
    conflicts=("policyd-mysql" "policyd-sqlite")
    depends=("perl-net-cidr" "perl-net-server" "perl-config-inifiles"
             "perl-cache-fastmmap" "perl-mail-spf" "pgsql")

    _package pgsql
}

package_policyd-sqlite(){
    conflicts=("policyd-mysql" "policyd-pgsql")
    depends=("perl-net-cidr" "perl-net-server" "perl-config-inifiles"
             "perl-cache-fastmmap" "perl-mail-spf" "sqlite")

    _package sqlite
}
