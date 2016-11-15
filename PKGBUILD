# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=swish
pkgver=r1124.071295b
pkgrel=3
pkgdesc="SWI-Prolog for SHaring: a SWI-Prolog web IDE"
arch=('x86_64')
url="https://github.com/SWI-Prolog/swish"
license=('BSD')
depends=('libxinerama'
         'libxpm'
         'swi-prolog-devel')
makedepends=('git'
             'bower'
             'sed')
conflicts=('swish-cplint')
install=.install
source=('git+https://github.com/SWI-Prolog/swish#branch=master')
md5sums=('SKIP')

build() {
    cd ${srcdir}/swish
    bower --allow-root install
    make src
    # Patch
    cp ../../run.pl .
    cp ../../run.sh .
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
    install -d "${pkgdir}"/usr/share/"${pkgname}"
    install -d "${pkgdir}"/usr/bin
    cp -r swish/* "${pkgdir}"/usr/share/"${pkgname}"
    install -D -m644 swish/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -D -m644 ../"${pkgname}".service ${pkgdir}/usr/lib/systemd/system/"${pkgname}".service
    ln -s /usr/share/"${pkgname}"/run.sh "${pkgdir}"/usr/bin/"${pkgname}"
}
