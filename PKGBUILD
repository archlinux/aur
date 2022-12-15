# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=pineappl
pkgver=0.5.8
pkgrel=2
pkgdesc='PineAPPL is not an extension of APPLgrid'
arch=('any')
url="https://n3pdf.github.io/pineappl/"
license=('GPL3')
makedepends=("python-setuptools" "maturin" "python-pip")
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
md5sums=("29b33a0dc38ef511ae93756221cfde8c")

build() {
    # Build the python interface
	cd "$pkgname-$pkgver"/pineappl_py
    maturin build --release
}

package() {
    # Install the command-line program
	cd "$pkgname-$pkgver"
    cargo install --path pineappl_cli --root=${pkgdir}/usr --no-track --features=fktable
    # Install pineappl_capi
	cd pineappl_capi
    cargo cinstall --release --destdir=${pkgdir} --prefix=/usr
    cd ..
    # And the python wrapper
    cd pineappl_py/target/wheels/
    PYTHONDONTWRITEBYTECODE=1 PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
    # manually remove __pycache__ from pkgdir (isn't there a better way?)
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/pineappl/__pycache__
    # Note: some debug information, including the folder where the package was built, is stored
    # I haven't found a way of stripping that information and so some warnings might be shown
}
