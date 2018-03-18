# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools-git
pkgver=r289.08279035
pkgrel=1

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('git')

source=('git+https://github.com/AdaCore/libadalang-tools.git'
        'workaround-gnat-bug.patch')
sha1sums=('SKIP'
          '6af5ca1df6e6a6eae076450a7fb89fc44bcddab8')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare()
{
    cd "$srcdir/${pkgname%-git}"
    patch -Np0 -i "$srcdir/workaround-gnat-bug.patch"
}

build() 
{
    cd "$srcdir/${pkgname%-git}"

    # In order to build the generated library, Langkit expects the QUEX_PATH to
    # be set.
    source /etc/profile.d/quex.sh

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable PROCESSORS=`nproc`
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    mkdir -p "$pkgdir/usr/bin"
    for program in gnatpp gnatmetric gnatstub
    do
        install -m755 bin/$program "$pkgdir/usr/bin/"
    done
}
