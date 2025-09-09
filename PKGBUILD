# Maintainer: cargabsj175 <cargabsj175 at gmail dot com>
pkgname=jzintvimgui
pkgver=2.3.7
pkgrel=2025
pkgdesc="A cross-platform GUI for jzIntv"
arch=('x86_64')
url="https://github.com/jenergy/jzIntvImGui"
license=('MIT')
depends=(
    'libgl'
    'sdl2_image'
    'glfw'
)
makedepends=(
    'git'
    'cmake'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "git+https://github.com/jenergy/jzIntvImGui.git#tag=$pkgver"
    "jzIntvImGui_linux_ini2home.patch"
    "jzintvimgui.desktop"
    "jzIntvImGui-termios.patch"
)
sha256sums=('SKIP'
            '52e0a46eea598740c2afb2a81f6926258754672aabd30cf4a2c70408a769ef03'
            'e55d22264acf170659d045821820b500bf8d3569161a34c67adfd67876bacd0f'
            '41882c2fa69128490fcc174ecc0e2a22318d99c6389dcd8f6f78608eb3829421')

pkgver() {
    cd jzIntvImGui
    git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
    cd jzIntvImGui
    patch -Np1 -i "$srcdir/jzIntvImGui_linux_ini2home.patch"
    patch -Np1 -i "$srcdir/jzIntvImGui-termios.patch"
}

build() {
    cd jzIntvImGui
    cmake -S app/src/main/cpp -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cd build
    make -j8
}

package() {
    cd jzIntvImGui
    install -Dm755 build/jzIntvImGui "$pkgdir/usr/bin/jzIntvImGui"
    install -Dm644 app/src/main/ic_launcher-playstore.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/jzIntvImGui.png"
    install -Dm644 "$srcdir/jzintvimgui.desktop" "$pkgdir/usr/share/applications/jzintvimgui.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
