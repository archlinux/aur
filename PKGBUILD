# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=task-maker
pkgver=1.0.1
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'libyaml')
makedepends=('bazel')
source=("https://github.com/algorithm-ninja/task-maker/archive/v${pkgver}.tar.gz"
        "launcher")
sha384sums=('d8df0dbb22e0c5e616bc3e2cf1fc43b3961a286a949b8b91c38d9241e8e88b198c20cf6eb3738af047bc3f8cfb835c4e'
            'af15e538605520142698741a2f5cc1e7f6fcf026dffdcc649630d360b6e7e65031c339d64f0a8a4288242537919e3e35')

build() {
    cd "$srcdir/task-maker"
    export PYTHON_BIN_PATH=/usr/bin/python
    export USE_DEFAULT_PYTHON_LIB_PATH=1
    mkdir -p tmp
    bazel --output_base=./tmp build --python_path=python3 -c opt //python:task_maker
}

package() {
    mkdir -p "$pkgdir/opt/task-maker/"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/launcher" "$pkgdir/usr/bin/task-maker"
    cd "$srcdir/task-maker"
    cd bazel-bin/python
    for f in $(find -type l); do
        cp --remove-destination "$(readlink "$f")" "$f"
    done
    cp -r task_maker* "$pkgdir/opt/task-maker/"
}
