# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-git
pkgver=r2578.e44ddb9d
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/libadalang/'
arch=('any')
license=('GPL')

depends=('gcc-ada' 'gprbuild' 'gnatcoll-core' 'gnatcoll-iconv')
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

    python2 ada/manage.py --no-langkit-support generate

    # Build Libadalang both as a static library and as a shared one. Ask not to
    # use rpath (-R), but that only makes sense for the shared library, so
    # build in two steps: once for shared lib (+ mains), and once for static
    # lib.
    python2 ada/manage.py \
        --disable-static --enable-shared --no-langkit-support \
        build --build-mode=prod --gargs="-R"

    # TODO: build & install static libraries. For now, this fails because
    # auto-initialized static libraries are built using partial linking (ld's
    # -r option), which conflicts with GCC's by default -pie option.
    true || python2 ada/manage.py -vdebug \
        --enable-static --disable-shared \
        build --build-mode=prod --disable-all-mains
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    # Install the Ada library with its C binding
    python2 ada/manage.py \
        --disable-static --enable-shared --no-langkit-support \
        install "$pkgdir/usr"

    # Install the Python binding
    site_packages="$pkgdir/usr/lib/python2.7/site-packages"
    mkdir -p "$site_packages"
    install -m644 build/python/libadalang.py "$site_packages"
    rm -rf "$pkgdir/usr/python"
}
