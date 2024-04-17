# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=toxext-git
pkgver=0.0.3.r1.ga746a99
pkgrel=1
pkgdesc='An extension library for tox'
arch=('x86_64')
url='https://github.com/toxext/toxext'
license=('GPL-3.0-only')
makedepends=('git' 'cmake' 'toxcore')
provides=('libtoxext.a')
conflicts=('toxext')
options=('!lto')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}


prepare() {
  cd $pkgname
  mkdir -p build
}
build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
