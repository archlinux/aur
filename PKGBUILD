# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=portmod
pkgver=2.8.1
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
sha512sums=('2dcfa37976fcaa523a0f43a8291e6dc18227dd85c6256189231f08462bfeaa1e1cc182293c409b021b09aead08c756c8317171d04d141e2d2443e779242661b4')

build() {
  # zstd-rs fails to compile with gcc if lto is enabled (makepkg sets -flto=auto by default)
  # Alternatively, gcc works if lto is disabled
  # export CFLAGS+=" -fno-lto"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  export CC=clang
  export RUSTFLAGS+=" -Clinker=clang -Clink-arg=-fuse-ld=lld"

  cd "$srcdir/$pkgname-v$pkgver"
  python setup.py build_rust --inplace --release
  make -C doc man
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
