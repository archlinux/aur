# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=task-maker
pkgver=1.0.2
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'libyaml')
makedepends=('bazel')
source=("https://github.com/algorithm-ninja/task-maker/archive/v${pkgver}.tar.gz"
        "launcher")
sha384sums=('465f5c35ae0c5be22c074d27d1d644e1e52680cc48d8f087d2a284ca703907fd012d5da5d8cda2bb2826dad3e7daaad8'
            'af15e538605520142698741a2f5cc1e7f6fcf026dffdcc649630d360b6e7e65031c339d64f0a8a4288242537919e3e35')

build() {
    cd "$srcdir/task-maker-${pkgver}"
    export PYTHON_BIN_PATH=/usr/bin/python
    export USE_DEFAULT_PYTHON_LIB_PATH=1
    mkdir -p tmp
    bazel --output_base=./tmp build --python_path=python3 -c opt //python:task_maker
}

package() {
    mkdir -p "$pkgdir/opt/task-maker/"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/launcher" "$pkgdir/usr/bin/task-maker"
    cd "$srcdir/task-maker-${pkgver}"
    cd bazel-bin/python
    for f in $(find -type l); do
        cp --remove-destination "$(readlink "$f")" "$f"
    done
    cp -r task_maker* "$pkgdir/opt/task-maker/"
}
