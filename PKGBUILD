# Maintainer: chirsz <chirsz@foxmail.com>
pkgname=rosbe
pkgver=2.2.1
pkgrel=1
pkgdesc="ReactOS Build Environment"
# It should be also compiled on i686, but I just tested it on x86_64.
arch=('x86_64' 'i686')
url="https://reactos.org/wiki/Build_Environment"
license=('GPL')
depends=()
optdepends=('perl: run translate.pl to translate backtraces found in debug log')
makedepends=('python')
# staticlibs: prevent mingw libs from being removed
options=('staticlibs')
source=("https://downloads.sourceforge.net/reactos/RosBE-Unix-$pkgver.tar.bz2")
sha1sums=('320614352df8871ba8e6c99a92f9a0fc8f660a3e')

build() {
    cd "$srcdir/RosBE-Unix-$pkgver"

    # hack! - default /etc/makepkg.conf define CPPFLAGS as '-D_FORTIFY_SOURCE=2',
    # but binutils/libiberty would failed to build without '-O2' in CPPFLAGS.
    if [[ "${CPPFLAGS}" =~ '-D_FORTIFY_SOURCE=2' && ! "${CPPFLAGS}" =~ '-O2' ]]; then
        export CPPFLAGS="$CPPFLAGS -O2"
    fi

	fakeroot ./RosBE-Builder.sh "$srcdir/destdir/opt/RosBE"
}

package() {
    cp -rT "$srcdir/destdir" "$pkgdir"
}
