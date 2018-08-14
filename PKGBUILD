# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=python-hashpumpy
pkgname=$_pkgname-git
pkgver=v1.2.0.r8.g314268e
pkgrel=2
pkgdesc=" A tool to exploit the hash length extension attack in various hashing algorithms"
arch=("i686" "x86_64")
url="https://github.com/bwall/HashPump"
license=('MIT')
makedepends=('git')
depends=('openssl' 'python')
provides=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/bwall/HashPump")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}"

    pyver=$(python -c 'import sysconfig; print(sysconfig.get_config_var("VERSION"))')
    export PYTHONPATH="$(pwd)/build/lib.linux-$CARCH-$pyver:$PYTHONPATH"
    python test.py
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --root="${pkgdir}"

    install -Dm755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/"
}

