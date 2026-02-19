# Maintainer: ResRipper <resripper at connective dot link>
# Contributor: Marat Akhin <Marat.Akhin@gmail.com>
# Contributor: Kirill Gagarsky <???>
# Contributor: Azat Abdullin <azat.aam@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=mathsat-5
pkgver=5.6.15
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

b2sums_x86_64=('4e7b27ff54bede75e85d15e080a34906c958789655307c5658325e13b8b5d1ca5951ce1ea69fa9d81a109cd9318eccde1bf156c142edacd30b487210b65bc8ed')
b2sums_aarch64=('c5a58153c8c5bdbfd6f2c3e3189ba5bea34eb0f99f09a417ed47d680ffdc6d0fa8a7043decda3c9d53e338fa675579268714f7a9038ce29d2ec97ba19c7073cf')

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
