# $Id: PKGBUILD 308160 2017-10-17 17:36:56Z jelle $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=xsp
pkgver=4.7.1
pkgrel=1
pkgdesc="A simple webserver based on mono - provides ASP.NET support"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/mono/xsp"
depends=('mono' 'sqlite')
options=(!makeflags)
install=${pkgname}.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mono/xsp/archive/${pkgver}.tar.gz
        ${pkgname}.webapp
        ${pkgname}.service)
sha256sums=('cc0c6f4ab7de6a23764f1c3b4e4bb1838f6ea7d37143a02fd3e0e7e1369d6c64'
            'bcb208c3946ef49ae431a7be50c8effeb61228574b56d36e2c3c1cd9fe04fe02'
            '4760b3fa782e62890291c7d31e393ee51d18015f91a6fc21b4a928bae4f22f66')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${srcdir}/src/weird
  mkdir -p "${MONO_SHARED_DIR}"
 # import pathes
 # build
  cd ${srcdir}/${pkgname}-${pkgver}
  #sed -i 's|/bin/sh|\0\nexport MONO_PATH=${MONO_PATH}:/opt/mono/lib/mono/1.0|' scripts/script.in
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
 # tweak the xsp shellscript to grab system dll's
  for script in scripts/*2; do
    sed -i 's|/usr/lib/mono/1.0|/usr/lib/mono/2.0|' $script
  done
   #destdir related bugfixes
  sed -i 's|mkdir \$(datadir)|mkdir $(DESTDIR)$(datadir)|' test/2.0/treeview/Makefile
  sed -i 's|gif \$(datadir)|gif $(DESTDIR)$(datadir)|' test/2.0/treeview/Makefile
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
 # move test files from share to arch' default html home
  mkdir -p ${pkgdir}/srv/http/html
  mv ${pkgdir}/usr/lib/xsp/test ${pkgdir}/srv/http/html/xsp
  rm -rf ${pkgdir}/usr/share
  chown -R http:http ${pkgdir}/srv/http/html/${pkgname}

 # install a xsp configuration home
  install -D -m644 ${srcdir}/${pkgname}.webapp \
    ${pkgdir}/etc/${pkgname}/${pkgname}.webapp
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
 # install systemd service file
  install -D -m644 ${srcdir}/${pkgname}.service \
    ${pkgdir}/usr/lib/systemd/system/xsp.service
}
