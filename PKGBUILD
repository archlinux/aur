# Maintainer: John Williams <john@pond-weed.com>

# The db2 tarball must be downloaded manually from the IBM website;
# this cannot be done automatically as it is necessary to click
# through a license agreement before downloading it.

# To use the db2 program, add yourself to the 'db2inst1' group.

pkgname=db2exc
pkgver=10.5
pkgrel=3
pkgdesc="DB2 Express-C"
arch=('x86_64')
url="http://www.ibm.com/software/data/db2/express-c"
license=('custom')
depends=('libaio')
install=${pkgname}.install
source=(http://download/file/from/ibm/v10.5_linuxx64_expc.tar.gz
        db2exc.conf
        db2exc.csh
        db2exc.service
        db2exc.sh
        license.html)
md5sums=('b307321bf1f51c20640addfb1afad05d'
         '6bc57e81ed02f74eb2f5f3148b13fa03'
         '7f984d8fde09cf16b234dd83e42cc5d3'
         '3eedcb459005dbb718ba7b359339b26e'
         'fe35dc51c68a9cf6da46d56099459b3c'
         '2c0aeb211fc087d15cd9fdac5b77e762')

package() {
  cd ${srcdir}

  # the initial installation directory is hard-coded in the binaries,
  # which causes errors during installation if the initial installation
  # directory still exists; hence the temporary directory and rename
  cat <<-EOF > db2exc.rsp
	PROD = EXPRESS_C
	FILE = ${pkgdir}/opt/db2.tmp
	LIC_AGREEMENT = ACCEPT
	INSTALL_TYPE = TYPICAL
	LANG = EN
	EOF
  expc/db2setup -f sysreq -r db2exc.rsp || true
  mv ${pkgdir}/opt/db2.tmp ${pkgdir}/opt/db2

  install -D -m 0644 db2exc.conf ${pkgdir}/etc/sysctl.d/db2exc.conf
  install -D -m 0644 db2exc.service ${pkgdir}/usr/lib/systemd/system/db2exc.service
  install -D db2exc.csh ${pkgdir}/etc/profile.d/db2exc.csh
  install -D db2exc.sh ${pkgdir}/etc/profile.d/db2exc.sh

  install -D -m 0644 license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
