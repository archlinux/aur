# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname="pqlx"
pkgver=2011.365.P4 
pkgrel=1
pkgdesc="An open-source software for evaluating seismic station performance and data quality."
arch=('i686' 'x86_64')
url='http://ds.iris.edu/ds/nodes/dmc/software/downloads/pqlx'
license=('custom')
depends=('gtk2' 'libtirpc' 'mariadb')
makedepends=("python2-virtualenv")
source=("https://ds.iris.edu/pub/programs/${pkgname}/PQLX.v${pkgver}.tar.bz2"
        "profile.d_pqlx.sh"
        "systemd_sysusers.d_pqlx.conf"
        "systemd_tmpfiles.d_pqlx.conf")
sha256sums=('60d045e0b0b45c1afaaaa19216019b5221a9f6d068a11aede8385c2dc9952573'
            'aa600c8360e19e39633b0a59c753491ef90f1dc1c939a1f305e769398f819f3c'
            '3a3ec5aa8a38d807896beee3decd6ea6212ae430129c670d0fc1db2fce7d76fd'
            '13ec352bb4db152ff8adb1a865595058fa0f1a0788484683bf90d669ccde3e03')
install=$pkgname.install

prepare() {
  cd v${pkgver}/PQLX
  cp env/mysql.vars.sample env/mysql.vars
  sed -i 's/uname -i/uname -m/' env/makeVars
  sed -i 's/PKGCFG=`pkg-config --cflags gtk+-2.0 cairo`/PKGCFG=`pkg-config --cflags gtk+-2.0 cairo libtirpc`/' src/utils/data/makefile
  sed -i 's/PKGCFGL=`pkg-config --libs gio-2.0 gtk+-2.0 gthread-2.0`/PKGCFGL=`pkg-config --libs gio-2.0 gtk+-2.0 gthread-2.0 libtirpc`/' src/srvr/pqlxSrvr/makefile
  sed -i 's/PKGCFGL=`pkg-config --libs gtk+-2.0 gthread-2.0`/PKGCFGL=`pkg-config --libs gtk+-2.0 gthread-2.0 libtirpc`/' src/clnt/PQLX/makefile
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
  install -d ${pkgdir}/opt/pqlx/{PROD,docs}
  install -d ${pkgdir}/usr/bin/
  cp -a "${srcdir}"/v${pkgver}/PQLX/{PROD,docs} ${pkgdir}/opt/pqlx/ 
  install -Dm644 "${srcdir}"/profile.d_${pkgname}.sh \
                 "${pkgdir}"/etc/profile.d/${pkgname}.sh
  install -Dm644 "${srcdir}"/systemd_sysusers.d_${pkgname}.conf \
                 "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}"/systemd_tmpfiles.d_${pkgname}.conf \
                 "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  ln -s /opt/pqlx/PROD/bin/LINUX/pqlx        ${pkgdir}/usr/bin/
  ln -s /opt/pqlx/PROD/bin/LINUX/pqlx-admin  ${pkgdir}/usr/bin/
  ln -s /opt/pqlx/PROD/bin/LINUX/pqlxDBMaint ${pkgdir}/usr/bin/
  ln -s /opt/pqlx/PROD/bin/LINUX/pqlxPNG     ${pkgdir}/usr/bin/
  ln -s /opt/pqlx/PROD/bin/LINUX/pqlxSrvr    ${pkgdir}/usr/bin/
  ln -s /opt/pqlx/PROD/bin/LINUX/importTT    ${pkgdir}/usr/bin/
}
# vim:set ts=2 sw=2 et:
