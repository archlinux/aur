# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=gnatcoll-core-git
pkgver=r3146.6ea9064e
pkgrel=1

pkgdesc='GNAT Components Collection - Core packages'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'libgpr')
makedepends=('git' 'gprbuild')

provides=('gnatcoll-core')
conflicts=('gnatcoll-core' 'gnatcoll')

source=('git+https://github.com/AdaCore/gnatcoll-core.git')
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
    make setup BUILD=PROD prefix=/usr
    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}

package()
{
    cd "$srcdir/${pkgname%-git}"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
