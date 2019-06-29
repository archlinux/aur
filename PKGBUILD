# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-git
pkgver=r3538.96dd59ff
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/libadalang/'
arch=('any')
license=('GPL')

depends=('gcc-ada' 'gprbuild' 'gnatcoll-core' 'gnatcoll-iconv' 'gnatcoll-gmp')
makedepends=('git' 'langkit')

provides=('libadalang')
conflicts=('libadalang')

source=('git+https://github.com/AdaCore/libadalang.git')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/${pkgname%-git}"

    # In order to build the generated library, Langkit expects the QUEX_PATH to
    # be set.
    source /etc/profile.d/quex.sh

    # Clang has trouble compiling the Quex-generated lexer, so make sure
    # GPRbuild chooses GCC.
    gprconfig -o config.cgpr --batch --config=c,,,,GCC --config=ada,,,,

    python2 ada/manage.py --no-langkit-support generate

    # Build Libadalang both as a static library and as a shared one. Ask not to
    # use rpath (-R), but that only makes sense for the shared library, so
    # build in two steps: once for shared lib (+ mains), and once for static
    # lib.
    #
    # TODO: build & install static libraries. For now, this fails because
    # auto-initialized static libraries are built using partial linking (ld's
    # -r option), which conflicts with GCC's by default -pie option.
    python2 ada/manage.py \
        --library-types relocatable --no-langkit-support \
        build --build-mode=prod --gargs="-R --config=$PWD/config.cgpr"
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    # Install the Ada library with its C binding
    python2 ada/manage.py \
        --library-types relocatable --no-langkit-support \
        install "$pkgdir/usr"

    # Install the Python binding
    cd build/python
    python2 setup.py install --root="$pkgdir"
}
