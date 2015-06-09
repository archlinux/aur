# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dyncall-git
pkgver=20150207
pkgrel=1
pkgdesc="Generic Dynamic FFI package"
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git'
             'make'
             'yasm')
url="https://github.com/MoarVM/dyncall"
license=('custom')
source=(git+https://github.com/MoarVM/dyncall)
sha256sums=('SKIP')
provides=('dyncall')
conflicts=('dyncall')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
