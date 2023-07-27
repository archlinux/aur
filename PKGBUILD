# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=pyperscan
pkgname=python-${_pyname}-git
pkgver=0.2.2.r38.gebc6404
pkgrel=1
pkgdesc='A hyperscan binding for Python, which supports vectorscan'
arch=('x86_64' 'aarch64')
url="https://github.com/vlaci/$_pyname"
license=(MIT)
depends=(python)
conflicts=(python-pyperscan)
provides=(python-pyperscan)
makedepends=(git 
             cmake 
             boost 
             ragel
             clang
             python-pip 
             python-build 
             python-installer 
             python-wheel 
             python-setuptools 
             python-maturin)
checkdepends=(python-pytest python-pytest-cov)
source=("git+https://github.com/vlaci/pyperscan.git"
         "git+https://github.com/VectorCamp/vectorscan#commit=b4bba94b1a250603b0b198e0394946e32f6c3f30"
         "git+https://github.com/intel/hyperscan#commit=bc3b191ab56055e8560c7cdc161c289c4d76e3d2")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd $_pyname
  git submodule init
  git config submodule.hyperscan-sis/vectorscan.url "$srcdir/hyperscan-src/vectorscan"
  git config submodule.hyperscan-sys/hyperscan.url "$srcdir/hyperscan-src/hyperscan"
  git -c protocol.file.allow=always submodule update

}

pkgver() {
  cd $_pyname

  # if tag exists, use this
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -nE "s/v(.*)/\1/p"
}

build() {
    cd "$_pyname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
 
check()  {
  cd "$_pyname"
  local tmp=$(mktemp -d)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ls -lah *
  python -m installer --destdir="$tmp" dist/$_pyname-${pkgver::-13}-cp3*-abi3-linux_$CARCH.whl
  # pyperscan-0.2.2-cp38-abi3-linux_x86_64.whl
  PYTHONPATH="$tmp$site_packages" python -m pytest tests

  rmdir --ignore-fail-on-non-empty $tmp 
}
