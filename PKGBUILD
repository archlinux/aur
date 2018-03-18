# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=langkit-git
pkgver=r4926.893bb29e
pkgrel=1

pkgdesc='Compiler for syntactic and semantic language analysis libraries'
url='https://github.com/AdaCore/langkit/'
arch=('any')
license=('GPL')

depends=('gcc-ada' 'gprbuild' 'gnatcoll-core' 'gnatcoll-iconv'
         'quex-for_libadalang' 'autopep8' 'python-psutil' 'python-sphinx'
         'python-yaml' 'python2-docutils' 'python2-enum34' 'python2-funcy'
         'python2-mako' 'yapf')
makedepends=('git')

provides=('langkit')
conflicts=('langkit')

source=('git+https://github.com/AdaCore/langkit.git'
        'python2.patch')
sha1sums=('SKIP'
          '755fde34ecd1eeb2deeacf67148e22d2934ff6b4')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "$srcdir/${pkgname%-git}"
    patch -p0 -i "$srcdir/python2.patch"
}

build()
{
    cd "$srcdir/${pkgname%-git}"

    # Build the Langkit_Support library, used by all Langkit-generated
    # libraries.
    python2 scripts/build-langkit_support.py generate
    python2 scripts/build-langkit_support.py \
        --disable-static --enable-shared \
        build --build-mode=prod --gargs="-R"

    # TODO: build & install static libraries. For now, this fails because
    # auto-initialized static libraries are built using partial linking (ld's
    # -r option), which conflicts with GCC's by default -pie option.
    true || python2 scripts/build-langkit_support.py -vdebug \
        --enable-static --disable-shared \
        build --build-mode=prod
}

package()
{
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="$pkgdir"

    python2 scripts/build-langkit_support.py \
        --disable-static --enable-shared \
        install "$pkgdir/usr"
}
