# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=swish-cplint-bin
pkgver=r1789.2563692
pkgrel=1
pkgdesc="SWI-Prolog for SHaring: a SWI-Prolog web IDE integrated with the cplint suite - precompiled version"
arch=('x86_64')
url="https://github.com/friguzzi/swish"
license=('BSD')
depends=('libxinerama'
         'libxpm'
         'git'
         'graphviz'
         'swi-prolog-devel'
         'rserve-sandbox-docker-bin')
makedepends=('git'
             'sed'
             'unzip'
             'curl')
conflicts=('swish'
           'swish-cplint')
install=.install
source=('git+https://github.com/friguzzi/swish#branch=master')
md5sums=('SKIP')

build() {
    cd ${srcdir}/swish
    # Unzip in swish/web/bower_components
    curl -o swish-bower-components.zip \
        http://www.swi-prolog.org/download/swish/swish-bower-components.zip
    unzip swish-bower-components.zip
    rm -rf swish-bower-components.zip
    # Patch
    cp ../../run.pl .
    cp ../../run.sh .
    cp ../../install_web_iface_deps.pl .
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
    install -d "${pkgdir}"/usr/share/"${pkgname%-bin}"
    install -d "${pkgdir}"/usr/bin
    cp -r swish/* "${pkgdir}"/usr/share/"${pkgname%-bin}"
    install -D -m644 swish/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname%-bin}"/LICENSE
    install -D -m644 ../"${pkgname%-bin}".service ${pkgdir}/usr/lib/systemd/system/"${pkgname%-bin}".service
    ln -s /usr/share/"${pkgname%-bin}"/run.sh "${pkgdir}"/usr/bin/"${pkgname%-bin}"
}
