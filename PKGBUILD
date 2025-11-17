# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=2.0.1
pkgrel=1
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
depends=(imagemagick intltool gettext)
optdepends=(
  "ffmpeg: video resizing/encoding features"
  "xdg-utils: xdg-email support"
  "kdialog: shows GUI error dialogs (optional at runtime)"
)
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/KIM-6/kim6/archive/refs/tags/"$pkgver".tar.gz)
sha512sums=('d5f279109503723fb740f6a85be53fb405295f6fdefd996d4578848dcd33fc82a4cc9e7f53eadfffe318753afd829c835631e273f15d6a64d31240aea400be10') 

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Generate .desktop from .desktop.in if needed (matches install.sh intent)
  if ! ls src/kim_*.desktop >/dev/null 2>&1; then
    if ls src/*.desktop.in >/dev/null 2>&1; then
      for ini in src/*.desktop.in; do
        # Merge translations; quiet to keep logs clean
        intltool-merge --quiet --desktop-style po "$ini" "${ini%.in}"
      done
    fi
  fi
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  kdeinstdir="$pkgdir$(qmake6 -query QT_INSTALL_PREFIX)"
  
  # Creates required folders 
  mkdir -p "$kdeinstdir/share/apps/kim/"
  mkdir -p "$kdeinstdir/share/kio/servicemenus/"
  mkdir -p "$kdeinstdir/share/locale/"
  mkdir -p "$kdeinstdir/bin"

  # Copy programs to their respective folders
  install -m644 src/kim_*.desktop "$kdeinstdir"/share/kio/servicemenus 
  install -m755 src/bin/kim* "$kdeinstdir"/bin/
  
  # Copy binary files
  if [[ -f src/bin/kim ]]; then
    install -m755 src/bin/kim "$kdeinstdir"/bin/
  fi
  if compgen -G 'src/bin/kim_*' >/dev/null; then
    install -m755 src/bin/kim_* "$kdeinstdir"/bin/ || true
  fi
  
  # Copy translation files
  if [[ -f kim_translation ]]; then
    install -m644 kim_translation "$kdeinstdir/"
  fi

  # Copy helper assets
  if [[ -d src/gallery ]]; then
    cp -r --preserve=mode,timestamps src/gallery "$kdeinstdir/share/apps/kim/" 2>/dev/null || :
  fi
  if [[ -d src/slideshow ]]; then
    cp -r --preserve=mode,timestamps src/slideshow "$kdeinstdir/share/apps/kim/" 2>/dev/null || :
  fi

  # Patch the translation loader to look for packaged locales
  if [[ -f src/kim_translation ]]; then
    sed -i "s|LOCALE_SOURCE_TTT|'$kdeinstdir/share/locale'|g" src/kim_translation
  fi

  # Compile translations (po/*.po → kim6.mo under helper’s locale/)
  if compgen -G 'po/*.po' >/dev/null; then
    while IFS= read -r -d '' po; do
      local lang="${po##*/}"; lang="${lang%.po}"
      install -d "$kdeinstdir/share/locale/$lang/LC_MESSAGES"
      msgfmt -o "$kdeinstdir/share/locale/$lang/LC_MESSAGES/kim6.mo" "$po"
    done < <(find po -maxdepth 1 -name '*.po' -print0)
  fi
  
  # License files
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [[ -f ABOUT   ]] && install -Dm644 ABOUT   "$pkgdir/usr/share/doc/$pkgname/ABOUT"
  compgen -G 'README*' >/dev/null && install -Dm644 README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
