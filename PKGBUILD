# Maintainer: local

pkgname=zigmkhuman
pkgver=1.3.0.r0.g0000000
pkgrel=2
pkgdesc="MakeHuman 1 from upstream git bundled with the ZigMakeHuman aiohttp API"
arch=('any')
url="https://github.com/makehumancommunity/makehuman"
license=('AGPL-3.0-or-later AND CC0-1.0')
depends=(
  'python-aiohttp'
  'python-numpy'
  'python-opengl'
  'python-pyqt5'
  'qt5-svg'
  'hicolor-icon-theme'
)
optdepends=(
  'python-pygments: IPython Qt Console plugin'
  'python-distro: distro detection for debug output'
)
makedepends=('git')
install="$pkgname.install"
_assets_commit='8cf9645b975a98eea056b140df11a1d278da0d10'
source=(
  "makehuman::git+https://github.com/makehumancommunity/makehuman.git"
  "$pkgname-assets-$_assets_commit.tar.gz::https://github.com/makehumancommunity/makehuman-assets/archive/$_assets_commit.tar.gz"
  'zigmkhuman_aiohttp_api.example.json'
  'zigmkhuman_aiohttp_api_plugin.py'
  'zigmkhuman_aiohttp_api_webui.html'
  'makehuman-numpy2-compat.patch'
)
b2sums=(
  'SKIP'
  '252bacf8ca8e32848fcf9c9e8c2257070519f3c2109a6e8efee43229875e8cd93027504cfd22b9b729d4e94c04b80478851e32fb0aa22be78baf1a1d8e8ac0cd'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/makehuman"
  printf '1.3.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "$srcdir/$pkgname-src" "$srcdir/build"
  cp -a "$srcdir/makehuman" "$srcdir/$pkgname-src"

  cd "$srcdir/$pkgname-src"
  patch -Np1 -i "$startdir/makehuman-numpy2-compat.patch"

  install -d "$srcdir/$pkgname-src/makehuman/plugins/9_aiohttp_api"
  install -Dm644 "$startdir/zigmkhuman_aiohttp_api_plugin.py" \
    "$srcdir/$pkgname-src/makehuman/plugins/9_aiohttp_api/__init__.py"
  install -Dm644 "$startdir/zigmkhuman_aiohttp_api_webui.html" \
    "$srcdir/$pkgname-src/makehuman/plugins/9_aiohttp_api/webui.html"

  cp -r "$srcdir/makehuman-assets-$_assets_commit"/base/* "$srcdir/$pkgname-src/makehuman/data/"

  mkdir -p .git

  cd buildscripts
  sed -e '/#isRelease = True/s/^#//' \
      -e 's/#version=.*$/version=1.3.0/' \
      -e '/#gitBranch=master/s/^#//' \
      < build.conf.example > build.conf

  sed -i \
      -e 's/MakeHuman VERSION/ZigMakeHuman/' \
      -e 's/^Exec=.*/Exec=zigmkhuman/' \
      -e 's|Icon=/usr/share/makehuman/makehuman.svg|Icon=zigmkhuman|' \
      deb/debian/MakeHuman.desktop
}

build() {
  cd "$srcdir/$pkgname-src"
  python buildscripts/build_prepare.py --nodownload . "$srcdir/build"
  python -m compileall -o 0 -o 1 -s "$srcdir/build" -p /opt/zigmkhuman "$srcdir/build/makehuman"
}

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/build/makehuman" "$pkgdir/opt/zigmkhuman"

  find "$pkgdir/opt/zigmkhuman" -empty -type d -delete
  find "$pkgdir/opt/zigmkhuman" -executable -type f -exec chmod a-x '{}' +
  chmod a+x "$pkgdir/opt/zigmkhuman/makehuman.py"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/zigmkhuman/makehuman.py "$pkgdir/usr/bin/zigmkhuman"
  install -Dm755 "$startdir/zigmkhuman_api_client.py" "$pkgdir/usr/bin/zigmkhuman-api-client"

  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  ln -s /opt/zigmkhuman/icons/makehuman.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/zigmkhuman.png"
  install -Dm644 "$srcdir/$pkgname-src/makehuman/icons/makehuman.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/zigmkhuman.svg"

  install -Dm644 "$srcdir/$pkgname-src/buildscripts/deb/debian/MakeHuman.desktop" "$pkgdir/usr/share/applications/zigmkhuman.desktop"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir"/build/LICENSE*.md

  install -Dm644 "$startdir/README_zigmkhuman.md" "$pkgdir/usr/share/doc/$pkgname/README_zigmkhuman.md"
  install -Dm644 "$startdir/zigmkhuman_aiohttp_api.example.json" "$pkgdir/usr/share/doc/$pkgname/zigmkhuman_aiohttp_api.example.json"
}
