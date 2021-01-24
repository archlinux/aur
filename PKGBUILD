# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-git
pkgver=r4370.89d25ed1
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/libadalang/'
arch=('any')
license=('GPL')

depends=('gcc-ada' 'gprbuild' 'gnatcoll-core' 'gnatcoll-iconv' 'gnatcoll-gmp'
         'langkit')
makedepends=('git')

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

    python manage.py generate

    # Build Libadalang both as a static library and as a shared one. Ask not to
    # use rpath (-R), but that only makes sense for the shared library, so
    # build in two steps: once for shared lib (+ mains), and once for static
    # lib.
    python manage.py build \
        --library-types static,static-pic,relocatable \
        --build-mode=prod \
        --gargs="-R"
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    # Install the Ada library with its C binding
    python manage.py install \
        --library-types static,static-pic,relocatable \
        --build-mode=prod \
        "$pkgdir/usr"

    # Install the Python binding
    cd build/python
    python setup.py install --root="$pkgdir"
}
