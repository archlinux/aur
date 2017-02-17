# Maintainer: Franco Masotti <franco dot masotti at student dot unife dot it>
# Contributor: Franco Masotti <franco dot masotti at student dot unife dot it>
pkgname=rserve-sandbox-docker-bin
pkgver=r6.fb0ec65
pkgrel=1
pkgdesc="Pre-compiled version of a Docker spec for running Rserve in a sandbox"
arch=('x86_64')
url="https://gitlab.com/frnmst/rserve-sandbox-bin"
license=('BSD')
depends=('r'
         'docker')
makedepends=('git'
             'sed')
conflicts=('rserve-sandbox-docker')
install=.install
source=('git+https://gitlab.com/frnmst/rserve-sandbox-bin#branch=distro-package')
md5sums=('SKIP')

pkgver () {
    cd "${srcdir}"/rserve-sandbox-bin
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}"
    install -d "${pkgdir}"/usr/share/"${pkgname%-bin}"
    install -d "${pkgdir}"/usr/bin
    install -D -m644 rserve-sandbox-bin/Makefile "${pkgdir}"/usr/share/"${pkgname%-bin}"/Makefile
    install -D -m644 rserve-sandbox-bin/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname%-bin}/LICENSE
    install -D -m644 rserve-sandbox-bin/rserve.tar "${pkgdir}"/usr/share/${pkgname%-bin}/rserve.tar
    install -D -m755 ../run.sh "${pkgdir}"/usr/share/${pkgname%-bin}/run.sh
    install -D -m644 ../${pkgname%-bin}.service "${pkgdir}"/usr/lib/systemd/system/"${pkgname%-bin}".service
    ln -s /usr/share/"${pkgname%-bin}"/run.sh "${pkgdir}"/usr/bin/"${pkgname%-bin}"
}
