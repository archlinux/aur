# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=avbin
pkgver=10
pkgrel=2
_gittag="$pkgname-$pkgver"
_gitsubmodule="https://github.com/AVbin/libav.git"
pkgdesc="Cross-platform media decoding library"
arch=('i686' 'x86_64')
url="http://avbin.github.com/"
license=('LGPL')
depends=('bzip2' 'zlib')
conflicts=('avbin7')
makedepends=('git' 'yasm')
options=('!makeflags')
# The build script relies on being run in a git checkout,
# the downloadable release tarball doesn't work with it
source=("${pkgname}::git+https://github.com/AVbin/AVbin.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"

    if [ ! -e libav/Makefile ]; then
        git rm libav
        git submodule add --force ${_gitsubmodule} libav
    fi

    git checkout "${_gittag}"
    cd libav
    git checkout v9.5
}

build() {
    cd "${srcdir}/${pkgname}"

    target="linux-$(echo $CARCH | sed -e 's/_/-/')"
    msg "Building target ${target}..."
    # Linux Makefile uses LDFLAGS directly for ld command line
    export LDFLAGS="$(echo $LDFLAGS | sed -e 's/^-Wl,//')"
    bash -x build.sh --fast ${target}
}

package() {
    cd "${srcdir}/${pkgname}"

    target="linux-$(echo $CARCH | sed -e 's/_/-/')"
    install -dm755 "$pkgdir/usr/lib"
    install -m644 "dist/${target}/libavbin.so.${pkgver}" "$pkgdir/usr/lib"
    ln -sf "libavbin.so.${pkgver}" "$pkgdir/usr/lib/libavbin.so"
}
