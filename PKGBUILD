# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Co-maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=task-maker-git
pkgver=r772.8cb6c4d
pkgrel=1
pkgdesc="The new cmsMake!"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/algorithm-ninja/task-maker"
license=('MPL2')
depends=('python' 'python-ruamel-yaml' 'python-traits' 'capnproto' 'pybind11')
makedepends=('cmake' 'gmock' 'gtest' 'python-pip')
provides=('task-maker')
conflicts=('task-maker')
source=("git+https://github.com/algorithm-ninja/task-maker.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/task-maker"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/task-maker"
    rm -rf build && mkdir -p build
    cd build
    cmake -DHUNTER_ENABLED=OFF -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/task-maker/build/python"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 ../tools/autocomp/zsh/_task_maker "$pkgdir/usr/share/zsh/site-functions/_task_maker"
    install -Dm644 ../tools/autocomp/zsh/_contest_maker "$pkgdir/usr/share/zsh/site-functions/_contest_maker"
    install -Dm644 ../tools/autocomp/bash/task-maker "$pkgdir/usr/share/bash-completion/completions/task-maker"
    install -Dm644 ../tools/autocomp/bash/contest-maker "$pkgdir/usr/share/bash-completion/completions/contest-maker"
}
