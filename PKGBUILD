# Maintainer: w568w <w568w at outlook dot com>
pkgname=libtar-twrp-git
_pkgname="libtar-twrp"
pkgver=r53.7f86978
pkgrel=1
pkgdesc="C library for manipulating POSIX tar files (Patched with TWRP Backup Format Support)"
arch=('x86_64' 'aarch64')
url="https://github.com/simon816/libtar-twrp"
license=('BSD')
options=('libtool')
depends=('zlib' 'glibc' 'libselinux')
makedepends=('git' 'libselinux' 'autoconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=libtar-twrp.install
source=("${_pkgname}::git+https://github.com/simon816/libtar-twrp.git#branch=master")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/${_pkgname}"
        if [[ $LDFLAGS == *"-fuse-ld=mold"* ]]; then
                echo "=== !!!WARNING!!! ==="
                echo "You are using mold linker, which may cause broken binary."
                echo "The build process will continue, but the binary may NOT work."
                echo "If you encounter any problem, please try to use original linker."
                echo "=== !!!WARNING!!! ==="
        fi
        autoreconf --force --install
        ./configure --prefix=/opt/libtar-twrp
        make
}

package() {
        cd "$srcdir/${_pkgname}"
        make DESTDIR="${pkgdir}" install
}
