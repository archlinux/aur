# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=msk144decoder-git
pkgver=r33.b4cfcfc
pkgrel=1
pkgdesc="MSK144, JT65, Q65 Console Stream Decoders"
arch=('x86_64')
url="https://github.com/alexander-sholohov/msk144decoder"
license=('GPL3' 'MIT')
depends=('fftw' 'curl' 'gcc-libs')
makedepends=('cmake' 'git')
source=("$pkgname"::"git+https://github.com/alexander-sholohov/msk144decoder.git")
sha256sums=('SKIP')

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
    git submodule update --init --progress
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
    install -Dm 0644 $srcdir/$pkgname/LICENSES/MIT ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-MIT
}
