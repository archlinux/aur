# Maintainer: Shining Xu <skyfiretime at gmail dot com>

pkgname=python-jcc
_name=JCC
pkgver=3.2
pkgrel=1
pkgdesc='A C++ code generator for calling Java from C++/Python'
arch=('x86_64')
url='https://lucene.apache.org/pylucene/jcc/index.html'
license=('Apache')
depends=('java-environment' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'jdk.patch')
sha256sums=('9f7336c2ea742a8990b193d162a4d029276d0952704702de45d83798309497d4'
            '77a55bd33d0204516492cd78cef41a2686f388df86108cbbae5b3ca67dab8281')

prepare() {
    cd "$_name-$pkgver"
    patch -p1 -i "$srcdir/jdk.patch"

    # Apply patches for OpenJDK 10 because library files are moved from
    # /usr/lib/jvm/default/jre/lib/amd64/ to /usr/lib/jvm/default/lib/
    # and /usr/lib/jvm/default/jre/lib/amd64/server/ to
    # /usr/lib/jvm/default/lib/server/
    if [ $(archlinux-java get) == 'java-10-openjdk' ]; then
        # remove "/jre" and "/amd64"
        sed -i '155,157s/\/jre\|\/amd64//g' setup.py
    fi
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build -O1 --root="$pkgdir"
}
