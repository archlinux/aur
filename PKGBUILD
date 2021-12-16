# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=3.0.3
_pkgref=ff40e3d66b251aaf2e91116ba177e59f087e1021
pkgrel=4
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-xlib' 'python-manimpango' 'libkeybinder3' 'xdotool')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "https://github.com/tom-james-watson/Emote/archive/${_pkgref}.tar.gz"
  'setup.py'
  'fix-skin-tone-static-path.patch'
)
sha512sums=(
  'SKIP'
  'ef8caea8ad9e9bc0487dd8c816561027adda743c1e8e2779a64e7ae99fb227c820f31ef9c87fb910bae7a8ffc623e5e2e1a53a8c69ce0a35ad96557e97a5a949'
  '52d3dce0cecfe62ccc4469b4b35b27c8332d6dce2d1e2dd5603c85a3025fb4a415df303eaaace5579c4204923cbd8d86846deb1026a01f8b201452453c61746f'
)

build() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$_pkgref/setup.py"
  # Fix skin tone and `static/` path issues when not running as a snap
  patch -d "$srcdir/Emote-$_pkgref" -p1 <"$srcdir/fix-skin-tone-static-path.patch"
  # Move static files into the library
  mv -T "$srcdir/Emote-$_pkgref/static" "$srcdir/Emote-$_pkgref/emote/static"
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
