# Maintainer: Alyssa Haroldsen <kupiakos@gmail.com>

pkgname=hivex-git
pkgver=1.3.15.r1.891c426
pkgrel=1
pkgdesc="System for extracting the contents of Windows Registry - git checkout"
conflicts=('hivex')
provides=('hivex')
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("LGPL2.1")
depends=("libxml2" "perl")
makedepends=("git" "python2" "ruby" "perl-io-stringy" "perl-test-simple" "ocaml-findlib" "ocaml")
optdepends=("python2: for python bindings"
        "ruby: for ruby bindings"
        "ocaml: for ocaml bindings")
options=("!emptydirs" "!libtool")
source=("git+https://github.com/libguestfs/hivex.git")
md5sums=('SKIP')

build() {
    cd hivex/
    unset PREFIX
    unset PERL_MM_OPT
    BUILDDIR= ./autogen.sh \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --prefix=/usr \
    --disable-rpath \
    --disable-static PYTHON=python2
    make
}

package() {
    cd hivex/
    make DESTDIR="$pkgdir" install
}

pkgver() {
    cd hivex/
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

