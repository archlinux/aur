# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Nathan Dyer <https://github.com/nathandyer>

pkgname=vocal
pkgver=2.4.2
pkgrel=4
pkgdesc='Powerful, beautiful and simple podcast client for Pantheon'
arch=('x86_64')
url='https://vocalproject.net/'
license=('GPL3')
depends=('clutter-gst' 'clutter-gtk' 'granite' 'gst-plugins-good' 'gst-libav' 'gvfs' 'libnotify')
makedepends=('cmake' 'ninja' 'vala')
source=("https://github.com/needle-and-thread/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'remove-about.patch')
sha256sums=('be1991f08db05feacad30a0f459002327ba5ff3cb04757383f1da62904acdb41'
            '805613a82898c36ddd18a93aa034e87d771dade1382275537ba7b4c57c28dc6a')

prepare() {
  cd $pkgname-$pkgver

  # Fix build with granite 6
  patch -Np1 -i ../remove-about.patch

  # Remove unused webkit2gtk dependency
  sed -i 's/webkit2gtk-4.0//' CMakeLists.txt
}

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -s com.github.needleandthread.vocal "$pkgdir/usr/bin/$pkgname"
}
