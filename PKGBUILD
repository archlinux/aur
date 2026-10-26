# Maintainer: Finn Coffey <aur@soxfox.me>
# Contributor: MaryJaneInChain <maryjaneinchain@gmail.com>

pkgname=tic-80-git
pkgver=1.4.3232.ded8955
pkgrel=1
pkgdesc='TIC-80 tiny computer emulator'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://tic80.com/"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'libglvnd' 'curl' 'libx11' 'libxi' 'libxcursor' 'alsa-lib')
makedepends=('git' 'cmake' 'ruby' 'ruby-rake' 'glu')
provides=("tic-80")

_gitname=TIC-80

source=("git+https://github.com/nesbox/$_gitname.git"
        'get_version.cmake'
        'sokol-alsa-device-fallback.patch')
sha256sums=('SKIP'
            '4ab65f4733179a551a928a9e757ae6eab1681a6369ea3aa571d258ea1189697a'
            '2057ef4f0cad655a4d105e8c361e4f268d41d4a3000a090b55e71253cf52b6c3')

pkgver() {
    cd "$srcdir/$_gitname"
    cmake -P "$srcdir/get_version.cmake" 2>&1 >/dev/null
}

prepare() {
    cd "$srcdir/$_gitname"
    git submodule update --init --recursive --force --depth=1
    patch -Np1 -i "$srcdir/sokol-alsa-device-fallback.patch"
}

build() {
    cd "$srcdir/$_gitname"
    cmake -S . -B build \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
          -DBUILD_PRO=ON \
          -DBUILD_TOOLS=OFF -DBUILD_WITH_FORTH=OFF \
          -DBUILD_WITH_ALL=ON -DBUILD_STATIC=ON
    cmake --build build
}

package() {
    cd "$srcdir/$_gitname/build"
    install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80"

    install -Dm644 linux/tic80.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 linux/tic80.png -t "${pkgdir}/usr/share/icons/"

    cd "$srcdir/$_gitname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
