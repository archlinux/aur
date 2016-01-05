# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=("zopfli-git" "libzopfli-git" "zopflipng-git" "libzopflipng-git")
pkgver=1.0.0.r47.g720b20e
pkgrel=2
arch=('i686' 'x86_64' 'ARM')
url="https://github.com/google/zopfli"
license=('Apache')
makedepends=('git')
depends=('glibc')
source=('git+https://github.com/google/zopfli.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/zopfli"
    git describe | sed -r 's/zopfli-//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd "$srcdir/zopfli"
    # These need to be separate due to the Makefile not liking parallel
    # builds with all targets in one go.
    # For more information, see <https://github.com/google/zopfli/issues/68>.
    make zopfli 
    make libzopfli 
    make zopflipng 
    make libzopflipng
}

package_zopflipng-git() {
    pkgdesc="PNG optimisation tool using Google's zopfli library, git version."
    depends=('gcc-libs')
    provides=('zopflipng')
    cd "$srcdir/zopfli"
    install -Dm755 zopflipng "${pkgdir}/usr/bin/zopflipng"
}

package_libzopflipng-git() {
    pkgdesc="PNG optimisation library using Google's zopfli library, git version."
    depends=('gcc-libs')
    provides=('libzopflipng')
    cd "$srcdir/zopfli"
    _libname=$(find * -type f -name "libzopflipng.so.*" -print)
    install -D $_libname "${pkgdir}/usr/lib/$_libname"
    ln -s "/usr/lib/$_libname" "${pkgdir}/usr/lib/libzopflipng.so"
    install -Dm644 src/zopflipng/zopflipng_lib.h \
            "${pkgdir}/usr/include/zopflipng_lib.h" # FYI, this is a dumb name.
}

package_libzopfli-git() {
    pkgdesc="Compression library by Google, git version."
    provides=('libzopfli')
    cd "$srcdir/zopfli"
    _libname=$(find * -type f -name "libzopfli.so.*" -print)
    install -D $_libname "${pkgdir}/usr/lib/$_libname"
    ln -s "/usr/lib/$_libname" "${pkgdir}/usr/lib/libzopfli.so"
    install -Dm644 src/zopfli/zopfli.h \
            "${pkgdir}/usr/include/zopfli.h"
}

package_zopfli-git() {
    pkgdesc="Compression utility by Google, git version."
    provides=('zopfli')
    cd "$srcdir/zopfli"
    install -Dm755 zopfli "${pkgdir}/usr/bin/zopfli"
}
