# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=rserve-sandbox-docker
pkgver=r31.d7e1235
pkgrel=1
pkgdesc="Docker spec for running Rserve in a sandbox"
arch=('x86_64')
url="https://github.com/frnmst/rserve-sandbox"
license=('BSD')
depends=('sed'
         'r'
         'docker')
makedepends=('git'
             'sed')
conflicts=('rserve-sandbox-docker-bin')
install=.install
source=('git+https://github.com/frnmst/rserve-sandbox#branch=distro-package')
md5sums=('SKIP')

pkgver () {
    cd "${srcdir}"/rserve-sandbox
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}"/usr/share/"${pkgname}"
    install -d "${pkgdir}"/usr/bin
    install -D -m644 rserve-sandbox/Makefile "${pkgdir}"/usr/share/"${pkgname}"/Makefile
    install -D -m644 rserve-sandbox/Dockerfile.in "${pkgdir}"/usr/share/${pkgname}/Dockerfile.in
    install -D -m644 rserve-sandbox/Rserv.conf "${pkgdir}"/usr/share/${pkgname}/Rserv.conf
    install -D -m644 rserve-sandbox/Rserv.sh "${pkgdir}"/usr/share/${pkgname}/Rserv.sh
    install -D -m644 rserve-sandbox/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -D -m755 ../run.sh "${pkgdir}"/usr/share/${pkgname}/run.sh
    install -D -m644 ../${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
    ln -s /usr/share/"${pkgname}"/run.sh "${pkgdir}"/usr/bin/"${pkgname}"
}
