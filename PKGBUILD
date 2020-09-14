# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=pineappl
pkgver=0.3.0
pkgrel=1
pkgdesc='PineAPPL is not an extension of APPLgrid'
arch=('any')
url="https://n3pdf.github.io/pineappl/"
license=('GPL3')
depends=("cargo-c"
         "rust"
         "python-pkgconfig"
         )
optdepends=()
provides=("pineappl")
changelog=
source=("https://github.com/N3PDF/pineappl/archive/v${pkgver}.tar.gz")
md5sums=("ca5d7a4b39ed49a5d62c015d9fe75591")

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
    # Build the python interface
	cd "$pkgname-$pkgver"/wrappers/python
    python setup.py build 
    cd ../../..
}

package() {
    # Install pineappl_capi
	cd "$pkgname-$pkgver"/pineappl_capi
    cargo cinstall --release --prefix=${pkgdir}/usr
    cd ..
    # Now install the command-line program
    cargo install --path pineappl_cli --root=${pkgdir}/usr
    # And the python wrapper
    cd wrappers/python
    python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
