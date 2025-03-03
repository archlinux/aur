pkgname=awf-gtk2
pkgver=2.8.1
pkgrel=1
pkgdesc="Theme preview application for GTK 2"
arch=('x86_64')
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
depends=('gtk2' 'hicolor-icon-theme')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'gtk2')
conflicts=('awf-git')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
sha256sums=("9370d2906a2e60fad41017057bac950934ceb8e1a03d47254d7d52c8860ff18c")

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -i 's/ -eq 3/ -eq -1/g' configure.ac
  sed -i 's/ -eq 4/ -eq -1/g' configure.ac
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
  desktop-file-install --dir="$pkgdir/usr/share/applications/" "data/$pkgname.desktop"

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm 755 "$pkgdir/usr/share/applications/icons/hicolor/"
  for file in data/icons/*/*/awf.png; do mv $file ${file/\/awf.png/\/$pkgname.png}; done
  for file in data/icons/*/*/awf.svg; do mv $file ${file/\/awf.svg/\/$pkgname.svg}; done
  cp -a data/icons/* "$pkgdir/usr/share/applications/icons/hicolor/"

  install -Dpm 644 "data/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dpm 644 "data/$pkgname.fr.1" "$pkgdir/usr/share/man/fr/man1/$pkgname.1"

  for file in src/po/*.po; do
    code=$(basename "$file" .po)
    install -dm 755 "$pkgdir/usr/share/locale/$code/LC_MESSAGES/"
    msgfmt "src/po/$code.po" -o "$pkgdir/usr/share/locale/$code/LC_MESSAGES/$pkgname.mo"
  done
}