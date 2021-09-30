# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgname=truckersmp-cli
pkgver=0.7.2
pkgrel=2
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/lhark/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.79308f6514bba132a3e66b43419aabd599ca9093.patch::https://github.com/$pkgname/$pkgname/commit/79308f6514bba132a3e66b43419aabd599ca9093.patch")
sha512sums=('ec5ef51683a95bc9d45009ed49bd5d80c51a610c7c3440dc414c823505146938138cdbaf47ee0973328f8610f56fd7e9ffc2d6514e5e76cf24eb7b170a7f64fe'
            '837bf59c92836d03406f45b778366f2c763bc2ae87a9fe350584ba12d556ab48b2c84cbc4dff1e777db94e456ba94f6268aca9d22eec3bf90244c8da520f71d4')

pkgdesc="A simple launcher for TruckersMP to play ATS or ETS2 in multiplayer."
arch=('x86_64')
url="https://github.com/lhark/truckersmp-cli/"
license=('MIT')
depends=('python' 'sdl2')
optdepends=('python-vdf: automatic steam account detection'
            'python-setuptools: get version information'
            'steam: possibility to use proton'
            'wine: possibility to use wine')
makedepends=('mingw-w64-gcc' 'python-setuptools')

prepare() {
    cd "$pkgname-$pkgver" || exit
    patch --forward --strip=1 --input="$srcdir/$pkgname.79308f6514bba132a3e66b43419aabd599ca9093.patch"
}

build() {
    cd "$pkgname-$pkgver" || exit
    make
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver" || exit
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
