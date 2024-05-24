# Maintainer: Juacrumar <juacrumar at lairen dot eu>

pkgname=pineappl
pkgver=0.7.4
fullver=${pkgver}
pkgrel=1
pkgdesc='PineAPPL is not an extension of APPLgrid. Installs pineappl_cli, pineappl library and python package'
arch=('any')
url="https://nnpdf.github.io/pineappl/"
license=('GPL3')
makedepends=("python-setuptools" "maturin" "python-pip" "cargo" "cargo-c")
depends=("lhapdf"
         "python-pkgconfig"
         "python-numpy"
         )
optdepends=()
provides=("pineappl")
changelog=
source=("https://github.com/NNPDF/pineappl/archive/v${fullver}.tar.gz")
md5sums=("ff756719b29ff185eb2739cf4446ac8e")

# workaround for the problem with ring, see https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

prepare() {
    cd "$pkgname-$fullver"
    cargo fetch --target x86_64-unknown-linux-gnu --locked
    # Set manually the version
    sed -i "/version = git_version!(/{:a;N;/)/!ba;s/version = git_version!(.*)/version = \"$fullver-arch-$pkgrel\"/}" pineappl_cli/src/lib.rs
}

build() {
    cd "$pkgname-$fullver"/pineappl_py
    # Now build the python interface
    maturin build --release
}

package() {
    export RUSTUP_TOOLCHAIN=stable
 	cd "$pkgname-$pkgver"
    cargo install --path pineappl_cli --root=${pkgdir}/usr --no-track --locked --features=evolve
    # Install also the pineappl_capi
 	cd pineappl_capi
    cargo cinstall --release --destdir=${pkgdir} --prefix=/usr
    cd ..
    # And the python wrapper
    cd pineappl_py/target/wheels/
    PYTHONDONTWRITEBYTECODE=1 PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
    # manually remove __pycache__ from pkgdir (isn't there a better way?)
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/pineappl/__pycache__
    # Note: some debug information, including the folder where the package was built, might stored
}
