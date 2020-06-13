# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=langkit-git
pkgver=r6816.55fe04716
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
    #
    # TODO: build & install static libraries. For now, this fails because
    # auto-initialized static libraries are built using partial linking (ld's
    # -r option), which conflicts with GCC's by default -pie option.
    python scripts/build-langkit_support.py generate
    python scripts/build-langkit_support.py \
        --library-types relocatable \
        build --build-mode=prod --gargs="-R"
}

package()
{
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir"

    python scripts/build-langkit_support.py \
        --library-types relocatable \
        install --build-mode=prod "$pkgdir/usr"
}
