# Maintainer: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Muhammed Uluyol <muhammedu@gmail.com>

pkgname=scratch
pkgver=1.4.0.7
pkgrel=3
pkgdesc="Create and share your own interactive stories, games, music and art"
arch=('i686' 'x86_64')
url="http://scratch.mit.edu"
license=('GPL2')
install=$pkgname.install
depends=('squeak-vm' 'shared-mime-info' 'desktop-file-utils' 'pango'
         'gtk-update-icon-cache')
source=(http://download.scratch.mit.edu/$pkgname-$pkgver.src.tar.gz)
md5sums=('f948e9e6de3ec9c7c7b4cc2a1975eb5a')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver.src

  sed -i 's/-vm-sound-pulse/-vm-sound-ALSA/' src/$pkgname
}

build() {
  cd "$srcdir"/$pkgname-$pkgver.src

  make build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver.src

  install -Dm755 src/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 Scratch.image "$pkgdir"/usr/lib/$pkgname/Scratch.image
  install -m644 Scratch.ini "$pkgdir"/usr/lib/$pkgname/Scratch.ini
  install -Dm644 src/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 src/man/$pkgname.1.gz "$pkgdir"/usr/share/man/man1/$pkgname.1.gz
  install -Dm644 src/$pkgname.xml "$pkgdir"/usr/share/mime/packages/$pkgname.xml
  install -dm755 "$pkgdir"/usr/share/{$pkgname,icons/hicolor}

  cp -rp Help locale Media Projects README "$pkgdir"/usr/share/$pkgname/
  cp -rp Plugins "$pkgdir"/usr/lib/$pkgname/

  for res in 32 48 128; do
    install -D -m644 src/icons/${res}x${res}/$pkgname.png \
      "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png
  done
}
