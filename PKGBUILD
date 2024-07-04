# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=musializer
pkgname=$_pkgname-git
pkgver=r384.f106c92
pkgrel=1
pkgdesc="Music Visualizer"
arch=('x86_64')
url="https://github.com/tsoding/musializer"
license=('MIT')
depends=('ffmpeg')
makedepends=(
    'git'
    'raylib'
    )
source=(
    "git+$url"
    "0001-use-system-raylib.patch"
)
sha256sums=('SKIP'
            '34e0a1e75bdfc92f13c5f1d0772749d6805b58326bbff04d8aaaf46ac14677db')

prepare() {
	cd "${srcdir}/${_pkgname}"
    patch --forward --strip=1 --input=../0001-use-system-raylib.patch
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
    gcc -o nob nob.c
    ./nob build
}

package() {
	cd "${srcdir}/${_pkgname}"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 ./build/musializer "${pkgdir}"/usr/bin/musializer
}

