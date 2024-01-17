# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>

pkgname=graywolf-git
pkgver=0.1.6.r185.f47937b
pkgrel=2
epoch=
pkgdesc='An opensource placement tool'
arch=('i686' 'x86_64')
url='https://github.com/rubund/graywolf/'
license=('GPL-2.0-or-later')
provides=('graywolf')
conflicts=('graywolf')
depends=('bash' 'glibc' 'gsl' 'libx11')
makedepends=('cmake' 'git')
source=("git+https://github.com/rubund/graywolf")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "0.1.6.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    # Define C_FLAGS and CXX_FLAGS for ignoring a problem with global
    # variables
    # See https://github.com/rubund/graywolf/issues/43
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="-fcommon" \
        -DCMAKE_CXX_FLAGS="-fcommon" \
        -B build
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    DESTDIR="${pkgdir}" cmake --install build
    ln -s flow.noroute "${pkgdir}"/usr/lib/graywolf/bin/flow/flow
}
