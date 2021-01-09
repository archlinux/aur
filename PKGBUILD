# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=1.0.1
pkgrel=3
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-xlib' 'libkeybinder3')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "setup.py"
  "emojis.patch"
  "https://github.com/tom-james-watson/Emote/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  '83b6697b96882d3854c0f64a208571bfeec3e6324790e5508a6bd32092c5d462e86fa676c561111d98cce8058f1730303658612427b66daac086236e3e365316'
  'd06513f492a91b2140928b9e116be079b5fb09f8df38d84d0697a1791b470155e130dfdd42d9c3a4167771ca8a1e249a2840ff9e72b1d2feb819a223d6d4c340'
  '258c6333109571c8d008f8663a6864b9155100ac9afc083aa08008086c748ec6bc9d3711c2f2be9c8cc53c31dcc98cfa9fbeb6b5186301eec5821a546bf90aaa'
)

build() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$pkgver/setup.py"
  # Apply emoji patch
  patch -d "$srcdir/Emote-$pkgver" -p1 <emojis.patch
  # Move static files into the library
  mv -T "$srcdir/Emote-$pkgver/static" "$srcdir/Emote-$pkgver/emote/static"
  # Fix relative paths
  find "$srcdir/Emote-$pkgver" -type f -name "*.py" -print0 |
    xargs -0 \
      sed -Ei 's/"static\/[^"]*"/os.path.join(os.path.dirname(__file__), &)/g'
  # Fix .desktop file
  sed -Ei 's/\$\{SNAP\}//' "$srcdir/Emote-$pkgver/snap/gui/emote.desktop"
  # Fix version number
  sed -Ei \
    "s/os\\.environ\\.get\\(\"SNAP_VERSION\", \"dev build\"\\)/\"$pkgver\"/" \
    "$srcdir/Emote-$pkgver/emote/picker.py"
  cd "$srcdir/Emote-$pkgver"
  EMOTE_VERSION="$pkgver" \
    python setup.py build
}

package() {
  cd "$srcdir/Emote-$pkgver"
  EMOTE_VERSION="$pkgver" \
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d -m 0755 "$pkgdir/etc/xdg/autostart"
  install -m 0644 "$pkgdir/usr/share/applications/emote.desktop" \
    "$pkgdir/etc/xdg/autostart/emote.desktop"
}
