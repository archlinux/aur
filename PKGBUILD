pkgname=awf-qt5
pkgver=4.1.0
pkgrel=1
pkgdesc="Theme preview application for Qt 5"
arch=('x86_64')
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
depends=('qt5-base' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('qt5-style-globalqss: for theme support')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'qt5-base')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
sha256sums=("2a7b103b383fcc54fd128e1b0fca972e2f23acab2532b9ed053fc40debea1514")

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  ./configure --enable-only-qt5
  make -s
}

package() {
  cd "$pkgname-$pkgver"

  install -Dpm 755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -dm 755 "$pkgdir/usr/share/applications/"
  desktop-file-install --dir="$pkgdir/usr/share/applications/" "data/$pkgname.desktop"

  install -dm 755 "$pkgdir/usr/share/applications/icons/hicolor/"
  for file in data/icons/*/*/awf.png; do mv $file ${file/\/awf.png/\/$pkgname.png}; done
  for file in data/icons/*/*/awf.svg; do mv $file ${file/\/awf.svg/\/$pkgname.svg}; done
  cp -a data/icons/* "$pkgdir/usr/share/applications/icons/hicolor/"

  install -Dpm 644 "data/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dpm 644 "data/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dpm 644 "data/$pkgname.fr.1" "$pkgdir/usr/share/man/fr/man1/$pkgname.1"

  for file in src/po/*.po; do
    code=$(basename "$file" .po)
    install -dm 755 "$pkgdir/usr/share/locale/$code/LC_MESSAGES/"
    msgfmt "src/po/$code.po" -o "$pkgdir/usr/share/locale/$code/LC_MESSAGES/$pkgname.mo"
  done

  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}