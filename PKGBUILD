# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Porizka <artee@beer.cz>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Semen Soldatov <simplexe@mail.ru>
# Maintainer: tee < teeaur at duck dot com >

pkgname=sqliteman
pkgver=2.0.0
pkgrel=1
pkgdesc='Graphical sqlite3 browser and editor'
arch=(x86_64)
url='https://github.com/pvanek/sqliteman'
license=(GPL-3.0-or-later)
depends=('glibc' 'libgcc' 'libstdc++' 'sqlite' 'qt6-base' 'qt6-tools' 'qscintilla-qt6' 'hicolor-icon-theme')
makedepends=('cmake')
source=("$pkgname-$pkgver.tgz::$url/archive/v$pkgver.tar.gz")
b2sums=('8cf698432eff149106ae24b0d5fb995f79906e074003190286e7016086a06ec06074d22b25314510396ecbd67ecdd9d8ea67e844def926fd10c47acc51d21091')

prepare() {
  :
}

build() {
  local DOCS=OFF
  if [[ -x /bin/sphinx-build && -x /bin/myst-inv && -s /usr/share/licenses/python-sphinx-furo/LICENSE ]]; then
    DOCS=ON
  else
    msg2 "python-sphinx-furo and python-myst-parser not found; docs won't be built"
  fi
  cmake "$pkgname-$pkgver" \
    -Wno-author \
    -B build \
    -DSQLITEMAN_WITH_DOCS=$DOCS \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
  [[ $DOCS == ON ]] && cmake --build build --target docs
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  cmake --install build --prefix="$pkgdir"/usr
  install -Dm644 "$pkgname-$pkgver"/README.md -t "$pkgdir/usr/share/docs/$pkgname/"
  [[ -d build/docs/html ]] && cp -ar build/docs/html/* "$pkgdir/usr/share/docs/$pkgname/"
  install -Dm644 "$pkgname-$pkgver"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
