# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
pkgname=museekd-git
pkgver=r757.7992c04
pkgrel=2
pkgdesc="A replacement for Museek (daemon component)."
arch=('x86_64')
url="http://www.museek-plus.org/"
license=('GPL2')
depends=('libevent' 'libxml2')
optdepends=('libogg' 'libvorbis')
makedepends=('git' 'cmake' 'libxml++2.6')
source=("$pkgname::git+https://github.com/eLvErDe/museek-plus" 'museekd@.service')
md5sums=('SKIP' 'b63ed659f9a8e3479378c8c1aa381900')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    mkdir -p "$pkgname"/build
    cd "$pkgname"/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  -DEVERYTHING=0 -DMURMUR=0 -DMUCOUS=0 -DMUSEEKD=1  -DMUSETUP=0 -DMUSCAN=0 -DMUSEEQ=0 -DPYTHON_BINDINGS=1 "$srcdir"/"$pkgname"
    make VERBOSE=1
}

package() {
    cd "$pkgname"/build
    make DESTDIR="$pkgdir" install
    install -Dm644 ${srcdir}/museekd@.service ${pkgdir}/usr/lib/systemd/system/museekd@.service
}
