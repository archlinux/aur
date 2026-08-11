# Maintainer: Sándor Rátkai <sandor@ratk.ai>
pkgname=sandpaper-sudoku-gtk-git
pkgver=1.1.3
pkgrel=1
pkgdesc="GTK4 Sudoku application for ePaper devices with stylus input"
url='https://gitlab.com/sandpaper-project/sandpaper-sudoku/sandpaper-sudoku-gtk'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('gtkmm-4.0' 'onnxruntime-cpu')
makedepends=('cmake' 'git')
provides=('sandpaper-sudoku-gtk')
conflicts=('sandpaper-sudoku-gtk' 'sandpaper-sudoku-gtk-bin')
source=(
    "sandpaper-sudoku-gtk::git+https://gitlab.com/sandpaper-project/sandpaper-sudoku/sandpaper-sudoku-gtk.git"
    "lib-sudoku::git+https://gitlab.com/sandpaper-project/sandpaper-sudoku/lib-sudoku.git"
    "mnist-12.onnx::https://github.com/onnx/models/raw/main/validated/vision/classification/mnist/model/mnist-12.onnx"
)
sha256sums=('SKIP'
            'SKIP'
            '5c688690f8bacf667d4c2074af5ad0646ca328d7ab03eccf944a65b320171bdd')

pkgver() {
    cd "sandpaper-sudoku-gtk"
    git describe --tags --long 2>/dev/null \
        | sed 's/^v//;s/-0-g[0-9a-f]*$//;s/-\([0-9]*\)-g[0-9a-f]*$/.\1/' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "sandpaper-sudoku-gtk"
    git submodule init
    git config submodule.extern/lib-sudoku.url "$srcdir/lib-sudoku"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "sandpaper-sudoku-gtk"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "sandpaper-sudoku-gtk"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/mnist-12.onnx" \
        "${pkgdir}/usr/share/sandpaper-sudoku-gtk/mnist-12.onnx"
}
