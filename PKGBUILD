# Maintainer: Jose Riha <jose1711 gmail com>
#
pkgname=cycle-git
pkgver=r3.354bc6e
pkgrel=2
pkgdesc="Cycle is a calendar program for women (git)"
arch=('any')
url="https://github.com/jose1711/cycle"
license=('GPL')
depends=('python2' 'wxpython')
source=($pkgname::"git+https://github.com/jose1711/cycle.git" cycle.desktop)
md5sums=('SKIP'
         '2ce056808512dcdf55f0375b159ae6b1')

pkgver() {
  cd "$srcdir"/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
  python2 setup.py install --root=${pkgdir} --optimize=1

  mkdir -p ${pkgdir}/usr/share/{cycle,man/man1}
  cp -pR * ${pkgdir}/usr/share/cycle
  mv cycle.1 ${pkgdir}/usr/share/man/man1
  install -Dm644 README*.html -t $pkgdir/usr/share/doc/cycle
  install -Dm644 icons/cycle.xpm $pkgdir/usr/share/pixmaps/cycle.xpm
  install -Dm644 $srcdir/cycle.desktop $pkgdir/usr/share/applications/cycle.desktop
  cat >./cycle <<EOF
#!/bin/bash
test -d ~/.cycle || mkdir ~/.cycle
cd /usr/share/cycle/
exec ./cycle.py
EOF
  install -D -m755 ./cycle ${pkgdir}/usr/bin/cycle
}

# vim:set ts=2 sw=2 et:
