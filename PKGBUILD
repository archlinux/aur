# Maintainer:  Liu Zhe <cruise.pas@gmail.com>

pkgname=microsoft-nni-git
pkgver=0.1.r1.g7a7ab75
pkgrel=1
pkgdesc='An open source toolkit for neural architecture search, hyper-parameter optimization and optimizer design'
arch=('x86_64')
url='https://github.com/microsoft/nni'
license=('MIT')
depends=('nodejs-serve' 'python-astor' 'python-json-tricks' 'python-psutil' 'python-yaml' 'python-requests' 'python-scipy' 'python-hyperopt')
makedepends=('git' 'yarn' 'typescript' 'python-setuptools')
provides=('microsoft-nni')
conflicts=('microsoft-nni')
source=('git://github.com/microsoft/nni.git'
        'nnimanager' 'nnictl')
sha1sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir"/nni
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/nni
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/lib/node_modules/nni
    mkdir -p "$pkgdir"/usr/doc/nni

    cd "$srcdir"/nni

    cp -rT src/nni_manager/dist "$pkgdir"/usr/lib/node_modules/nni/nni_manager
    cp -rT src/nni_manager/node_modules "$pkgdir"/usr/lib/node_modules/nni/nni_manager/node_modules
    cp -rT src/webui/build "$pkgdir"/usr/lib/node_modules/nni/webui

    ( cd src/sdk/pynni && python setup.py install --skip-build -O1 --root="$pkgdir" )
    ( cd tools && python setup.py install --skip-build -O1 --root="$pkgdir" )

    cp -rT examples "$pkgdir"/usr/doc/nni/examples

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm755 "$srcdir"/nnimanager "$pkgdir"/usr/bin/nnimanager
    install -Dm755 "$srcdir"/nnictl "$pkgdir"/usr/bin/nnictl
}
