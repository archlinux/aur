# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=swftools
pkgver=0.9.2
pkgrel=6
pkgdesc="A collection of SWF manipulation and creation utilities"
arch=('i686' 'x86_64')
url="http://www.swftools.org/"
license=('GPL')
depends=('giflib' 'freeglut' 'lame' 't1lib' 'libjpeg' 'fontconfig')
makedepends=('bison' 'flex' 'zlib' 'patch')
changelog=$pkgname.changelog
source=(http://www.swftools.org/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.patch
        giflib-5.1.patch
        extern.patch
        pointer_compare.patch)
sha256sums=('bf6891bfc6bf535a1a99a485478f7896ebacbe3bbf545ba551298080a26f01f1'
            '80f69c86ed06b315f576a733fd1e24145b88aef9934085f3790179a119b7923d'
            '6a995dfd674c5954f5b967e3d45d6845a186872fcaa4223d725902fd4d679f1b'
            'bcdd407240b2d5ad214317a75f1d75583a537c344771f7fbc38fbd212d22ec9f'
            '366db5103a78870b979c3b969a7eaa5ca8b6af1db8a27f15dfd10061fae3d9d4')

prepare() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np0 -i ../giflib-5.1.patch
  patch -Np0 -i ../extern.patch
  patch -Np0 -i ../pointer_compare.patch
}

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np0 -i ${srcdir}/$pkgname-$pkgver.patch

  make prefix=${pkgdir}/usr install

  cd ${pkgdir}/usr/share/$pkgname/swfs
  rm -f default_loader.swf default_viewer.swf
  ln -s tessel_loader.swf default_loader.swf
  ln -s simple_viewer.swf default_viewer.swf
}
