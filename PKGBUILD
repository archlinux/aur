# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=pineappl
pkgver=0.4.1
pkgrel=1
pkgdesc='PineAPPL is not an extension of APPLgrid'
arch=('any')
url="https://n3pdf.github.io/pineappl/"
license=('GPL3')
makedepends=("python-setuptools")
depends=("cargo-c"
         "rust"
         "lhapdf"
         "python-pkgconfig"
         "python-numpy"
         )
optdepends=()
provides=("pineappl")
changelog=
source=("https://github.com/N3PDF/pineappl/archive/v${pkgver}.tar.gz")
md5sums=("756e186f88caaf5ddf1883ae74f397ac")

prepare() {
	cd "$pkgname-$pkgver"
    # Patch the loader
    sed -i "s/pkgconfig.libs('pineappl_capi').split(' ')/pkgconfig.libs('pineappl_capi').split(' ')\nif len(paths) < 2: paths.insert(0, '-L\/usr\/lib')/" wrappers/python/src/pineappl/loader.py
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
    cargo cinstall --release --destdir=${pkgdir} --prefix=/usr
    cd ..
    # Now install the command-line program
    cargo install --path pineappl_cli --root=${pkgdir}/usr
    # And the python wrapper
    cd wrappers/python
    python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
