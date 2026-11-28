# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe
pkgver=7.3.1
pkgrel=1
pkgdesc="The extensible drawing editor"
url="http://ipe.otfried.org/"
depends=('lua' 'qt6-base' 'qt6-svg' 'freetype2' 'zlib' 'libjpeg-turbo' 'libpng'
         'cairo' 'curl' 'hicolor-icon-theme' 'gsl' 'libspiro' 'qtspell')
makedepends=('desktop-file-utils')
arch=('i686' 'x86_64')
license=("GPL")
conflicts=('ipe')
source=("https://github.com/otfried/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "ipe.bash-completion")
sha256sums=('a66fdbe794bb23c1c9f526137fcd4d241dc4c7e879628827f451984f2d7ba5a9'
            '7d8aa1af9758ce3ad43911bb3e616c28395221fcfccfbf8c4f72dbcc90877f35')

_makeargs=(IPEPREFIX=/usr IPEUI=QT MOC=/usr/lib/qt6/moc IPE_SPELLCHECK=1 LUA_PACKAGE=lua)

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make "${_makeargs[@]}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make "${_makeargs[@]}" INSTALL_ROOT="$pkgdir" install

  # Keep Qt's desktop ID and advertise only the file types Ipe opens directly.
  local applications="$pkgdir/usr/share/applications"
  desktop-file-edit --set-key=Exec --set-value='/usr/bin/ipe %f' \
    --set-key=StartupWMClass --set-value=ipe \
    --remove-mime-type=application/pdf "$applications/org.otfried.Ipe.desktop"
  mv "$applications/org.otfried.Ipe.desktop" "$applications/ipe.desktop"

  # Lua binding
  local luadir
  luadir=$(pkg-config --variable=INSTALL_CMOD lua)
  install -d "$pkgdir$luadir"
  ln -s ../../libipelua.so "$pkgdir$luadir/ipe.so"

  # Bash completion
  install -Dm644 "$srcdir/ipe.bash-completion" "$pkgdir/etc/bash_completion.d/ipe"
}

# vim: ft=sh syn=sh et ts=2 sw=2
