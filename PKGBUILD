# Maintainer: Saoirse <quqq at tuta dot io>
# Contributor: ResRipper <resripper at connective dot link>
# Contributor: Marat Akhin <Marat.Akhin@gmail.com>
# Contributor: Kirill Gagarsky <???>
# Contributor: Azat Abdullin <azat.aam@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=optimathsat
pkgver=1.7.4
pkgrel=1
pkgdesc="An efficient Optimization Modulo Theories (OMT) tool"
arch=('x86_64')
conflicts=('mathsat' 'mathsat-5')
url="https://optimathsat.disi.unitn.it"
license=('custom:MathSAT5-non-commercial')
options=(!debug staticlibs)

makedepends=('python-setuptools' 'python-build' 'python-installer')
depends=('python')

source_x86_64=(
    "$pkgname-$pkgver.tar.gz::${url}/releases/${pkgname}-${pkgver}/${pkgname}-${pkgver}-linux-64-bit.tar.gz"
)

b2sums_x86_64=('521ed29091d339327e8203f61cce6b75e45aaf9f41f30765bab0d0042dca4176d95c8d81f118a9c737b56c1aa355fa6a2b16a963890b9ce85b1100d54e3420a0')

_dir_name="${pkgname}-${pkgver}-linux-64-bit"

build() {
    cd "${_dir_name}/python"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/include/$pkgname"
    mkdir -p "$pkgdir/usr/lib"

    cp -r "$srcdir/${_dir_name}/bin/." "$pkgdir/usr/bin/"
    cp -r "$srcdir/${_dir_name}/include/." "$pkgdir/usr/include/${pkgname}/"
    cp -r "$srcdir/${_dir_name}/lib/." "$pkgdir/usr/lib/"

    cd "${_dir_name}/python"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "${srcdir}/${_dir_name}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
