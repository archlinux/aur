# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: yar

pkgname=stlviewer-git
pkgver=20150602
pkgrel=1
pkgdesc="Simple command line tool to view STL files"
arch=('i686' 'x86_64')
depends=('freeglut')
makedepends=('gcc' 'git' 'glu' 'python2')
url="https://github.com/vishpat/stlviewer/wiki"
license=('custom')
source=(git+https://github.com/vishpat/stlviewer
        LICENSE)
sha256sums=('SKIP'
            'f43ca3551171a46b73b45c0cb37f57408294feea87f7a840a5dc642edf6f68b2')
provides=('stlviewer')
conflicts=('stlviewer')

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

build() {
  cd ${pkgname%-git}

  msg 'Compiling...'
  python2 compile.py
}

package() {
  cd ${pkgname%-git}

  msg 'Installing executable...'
  install -D -m755 stlviewer "${pkgdir}/usr/bin/stlviewer"

  msg 'Installing license...'
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
