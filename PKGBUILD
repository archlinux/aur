# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=anyfs-tools
pkgver=0.85.1c
pkgrel=5
pkgdesc="unix-way toolset for recovering and converting filesystems"
arch=('x86_64')
url="http://anyfs-tools.sourceforge.net/"
license=('GPL')
depends=(bzip2 e2fsprogs libmpeg2 xfsprogs fuse)
#makedepends=('linux-headers')
install=anyfs-tools.install
source=(http://downloads.sourceforge.net/sourceforge/anyfs-tools/${pkgname}-${pkgver}.tar.bz2
	disable-build-ext2fs.patch)
md5sums=('d3da0004cd0f037ec3e926acd3f520c2'
         '5ea91297b605d51b03243adda1efed27')

prepare() {
  cd "$srcdir"/$pkgname-${pkgver}
  find . -name Makefile.in -exec sed -i 's|$(INSTALLPATH)/sbin|$(INSTALLPATH)/bin|g' {} \;
}

build() {
  cd "$srcdir"/$pkgname-${pkgver}

  unset LDFLAGS
  unset CFLAGS
  patch -p1 <"$srcdir"/disable-build-ext2fs.patch

  #Dirty Arch64 fix which doesn't affect i686
  CFLAGS="-DNO_INLINE_FUNCS -D_INLINE_=static" \
    ./configure --prefix=/usr --build=i686-linux-gnu
  make -j1
  sed -i 's|ldconfig||' src/anysurrect/Makefile
}

package() {
  cd "$srcdir"/$pkgname-${pkgver}
  make INSTALLPATH="$pkgdir"/usr install
}
