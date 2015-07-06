# Contributor: Richard Jackson <rj@iinet.net.au>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=heliwm
pkgver=1.13
pkgrel=2
pkgdesc='Highly Essential Light Itsy-bitsy Window Manager.'
arch=('i686' 'x86_64')
url='http://www.cc.rim.or.jp/~hok/heliwm/'
license=('GPL2')
depends=('libxext')
makedepends=('imake')
install=heliwm.install
source=("http://www.cc.rim.or.jp/~hok/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c3245228bf6351d4db6d85e198962ad1')
sha1sums=('93b19419040971a1cd981c9cb0592a5ad1f17c13')
sha256sums=('134b826789b4873619bb8d334c20ddf4e92954ebe933a145a5c5a2ccdccf954d')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  #Change the path for the sample / default heliwmrc config 
  sed -i -e 's|"/usr/X11R6/lib/X11/heliwm/heliwmrc"|"/usr/share/heliwm/heliwmrc"|' config.h
  sed -i -e 's|(heliwmrc,heliwmrc,/usr/X11R6/lib/X11/heliwm)|(heliwmrc,heliwmrc,/usr/share/heliwm)|' Imakefile
  #Change the personal heliwmrc file location
  sed -i -e 's|"~/.heliwmrc"|"~/.config/heliwm/heliwmrc"|' config.h
}

build() {
  cd $srcdir/$pkgname-$pkgver
  xmkmf
  # NOTE: Change the "DEFINES" to suit your needs you can remove them all if you wish an absolute minimum window manager;
  #         -DRCPARSER allows you to use a modfied config placed at ~/$HOME/.config/heliwm/heliwmrc
  #         -DFRAME places a frame around windows which you can configure in the heliwmrc file
  #         -DMAXIMISE allows you to maximise / minimize with keyboard
  #         -DSHAPE Alows for non rectangular window edges. (Uses more memory)
  #         -DNLS Provides international support
  #         -DREORDER Reorder windows
  #         -DVERBOSE for debug only
  make 'DEFINES=-DRCPARSER -DMAXIMIZE'
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 heliwm.man ${pkgdir}/usr/share/man/man1/heliwm.1
  chmod 0644 $pkgdir/usr/share/heliwm/heliwmrc
}

