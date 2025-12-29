pkgname=imagine-term-git
pkgver=1.2.4  # placeholder, will be overridden by pkgver()
pkgrel=1
pkgdesc="Imagine is a program that displays images and video in the terminal."
arch=(x86_64)
url="https://github.com/spynets/imagine"
license=('GPL-3.0-or-later')
depends=(ffmpeg)
makedepends=(git meson)
conflicts=(imagine)
source=("git+https://github.com/spynets/imagine.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/imagine"
    # Option 1: use commit count + short hash
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "r${count}.g${commit}"
}

prepare() {
    cd "$srcdir/imagine"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/imagine"
    meson setup build
    cd build
    meson compile
}

package() {
    cd "$srcdir/imagine"
    install -Dm755 ./build/imagine "$pkgdir/usr/bin/imagine"
    install -Dm644 ./readme.md "$pkgdir/usr/share/doc/imagine-term-images/README"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/imagine-term-images/LICENSE"
}
