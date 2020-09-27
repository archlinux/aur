# Maintainer: loooph <loooph@gmx.de>
pkgname=obs-shaderfilter-git
pkgver=v1.2.r21.g9b40d37
pkgrel=1
pkgdesc="enables custom shaders for OBS sources"
arch=('x86_64')
url="https://github.com/Oncorporation/obs-shaderfilter/"
license=('Unlicense')
depends=(obs-studio)
makedepends=(git)
_basename=${pkgname%-git}
provides=("$_basename")
conflicts=("$_basename")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_basename
    CFLAGS="$CFLAGS -O2 -I /usr/include/obs"
    LDFLAGS="$LDFLAGS -shared -fpic  -lobs"
    cc ${CFLAGS} ${LDFLAGS} -o ${_basename}.so src/*.c
}

package() {
    mkdir -p $pkgdir/usr/lib/obs-plugins
    install -t $pkgdir/usr/lib/obs-plugins $srcdir/$_basename/${_basename}.so
}
