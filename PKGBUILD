# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=rserve-sandbox-docker
pkgver=r23.845f51c
pkgrel=1
pkgdesc="Docker spec for running Rserve in a sandbox"
arch=('x86_64')
url="https://github.com/frnmst/rserve-sandbox"
license=('BSD')
depends=('r'
         'docker')
makedepends=('git'
             'sed')
install=.INSTALL
source=('git://github.com/frnmst/rserve-sandbox#branch=distro-package')
md5sums=('SKIP')

pkgver () {
    cd ${srcdir}/rserve-sandbox
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd ${srcdir}
    install -d ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/bin
    install -D -m644 rserve-sandbox/Makefile ${pkgdir}/opt/${pkgname}/Makefile
    install -D -m644 rserve-sandbox/Dockerfile.in ${pkgdir}/opt/${pkgname}/Dockerfile.in
    install -D -m644 rserve-sandbox/Rserv.conf ${pkgdir}/opt/${pkgname}/Rserv.conf
    install -D -m644 rserve-sandbox/Rserv.sh ${pkgdir}/opt/${pkgname}/Rserv.sh
    install -D -m644 rserve-sandbox/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m755 ${startdir}/run.sh ${pkgdir}/opt/${pkgname}/run.sh
    install -D -m644 ${startdir}/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 ${startdir}/${pkgname}.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    ln -s /opt/${pkgname}/run.sh ${pkgdir}/usr/bin/${pkgname}
}
