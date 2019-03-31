# Maintainer:  Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>
# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=gitahead
pkgrel=2
pkgver=2.5.5
pkgdesc='Graphical Git client that helps you understand and manage your source history'
url='https://www.gitahead.com/'
arch=('x86_64')
license=('MIT')
depends=('desktop-file-utils' 'qt5-base')
makedepends=('cmake' 'ninja')
source=(
  "git+https://github.com/gitahead/gitahead#tag=v${pkgver}"
  "gitahead.desktop"
  "gitahead.patch"
)
sha256sums=('SKIP'
            '022132e59ea2a1ca43df8ca1e20a1f851fca6e61afe4899814619ca241df7f19'
            '154bedf8ae6bc8300aa31f92b37acf04bbbc25f8a61a681b72ca360a640fc162')

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
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/usr/lib -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ../gitahead
  ninja
}

package() {
  cd "$srcdir/gitahead-build"

  ninja install

  rm -f "${pkgdir}"/usr/*.so.*
  rm -f "${pkgdir}/usr/bin/cmark"
  mv "${pkgdir}/usr/GitAhead" "${pkgdir}/usr/bin/gitahead"

  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}"/usr/share/{doc,man}
  rm -rf "${pkgdir}"/usr/{lib,lib64}

  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/Plugins" "${pkgdir}/usr/lib/${pkgname}/plugins"

  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gitahead.png"
  install -D -m644 "${pkgdir}/usr/Resources/GitAhead.iconset/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gitahead.png"
  rm -rf "${pkgdir}/usr/Resources/GitAhead.iconset"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/usr/Resources" "${pkgdir}/usr/share/${pkgname}/resources"

  rm -f "${pkgdir}"/usr/{git-credential-libsecret,indexer,qt.conf,relauncher}

  install -D -m644 ../gitahead/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"
}
