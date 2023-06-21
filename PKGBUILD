# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
_pkgname=bitsandbytes
pkgbase='python-bitsandbytes'
pkgname=('python-bitsandbytes-cuda121')
pkgver=0.39.1
pkgrel=1
pkgdesc="Lightweight wrapper around CUDA custom functions, in particular 8-bit optimizers, matrix multiplication (LLM.int8()), and quantization functions."
#certifi
depends=(
         'python>=3.9'
         'cuda>=11.0'
         'openssl'
         'python-pytorch'
         'python-torchvision'
         'python-torchaudio'
         'python-typer'
         ) 
provides=('python-bitsandbytes')
conflicts=('python-bitsandbytes') 
arch=('x86_64')
url="https://github.com/TimDettmers/bitsandbytes"
license=("MIT")
makedepends=('python-setuptools')
checkdepends=('python-pytest')

source=("$pkgbase-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
        
sha256sums=('c5cf516341c48bd439ee1c675abed8b2f04cc5b269022440d08dce59ba5e5a0c')


build() {
  cd "$_pkgname-$pkgver"
  #python setup.py build
  # Dirty hack to workaround the `The installed version of bitsandbytes was compiled without GPU support` aka `str2optimizer8bit_blockwise name` error
  # https://github.com/TimDettmers/bitsandbytes/issues/112
  # https://github.com/oobabooga/text-generation-webui/issues/400#issuecomment-1474876859
  mv  bitsandbytes/libbitsandbytes_cuda121.so bitsandbytes/libbitsandbytes_cpu.so
  rm  bitsandbytes/libbitsandbytes_cuda* # Remove other cuda version libs  
}

check() {
  cd "$_pkgname-$pkgver"  
  # Gives a KeyError exception when LD_LIBRARY_PATH is blank
  LD_LIBRARY_PATH="." python setup.py test 
}

package_python-bitsandbytes-cuda121() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

