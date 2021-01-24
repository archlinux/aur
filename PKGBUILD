# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=langkit-git
pkgver=r7153.b32ae90dc
pkgrel=1

pkgdesc='Compiler for syntactic and semantic language analysis libraries'
url='https://github.com/AdaCore/langkit/'
arch=('any')
license=('GPL')

depends=('gcc-ada' 'gprbuild' 'gnatcoll-core' 'gnatcoll-iconv' 'autopep8'
         'python-psutil' 'python-sphinx' 'python-yaml' 'python-docutils'
         'python-e3-core' 'python-funcy' 'python-mako' 'yapf')
makedepends=('git')

provides=('langkit')
conflicts=('langkit')

source=('git+https://github.com/AdaCore/langkit.git')
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

    # Make the Langkit Python package tree available for import
    export PYTHONPATH="$srcdir/${pkgname%-git}"

    # Build the Langkit_Support library, used by all Langkit-generated
    # libraries.
    python manage.py build-langkit-support \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod \
        --gargs="-R"
}

package()
{
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir"

    python manage.py install-langkit-support \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod \
        "$pkgdir/usr"
}
