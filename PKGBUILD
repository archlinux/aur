# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.9.1
pkgrel=2
pkgdesc="A cli tool to manage mods for OpenMW"
replaces=('openmmm')
arch=(any)
url="https://gitlab.com/portmod/portmod"
license=(GPL3)
depends=("python" "patool" "python-setuptools" "python-colorama" "python-gitpython"
         "python-progressbar" "python-restrictedpython" "bubblewrap" "python-redbaron"
         "python-python-sat" "python-requests" "python-chardet" "python-fasteners")
makedepends=("python" "python-setuptools" "python-setuptools-scm" "rust" "python-setuptools-rust" "python-packaging" "python-sphinx" "python-sphinx-argparse" "make" "python-autodocsumm" "python-sphinx-autodoc-typehints" "python-sphinxcontrib-apidoc" "clang" "lld")
checkdepends=("python-pytest")
optdepends=("tr-patcher" "python-argcomplete" "python-deprecated")
source=("https://gitlab.com/portmod/portmod/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('95c71736c5d5747ddc8b1a34fdfbf470eb112905ab14d9b994edeb8b60e7f77b993876a24f4cb8d111ff380f6e761d8c378fc10a7f45d1cb735d1976a222fc40')

build() {
  # zstd-rs fails to compile with gcc if lto is enabled (makepkg sets -flto=auto by default)
  # Alternatively, gcc works if lto is disabled
  # export CFLAGS+=" -fno-lto"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  export CC=clang
  export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"

  cd "$srcdir/$pkgname-v$pkgver"
  python setup.py build_rust --inplace --release
  make -C doc man -i SPHINXOPTS=--keep-going
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver pytest
}

package() {
  # Duplicate the above since it sometimes doesn't stay exported
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  export CC=clang
  export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"

  cd "$srcdir/$pkgname-v$pkgver"
  python setup.py install --root $pkgdir --optimize=1
}
