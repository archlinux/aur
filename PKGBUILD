# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf-git
_pkgname=pkgconf
pkgver=1.6.3.0.gc862e03
pkgrel=1
pkgdesc='pkg-config compatible utility which does not depend on glib'
url='https://github.com/pkgconf/pkgconf'
arch=('i686' 'x86_64')
license=('ISC')
depends=(glibc sh)
makedepends=(git)
conflicts=('pkg-config' 'pkgconfig' 'pkgconf')
provides=('pkg-config' 'pkgconfig' 'pkgconf')
source=(git+https://github.com/pkgconf/pkgconf.git
        i686-pc-linux-gnu.personality
        x86_64-pc-linux-gnu.personality)
md5sums=('SKIP'
         'b5bee6aa847bfdcf84ef31229dba32a9'
         'c6d689e4e8bc7b2b3e13a911bab36e27')

_pcdirs=/usr/lib/pkgconfig:/usr/share/pkgconfig
_libdir=/usr/lib
_includedir=/usr/include

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed 's/^pkgconf-//;s/-/./g'
}

prepare() {
  mkdir build
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd build
  ../$_pkgname/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pkg-config-dir="$_pcdirs" \
    --with-system-libdir="$_libdir" \
    --with-system-includedir="$_includedir" \
    --disable-static
  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dt "$pkgdir/usr/share/pkgconfig/personality.d" -m644 \
    i686-pc-linux-gnu.personality \
    x86_64-pc-linux-gnu.personality
  ln -s pkgconf "$pkgdir/usr/bin/i686-pc-linux-gnu-pkg-config"
  ln -s pkgconf "$pkgdir/usr/bin/x86_64-pc-linux-gnu-pkg-config"
  ln -s pkgconf "$pkgdir/usr/bin/pkg-config"

  ln -s pkgconf.1 "$pkgdir/usr/share/man/man1/pkg-config.1"
  install -Dt "$pkgdir/usr/share/licenses/$_pkgname" -m644 $_pkgname/COPYING
}
