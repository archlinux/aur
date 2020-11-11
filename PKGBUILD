# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname=openmarias
pkgver=1.1.0.svn.r222
pkgrel=4
pkgdesc="A Qt-based Marias card game."
arch=('x86_64')
url='https://sourceforge.net/projects/openmarias/'
license=('GNU')
depends=('qt5-base')
source=('openmarias::svn+https://svn.code.sf.net/p/openmarias/code'
        'qt5_fix.diff'
        'path.diff'
        'openmarias.desktop'
        )
sha256sums=('SKIP'
            '80ce09a4f6f71969e96b7a4b4ad0c9887c68b51de3e85022931254dfd142ba3f'
            '0ea629f32bc12aaf16455b4a60a1b99f8e17d66183146151024fd1e80cb06d98'
            '415ac6985279db9ce3388ddf604e7c641c5c2b7e51290a83d05469be0e269fdf'
           )

pkgver() {
  cd $pkgname
  echo "$(cat default.ini | egrep '^(major|minor|revision)=' | sed -r -e 's/.*=//' -e 's/^([0-9]).*/\1/' | tr '\n' '.' | sed 's/.$//').svn.r$(svnversion | tr -d M)"
}

prepare() {
  cd $pkgname
  patch --forward --strip 0 --input "$srcdir/qt5_fix.diff"
  patch --forward --strip 1 --input "$srcdir/path.diff"
}

build() {
  cd $pkgname
  qmake -makefile
  make
}

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname/"{LICENCE,README_EN}.txt -t "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/"{$pkgname/img,applications,pixmaps}
  cp -r "$srcdir/$pkgname/img/"{classic7,rub.png} "$pkgdir/usr/share/$pkgname/img"
  cp -r "$srcdir/$pkgname/i18n" "$pkgdir/usr/share/$pkgname/"
  cp "$srcdir/$pkgname/default.ini" $pkgdir/usr/share/$pkgname/marias.ini
  cp "$srcdir/$pkgname.desktop" $pkgdir/usr/share/applications/
  cp "$srcdir/$pkgname/img/favicon.png" $pkgdir/usr/share/pixmaps/$pkgname.png
}
