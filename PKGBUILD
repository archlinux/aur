pkgname=awf-gtk3
pkgver=2.8.0
pkgrel=3
pkgdesc="Theme preview application for GTK"
arch=('x86_64')
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
depends=('gtk3' 'hicolor-icon-theme')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'gtk3')
conflicts=('awf-git')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
md5sums=("f0649d6faf1eb96f49da8098d016c27e")

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -i 's/ -eq 2/ -eq -1/g' configure.ac
  sed -i 's/ -eq 4/ -eq -1/g' configure.ac
  touch {NEWS,AUTHORS,README,ChangeLog}
  mv LICENSE COPYING
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  ./configure
  make -s
}

package() {
  cd "$pkgname-$pkgver"

  install -Dpm 755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -dm 755 "$pkgdir/usr/share/applications/"
  desktop-file-install --dir="$pkgdir/usr/share/applications/" "applications/$pkgname.desktop"

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dpm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  install -dm 755 "$pkgdir/usr/share/icons/hicolor/"
  for file in icons/*/*/awf.png; do mv $file ${file/\/awf.png/\/$pkgname.png}; done
  for file in icons/*/*/awf.svg; do mv $file ${file/\/awf.svg/\/$pkgname.svg}; done
  cp -a icons/* "$pkgdir/usr/share/icons/hicolor/"

  install -Dpm 644 "debian/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dpm 644 "debian/$pkgname.fr.1" "$pkgdir/usr/share/man/fr/man1/$pkgname.1"

  for file in src/po/*.po; do
    code=$(basename "$file" .po)
    install -dm 755 "$pkgdir/usr/share/locale/$code/LC_MESSAGES/"
    msgfmt "src/po/$code.po" -o "$pkgdir/usr/share/locale/$code/LC_MESSAGES/$pkgname.mo"
  done
}