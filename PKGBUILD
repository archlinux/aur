# Maintainer: Lance Roy <ldr709@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Bartłomiej Piotrowski <spam@bpiotrowski.pl>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=ocaml-lablgl
pkgver=1.07
pkgrel=1
pkgdesc='OCaml interface to OpenGL'
url="https://github.com/garrigue/lablgl"
arch=('x86_64')
license=('BSD')
depends=('camlp-streams' 'glu' 'glut' 'libxi' 'libxmu' 'libgl' 'ocaml>=4.14.0')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('845477ed8d5aeaad63907a9edfc1d8f8d62b932c6e37a32502926ee402a6271f')

prepare() {
    cd "${srcdir}"/lablgl-${pkgver}

    printf 'RANLIB = :\n' > Makefile.config
    printf 'GLLIBS = -lGL -lGLU\n' >> Makefile.config
    printf 'GLUTLIBS = -lglut\n' >> Makefile.config
}

build() {
  cd "${srcdir}"/lablgl-${pkgver}

  make lib
  make libopt
}

package() {
    cd "${srcdir}"/lablgl-${pkgver}

    # Install routines are broken and don't ensure this is created first.
    mkdir -p "${pkgdir}"/usr/lib/ocaml/stublibs

    make install BINDIR="${pkgdir}/usr/bin/" \
                 LIBDIR="${pkgdir}/usr/lib/ocaml/" \
                 DDLDIR="${pkgdir}/usr/lib/ocaml/stublibs/" \
                 INSTALLDIR="${pkgdir}/usr/lib/ocaml/lablGL/"

    install -Dm644 src/lablgl.cmxa "${pkgdir}"/usr/lib/ocaml/lablgl.cmxa
    install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
