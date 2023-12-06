# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=m17-cxx-demod-git
pkgver=v2.3.r16.g7e30f06
pkgrel=1
pkgdesc="M17 Demodulator in C++"
arch=('x86_64')
url="https://github.com/mobilinkd/m17-cxx-demod"
license=('GPL3')
depends=('codec2' 'boost-libs' 'gcc-libs')
makedepends=('cmake' 'git' 'patch')
source=("$pkgname"::"git+https://github.com/mobilinkd/m17-cxx-demod.git" add_cstdint.patch)
sha256sums=('SKIP' 'b8d39aef0d6ea193cc71a9a137d55ad1bcdbeda812dfa4fb17cb467e60c1b919')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/add_cstdint.patch"
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
