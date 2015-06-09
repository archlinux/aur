# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vivisect-git
pkgver=20150307
pkgrel=1
pkgdesc="Static analysis / emulation / symbolik analysis framework for PE/Elf/Mach-O/Blob binary formats on various architectures"
arch=('i686' 'x86_64')
depends=('python2' 'python2-psycopg2' 'python2-pyqt4' 'qt4')
makedepends=('git')
url="https://github.com/vivisect/vivisect"
license=('Apache')
source=(git+https://github.com/vivisect/vivisect
        vdbbin.sh
        vivbin.sh)
sha256sums=('SKIP'
            'bc0e8f4ad05ab33d658276de6ca76e846ea7057bab8dd80285840b5495c8127a'
            '8ba658b56c33295edab6c350793850eb366d7a16011cc0d49bd7c48a74638ce3')
provides=('vivisect')
conflicts=('vivisect')
install=vivisect.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -Dm 755 "$srcdir/vdbbin.sh" "$pkgdir/usr/bin/vdbbin"
  install -Dm 755 "$srcdir/vivbin.sh" "$pkgdir/usr/bin/vivbin"
  install -dm 755 "$pkgdir/usr/share/vivisect"
  tar -c . | tar -x -C "$pkgdir/usr/share/vivisect"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
