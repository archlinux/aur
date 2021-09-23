# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=3.0.3
_pkgref=ff40e3d66b251aaf2e91116ba177e59f087e1021
pkgrel=1
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-xlib' 'python-manimpango' 'libkeybinder3' 'xdotool')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "https://github.com/tom-james-watson/Emote/archive/${_pkgref}.tar.gz"
  'setup.py'
  'fix-relative-paths.patch'
)
sha512sums=(
  'SKIP'
  'ef8caea8ad9e9bc0487dd8c816561027adda743c1e8e2779a64e7ae99fb227c820f31ef9c87fb910bae7a8ffc623e5e2e1a53a8c69ce0a35ad96557e97a5a949'
  '421f51590edcaa5c2143cc0ad3b8e29276219445365750ea359b36e4b1f1f8b48ccf85e966ba8a2d9166c74fdca3fbebf747e49498a1916c917149d0e68b6790'
)

build() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$_pkgref/setup.py"
  # Move static files into the library
  mv -T "$srcdir/Emote-$_pkgref/static" "$srcdir/Emote-$_pkgref/emote/static"
  # Fix relative paths
  #find "$srcdir/Emote-$_pkgref" -type f -name "*.py" -print0 |
  #  xargs -0 \
  #    sed -Ei 's/"static\/[^"]*"/os.path.join(os.path.dirname(__file__), &)/g'
  patch -d "$srcdir/Emote-$_pkgref" -p1 <"$srcdir/fix-relative-paths.patch"
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
