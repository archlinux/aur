# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Luong The Minh Quang <luci at devel.faith>

_name=ovh-ttyrec
pkgname="$_name-git"
pkgdesc='Enhanced (but compatible) version of the classic ttyrec'
pkgrel=2
pkgver=v1.1.6.7.r1.ga13ca74
arch=('x86_64')
url='https://github.com/ovh/ovh-ttyrec'
license=('BSD')
depends=('zstd')
makedepends=('git' 'make')
conflicts=('ttyrec')
source=('git+https://github.com/ovh/ovh-ttyrec#branch=master'
        '0001-Makefile.in-remove-upstream-flags.patch')
sha256sums=('SKIP'
            '8a1ee5e8ab5eb0207e3ba0d3d85cc12399ee52f883c43324b21735498fedcf54')

pkgver() {
    git -C "$_name" describe --abbrev=7 --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_name"
    patch --forward --strip=1 \
          --input="${srcdir}/0001-Makefile.in-remove-upstream-flags.patch"
    ./configure NO_STATIC_ZSTD=1 --prefix=/usr
}

build() {
    make -C "$_name"
}

package() {
    make -C "$_name" DESTDIR="$pkgdir" install
    install -Dm644 "$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
