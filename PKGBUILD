# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname="pqlx"
pkgver=2011.365.P1 
pkgrel=1
pkgdesc="An open-source software for evaluating seismic station performance and data quality."
arch=('i686' 'x86_64')
url='http://ds.iris.edu/ds/nodes/dmc/software/downloads/pqlx'
license=('custom')
depends=("gtk2>=2.14" "mysql>=5.0.18")
makedepends=("python2-virtualenv")
source=("http://PQLXtars:getPQLX@wush.net/svn/PQLX/tars/PQLX.v${pkgver}.tar.bz2")
md5sums=('1376629b35bf3b4ed7fefb321ff06170')
install=$pkgname.install

prepare() {
    cd ${srcdir}/v${pkgver}/PQLX
    cp env/mysql.vars.sample env/mysql.vars
    sed -i 's/uname -i/uname -m/' env/makeVars
}

build() {
    export PQLX=${srcdir}/v${pkgver}/PQLX
    virtualenv2 ${PQLX}
    source ${PQLX}/bin/activate
    bash ${PQLX}/env/makeAll
    sed -i 's:/\\\,//:/-MariaDB\\\,//:' ${PQLX}/PROD/bin/LINUX/initPQLXdb.sh
    sed -i 's:grep 5\.\*:sed -e s/-MariaDB\\\,//:' ${PQLX}/PROD/bin/LINUX/initPQLXdb.sh
}

package() {
    install -d ${pkgdir}/opt/pqlx
    install -d ${pkgdir}/usr/bin
    cp -a ${srcdir}/v${pkgver}/PQLX/{PROD,docs} ${pkgdir}/opt/pqlx/
    ln -s /opt/pqlx/PROD/bin/LINUX/pqlx ${pkgdir}/usr/bin/
    ln -s /opt/pqlx/PROD/bin/LINUX/pqlx-admin ${pkgdir}/usr/bin/
    ln -s /opt/pqlx/PROD/bin/LINUX/pqlxDBMaint ${pkgdir}/usr/bin/
    ln -s /opt/pqlx/PROD/bin/LINUX/pqlxPNG ${pkgdir}/usr/bin/
    ln -s /opt/pqlx/PROD/bin/LINUX/pqlxSrvr ${pkgdir}/usr/bin/
    ln -s /opt/pqlx/PROD/bin/LINUX/importTT ${pkgdir}/usr/bin/
}
