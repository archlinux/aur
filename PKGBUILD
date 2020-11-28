# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=fna3d-git
pkgver=20.11.r19.g9d432ab
pkgrel=1
pkgdesc='3D graphics library for FNA'
arch=('x86_64' 'aarch64')
url='https://fna-xna.github.io/'
license=('Zlib')
depends=('sdl2')
makedepends=('git' 'cmake')
conflicts=('fna3d')
provides=('fna3d')
source=("git+https://github.com/fna-xna/fna3d")
sha1sums=('SKIP')

pkgver() {
    cd fna3d
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd fna3d
    git submodule update --init --recursive

    cd ..
    cmake -S fna3d -B build -G Ninja
}

build() {
    ninja -C build
}

package() {
    install -Dm644 fna3d/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd build
    install -dm755 "$pkgdir"/usr/lib/
    install -Dm755 libFNA3D.so.0.20.11 "$pkgdir"/usr/lib/
    ln -s libFNA3D.so.0.20.11 "$pkgdir"/usr/lib/libFNA3D.so.0
    ln -s libFNA3D.so.0 "$pkgdir"/usr/lib/libFNA3D.so
}
