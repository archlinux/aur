# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
_pkgname=bitsandbytes
pkgname=('python-bitsandbytes-git')
pkgver=0.44.1.11.g9264f02
pkgrel=1
pkgdesc="Lightweight wrapper around CUDA custom functions, in particular 8-bit optimizers, matrix multiplication (LLM.int8()), and quantization functions."

depends=(
         'python>=3.9'
         'cuda>=11.0'     
         'python-pytorch'
         'python-einops' 
         'python-scipy'
         'python-accelerate'
         'python-transformers'
         'python-lion-pytorch'
         )
       
provides=('python-bitsandbytes')
conflicts=('python-bitsandbytes') 
arch=('x86_64')
url="https://github.com/TimDettmers/bitsandbytes"
license=("MIT")
makedepends=('python-build' 'python-installer' 'git')
checkdepends=('python-pytest')

source=("${pkgname}::git+${url}.git")
        
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"

  # Get the most recent semantic version tag like 0.44.1
  local latest_tag=$(git tag | grep -E '^([0-9]+\.[0-9]+\.[0-9]+)$' | sort -V | tail -n 1)

  # Get commit count since the latest tag and current commit hash
  local git_info=$(git describe --long --tags --match "$latest_tag" | sed 's/^[^-]*-//;s/-/./g')

  # Construct full package version
  echo "${latest_tag}.${git_info}"
}


build() {
  
  cd "$pkgname"
  
  cmake -DCOMPUTE_BACKEND=cuda -S .
  make
  python -m build --wheel --no-isolation  
}

check() {
  cd "$pkgname"
  # slow
  #pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Remove tests

  rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
}

