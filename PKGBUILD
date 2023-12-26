# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
_pkgname=bitsandbytes
pkgname=('python-bitsandbytes-git')
pkgver=0.41.0.r50.gf63abb5
pkgrel=1
pkgdesc="Lightweight wrapper around CUDA custom functions, in particular 8-bit optimizers, matrix multiplication (LLM.int8()), and quantization functions."

depends=(
         'python>=3.9'
         'cuda>=11.0'
         'openssl'
         'python-pytorch'
         )
       
provides=('python-bitsandbytes')
conflicts=('python-bitsandbytes') 
arch=('x86_64')
url="https://github.com/TimDettmers/bitsandbytes"
license=("MIT")
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')

source=("${pkgname}::git+${url}.git")
        
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  # https://github.com/TimDettmers/bitsandbytes/blob/main/compile_from_source.md
  
  cd "$pkgname"
  # Detect local cuda version (12.3) and remove the dot. BNB is using the {major}{minor} notation like: (123)
  BNB_CUDA_VERSION=$(nvcc --version | grep "release" | sed 's/.*release //' | sed 's/,.*//' | sed 's/\.//')
  
  # Find the cuda runtimes lib location
  CUDA_LIB_PATH=$(ldconfig -p | grep libcudart.so | head -n 1 | tr -s ' ' | cut -d ' ' -f 4)
  
  # Extract the parent directory. BNB just searches all environment variables containing a `/` considering them a possible cuda path 
  export CUDA_LIB_DIR=$(dirname "$CUDA_LIB_PATH")  
  
  # Check if the path is valid and non-empty
  if [ -z "$CUDA_LIB_DIR" ] || [ ! -d "$CUDA_LIB_DIR" ]; then
      printf "\e[1;31mError:\e[0m CUDA library directory not found. No `libcudart.so` in `ldconfig -p` \n"
      exit 1
  fi
  # echo found cuda $BNB_CUDA_VERSION at $CUDA_LIB_DIR
  make cuda12x CUDA_VERSION=$BNB_CUDA_VERSION

}

check() {
  cd "$pkgname"
  python setup.py test 
}

package() {
  cd "$pkgname"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  # Remove tests

  rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

