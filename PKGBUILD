# Maintainer: ResRipper <resripper at connective dot link>
# Contributor: Marat Akhin <Marat.Akhin@gmail.com>
# Contributor: Kirill Gagarsky <???>
# Contributor: Azat Abdullin <azat.aam@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=mathsat-5
pkgver=5.6.16
pkgrel=1
pkgdesc="An efficient SMT solver supporting a wide range of theories and functionalities"
arch=('x86_64' 'aarch64')
url="https://mathsat.fbk.eu/"
license=('custom:MathSAT5-non-commercial')
options=(!debug staticlibs)

makedepends=('python-setuptools' 'python-build' 'python-installer')
depends=('python')

source_x86_64=(
    "$pkgname-$pkgver.tar.gz::${url}release/mathsat-${pkgver}-linux-x86_64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver.tar.gz::${url}release/mathsat-${pkgver}-linux-aarch64.tar.gz"
)

b2sums_x86_64=('2df0ef846361f74cb4703da9630742ca447c22f5ad2990c21a77a57b7efaf432eca15290b40f21e7abcd6b545624b71b99eb6ef71b5cd87f9cff6b02610aa2ba')
b2sums_aarch64=('a9daf7706babc02e0d493f0087966226d747a8ea21bd97b3623e266494eaa2dbe4272e4956368b1e03e80f5903b176d5aac54b057f2d5a13bcf618c371c96b32')

_dir_name="mathsat-${pkgver}-linux-${CARCH}"

build() {
    cd "${_dir_name}/python"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/include/mathsat"
    mkdir -p "$pkgdir/usr/lib"

    cp -r "$srcdir/${_dir_name}/bin/." "$pkgdir/usr/bin/"
    cp -r "$srcdir/${_dir_name}/include/." "$pkgdir/usr/include/mathsat/"
    cp -r "$srcdir/${_dir_name}/lib/." "$pkgdir/usr/lib/"

    cd "${_dir_name}/python"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "${srcdir}/${_dir_name}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
