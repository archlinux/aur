# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=lib32-libvorbis-git
pkgver=1.3.7
pkgrel=1
pkgdesc='Vorbis codec library (32-bit)'
arch=('x86_64')
url='https://www.xiph.org/ogg/vorbis/'
license=('BSD')
depends=('lib32-libogg' 'libvorbis')
provides=('lib32-libvorbis' 'libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so')
conflicts=(lib32-libvorbis)
source=("git+https://gitlab.xiph.org/xiph/vorbis.git")
sha256sums=('SKIP')

pkgver() {
  cd vorbis
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd vorbis

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

#check() {
#  cd vorbis

#  make -j1 check
#}

package() {
  cd vorbis

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -d "$pkgdir/usr/share/licenses"
  ln -s libvorbis "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
