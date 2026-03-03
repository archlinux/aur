pkgname=awf-gtk3
pkgver=4.0.0
pkgrel=1
pkgdesc="Theme preview application for GTK 3"
arch=('x86_64')
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
depends=('gtk3' 'libnotify>=0.7.0' 'hicolor-icon-theme')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'gtk3')
conflicts=('awf-git')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
sha256sums=("dd3c5606375d67272097564fd1426b0ffdb3f2b83ef23c12f57ee772977b3a0d")

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  ./configure --enable-only-gtk3
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
