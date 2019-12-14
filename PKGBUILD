# Maintainer:  Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>
# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=gitahead
pkgrel=1
pkgver=2.6.0
pkgdesc='Graphical Git client that helps you understand and manage your source history'
url='https://www.gitahead.com/'
arch=('x86_64')
license=('MIT')
depends=('desktop-file-utils' 'qt5-base' 'git')
makedepends=('cmake' 'ninja' 'git' 'qt5-tools' 'qt5-translations')
source=(
  "git+https://github.com/gitahead/gitahead#tag=v${pkgver}"
  "gitahead.desktop"
  "gitahead.patch"
)
sha256sums=('SKIP'
            '022132e59ea2a1ca43df8ca1e20a1f851fca6e61afe4899814619ca241df7f19'
            '096e8f3700d7d74884e81eae3282fa1b4fad1cfa7a179ff03f1a7d89867538a0')

prepare() {
  cd "$srcdir/gitahead"
  patch --forward --strip=1 --input="../gitahead.patch"

  git submodule update --init --recursive
}

build() {
  if [ ! -d "$srcdir/gitahead-build" ]; then
    mkdir "$srcdir/gitahead-build"
  fi
  cd "$srcdir/gitahead-build"
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/lib ../gitahead
  ninja
}

package() {
  cd "$srcdir/gitahead-build"

  ninja package

  mkdir -p "${pkgdir}/usr/"{share,bin}

  cp -r "${srcdir}/gitahead-build/_CPack_Packages/Linux/STGZ/GitAhead-${pkgver}" "${pkgdir}/usr/share/gitahead"

  rm -rf "${pkgdir}/usr/share/gitahead/"*.so.*
  ln -s "/usr/share/gitahead/GitAhead" "${pkgdir}/usr/bin/gitahead"

  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/share/gitahead/Resources/GitAhead.iconset/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gitahead.png"

  install -D -m644 ${srcdir}/gitahead/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
}
