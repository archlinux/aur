# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=gnatcoll-core-git
pkgver=r3121.78b9de8c
pkgrel=1

pkgdesc='GNAT Components Collection - Core packages'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'libgpr')
makedepends=('git' 'gprbuild')

provides=('gnatcoll-core')
conflicts=('gnatcoll-core' 'gnatcoll')

source=('git+https://github.com/AdaCore/gnatcoll-core.git'
        'remove-os.patch')
sha1sums=('SKIP'
          '5e22130f6cb04bfdffb930c29e0abbda7be53514')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

    # TODO: The new GNATCOLL.OS.* packages depend on new runtime features (for
    # instance: Interfaces.C.unsigned_long_long). These will be available only
    # in future GCC releases (11 and later), so just do without them for now.
    patch -Np1 -i "$srcdir/remove-os.patch"
    rm src/os/gnatcoll-os-*
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
