# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
_pkgname=musializer
pkgname=$_pkgname-git
pkgver=r256.0cc08f5
pkgrel=1
pkgdesc="Music Visualizer"
arch=('x86_64')
url="https://github.com/tsoding/musializer"
license=('MIT')
depends=('ffmpeg')
makedepends=(
    'git'
    'libx11'
    'libxrandr'
    'libxinerama'
    'xorg-xinput'
    )
source=("git+$url")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_pkgname}"
    sed -i 's/\.\/resources/\/usr\/share\/'$_pkgname'\/&/' src/plug.c src/musializer.c
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
    gcc -o nob nob.c
    ./nob
}

package() {
	cd "${srcdir}/${_pkgname}"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    find resources -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/musializer/{}" \;
    install -Dm 755 ./build/musializer "${pkgdir}"/usr/bin/musializer
}

