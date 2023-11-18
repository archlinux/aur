# Maintainer: karboncore

pkgbase=crrcsim
pkgname=$pkgbase
pkgver=0.9.13
pkgrel=3
pkgdesc="RC airplane flight simulator"
arch=('x86_64')
url="https://sourceforge.net/projects/crrcsim"
license=('GPL2')
depends=('boost-libs' 'jack2' 'libjpeg-turbo' 'portaudio' 'sdl12-compat')
makedepends=('cgal' 'plib')
source=("https://sourceforge.net/projects/$pkgbase/files/$pkgbase/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz"
        'crrcsim_animation.patch'
        'crrcsim.desktop')
sha256sums=('abe59b35ebb4322f3c48e6aca57dbf27074282d4928d66c0caa40d7a97391698'
            '49cc3598b18cbfee8af2dd891dc4cbeb1550ff72de93185e83abf8b79288c099'
            '075cc9d39ba6215208f822802603b7e7c9a1d693cb401aaaadac65a81ff9c1cb')
        
prepare() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p1 < ../crrcsim_animation.patch
  sed -i "s/boost_thread-mt/boost_thread/g;s/-lCGAL//g;
          /^m4_define(\[tmp_id\]/d;/^m4_define(\[tmp_tag\]/d;
          s/m4_define(\[tmp_ver\], \[tmp_tag\] (\[tmp_id\]))/m4_define(\[tmp_ver\], \[$pkgver\]))/g" \
          ./configure.ac
  sed -i "1i AUTOMAKE_OPTIONS = subdir-objects" Makefile.am
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 ../crrcsim.desktop "$pkgdir/usr/share/applications/crrcsim.desktop"
  make DESTDIR="$pkgdir" install
}
