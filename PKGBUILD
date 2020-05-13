# Maintainter: Felix Golatofski <contact@xdfr.de>
# Contributor: Árni Dagur <arnidg@protonmail.ch>
# Adapted from original PKGBULID written by: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=gzip-with-pigz-symlinks
_pkgname=gzip
pkgver=1.10
pkgrel=2
pkgdesc='GNU compression utility with binary symlinked to pigz'
arch=('x86_64' 'i686')
url='https://www.gnu.org/software/gzip/'
license=('GPL3')
depends=('glibc' 'pigz' 'bash' 'less')
provides=('gzip')
conflicts=('gzip')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE') # Jim Meyering
source=("https://ftp.gnu.org/pub/gnu/gzip/gzip-$pkgver.tar.xz"{,.sig})
sha256sums=('8425ccac99872d544d4310305f915f5ea81e04d0f437ef1a230dc9d1c819d7c0'
            'SKIP')

prepare() {
  cd $_pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}


build() {
  cd $_pkgname-$pkgver
  ./configure prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver

  make prefix="$pkgdir"/usr install
  ln -sf pigz "$pkgdir"/usr/bin/gzip
}
