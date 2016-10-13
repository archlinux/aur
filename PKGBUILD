# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=swish-cplint
pkgver=r8.13b29c6
pkgrel=4
pkgdesc="SWI-Prolog for SHaring: a SWI-Prolog web IDE integrated with the cplint suite"
arch=('x86_64')
url="https://github.com/friguzzi/swish"
license=('BSD')
depends=('swi-prolog-devel'
         'r')
makedepends=('git'
             'bower'
             'sed')
conflicts=('swish')
install=.INSTALL
source=('git://github.com/friguzzi/swish#branch=master')
md5sums=('SKIP')

prepare() {
    # Edit the .INSTALL script.
    sed \
    -e "s@startdir=.*@startdir="${startdir}"@" \
    -i ${startdir}/.INSTALL
}

build() {
    cd ${srcdir}/swish
    bower --allow-root install
    make src
    # Patch
    cp ${startdir}/run.pl .
    cp ${startdir}/run.sh .
}

pkgver () {
    cd ${srcdir}/swish
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -r swish/* ${pkgdir}/usr/share/${pkgname}
    install -D -m644 swish/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ${startdir}/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -D -m644 ${startdir}/${pkgname}.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    ln -s /usr/share/${pkgname}/run.sh ${pkgdir}/usr/bin/${pkgname}
}
