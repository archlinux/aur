# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: TJM <tommy.mairo@gmail.com>
pkgname=cudaminer-git
_gitname=CudaMiner
pkgver=209.746a773
pkgrel=4
pkgdesc="CUDA accelerated mining application for scrypt coins(Litecoin etc.)."
url="https://github.com/cbuchner1/CudaMiner"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cuda' 'automake' 'jansson')
makedepends=('git')
source=("git+https://github.com/cbuchner1/CudaMiner" 'gcc6.1.1.patch')
sha256sums=('SKIP'
            'c675995cfccbcc2910a054fcac7066b8efa92e95d290949021f922e877e37aae')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare(){
	patch -p1 $_gitname/Makefile.am < gcc6.1.1.patch
}
build(){
	cd $_gitname
	./autogen.sh
	sed 's/SSL_library_init/OPENSSL_init_ssl/g' -i configure
	CFLAGS=-O2 ./configure --with-cuda=/opt/cuda  --prefix=/usr
	make
}

package() {
	cd $_gitname
	make DESTDIR=${pkgdir} install
}
