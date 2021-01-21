# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=1.3.0
_pkgref=e2290ebfd56fd44b976358aaeea33b6a260f1dc1
pkgrel=1
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-xlib' 'libkeybinder3' 'noto-fonts-emoji')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "setup.py"
  "https://github.com/tom-james-watson/Emote/archive/${_pkgref}.tar.gz"
)
sha512sums=(
  '83b6697b96882d3854c0f64a208571bfeec3e6324790e5508a6bd32092c5d462e86fa676c561111d98cce8058f1730303658612427b66daac086236e3e365316'
  'fc319778ba7dadaa0c58e59726e981ce0c53917dba693390a6aa8dac5a8e1d34e4536e098bc3f5e4855fe3c2abaa069eec362769c6563ddb3f2330f70cd6ef58'
)

build() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$_pkgref/setup.py"
  # Move static files into the library
  mv -T "$srcdir/Emote-$_pkgref/static" "$srcdir/Emote-$_pkgref/emote/static"
  # Fix relative paths
  find "$srcdir/Emote-$_pkgref" -type f -name "*.py" -print0 |
    xargs -0 \
      sed -Ei 's/"static\/[^"]*"/os.path.join(os.path.dirname(__file__), &)/g'
  # Fix .desktop file
  sed -Ei 's/\$\{SNAP\}//' "$srcdir/Emote-$_pkgref/snap/gui/emote.desktop"
  # Fix version number
  sed -Ei \
    "s/os\\.environ\\.get\\(\"SNAP_VERSION\", \"dev build\"\\)/\"$pkgver\"/" \
    "$srcdir/Emote-$_pkgref/emote/picker.py"
  cd "$srcdir/Emote-$_pkgref"
  EMOTE_VERSION="$pkgver" \
    python setup.py build
}

package() {
  cd "$srcdir/Emote-$_pkgref"
  EMOTE_VERSION="$pkgver" \
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d -m 0755 "$pkgdir/etc/xdg/autostart"
  install -m 0644 "$pkgdir/usr/share/applications/emote.desktop" \
    "$pkgdir/etc/xdg/autostart/emote.desktop"
}
