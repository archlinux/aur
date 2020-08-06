# Maintainer: Pierre Avizou <aur at avizou dot eu>

pkgname=keyboard-visualizer-git
pkgver=release_4.00.r15.g5aed324
pkgrel=1
pkgdesc="Turn your OpenRGB-supported RGB setup into a spectacular light show for your music"
arch=('x86_64')
url="https://gitlab.com/CalcProgrammer1/KeyboardVisualizer"
license=('GPL2')
depends=('openal' 'openrgb')
makedepends=('git' 'make' 'binutils' 'pkgconf')
optdepends=('openrazer-meta: Drivers and utilities for Razer hardware')
provides=('keyboard-visualizer')
source=("$pkgname::git+https://gitlab.com/CalcProgrammer1/KeyboardVisualizer.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
    qmake KeyboardVisualizer.pro
    make -j$(($(nproc)+1))
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 KeyboardVisualizer "$pkgdir"/usr/bin/KeyboardVisualizer
    install -Dm644 KeyboardVisualizerQT/KeyboardVisualizer.png "$pkgdir"/usr/share/pixmaps/KeyboardVisualizer.png
    install -Dm644 KeyboardVisualizerQT/KeyboardVisualizer.desktop "$pkgdir"/usr/share/applications/KeyboardVisualizer.desktop
}
