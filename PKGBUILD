# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=task-maker-git
pkgver=r352.105f027
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'libyaml')
makedepends=('bazel')
provides=('task-maker')
conflicts=('task-maker')
source=("git+https://github.com/algorithm-ninja/task-maker.git"
        "launcher")
sha384sums=('SKIP'
            '28377283ca07a411f1283e8067a30903a4726f66f765e22b8e33b06aece11a944adef9532f5d79a37a97f3c7d4293db6')

pkgver() {
    cd "$srcdir/task-maker"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/task-maker"
    export PYTHON_BIN_PATH=/usr/bin/python
    export USE_DEFAULT_PYTHON_LIB_PATH=1
    mkdir -p tmp
    bazel --output_base=./tmp build --python_path=python3 -c opt //python:task_maker
}

package() {
    mkdir -p "$pkgdir/opt/task-maker-git/"
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/launcher" "$pkgdir/usr/bin/task-maker"
    cd "$srcdir/task-maker"
    cd bazel-bin/python
    for f in $(find -type l); do
        cp --remove-destination "$(readlink "$f")" "$f"
    done
    cp -r task_maker* "$pkgdir/opt/task-maker-git/"
}
