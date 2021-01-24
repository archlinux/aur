# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools-git
pkgver=r561.e18d43fa
pkgrel=1

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('git')

source=('git+https://github.com/AdaCore/libadalang-tools.git'
        'fix-mains.patch')
sha1sums=('SKIP'
          '29619d48e3e098fa3002d171aa50307f173ee706')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

    patch -Np1 -i "$srcdir/fix-mains.patch"
}

build() 
{
    cd "$srcdir/${pkgname%-git}"

    for lt in static static-pic relocatable
    do
        make BUILD_MODE=prod LIBRARY_TYPE=$lt PROCESSORS=`nproc` lib
    done
    make BUILD_MODE=prod LIBRARY_TYPE=relocatable PROCESSORS=`nproc` bin
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    for lt in static static-pic relocatable
    do
        make BUILD_MODE=prod LIBRARY_TYPE=$lt \
            DESTDIR="$pkgdir/usr" install-lib
    done

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable \
        DESTDIR="$pkgdir/usr" install-bin-strip
}
