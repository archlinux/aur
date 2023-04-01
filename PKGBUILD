# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Bartłomiej Piotrowski <spam@bpiotrowski.pl>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>

pkgname=ocaml-lablgl
pkgver=1.06
pkgrel=12
pkgdesc='OCaml interface to OpenGL'
url="https://github.com/garrigue/lablgl"
arch=('x86_64')
license=('BSD')
depends=('glu' 'glut' 'libxi' 'libxmu' 'libgl' 'ocaml>=4.14.0')
options=('!strip' '!makeflags' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d11852cbdbd40a14a22b30a218d009033c810de461e5717582f5dbe480296a7a')

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
