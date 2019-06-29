# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools-git
pkgver=r446.3e283b06
pkgrel=1

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('git')

source=('git+https://github.com/AdaCore/libadalang-tools.git')
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
