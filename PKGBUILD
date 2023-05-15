# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=3.1.0
_pkgref=1539e91d02c93e1438a2912940f687ce40dc2bfe
_openmojiref=90c4aa28c902212d7e784f388ff5d1c15fcac617
pkgrel=2
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-manimpango' 'libkeybinder3' 'xdotool')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "https://github.com/tom-james-watson/Emote/archive/${_pkgref}.tar.gz"
  "https://raw.githubusercontent.com/hfg-gmuend/openmoji/${_openmojiref}/data/openmoji.csv"
  'setup.py'
  'fix-skin-tone-static-path.patch'
)
sha512sums=(
  'SKIP'
  'b726a0e89142da3bb0b67ca2b7fd1d7002832e01569eeb2de4a64abfd14cb3d7da315b086d171fe8dce11e9064c6c7922aa33863bff77b9073e505e91fe7e6b7'
  'ef8caea8ad9e9bc0487dd8c816561027adda743c1e8e2779a64e7ae99fb227c820f31ef9c87fb910bae7a8ffc623e5e2e1a53a8c69ce0a35ad96557e97a5a949'
  '76e5a84646dafb37b6ee83e564aefd5ccaca619d47802d2ea4e4190ec2af5a0c485aa6d9a2f8969732ca7156c458fd18105614b6826ade834943a8c19c3d8e3f'
)

prepare() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$_pkgref/setup.py"
  # Fix skin tone and `static/` path issues when not running as a snap
  patch -d "$srcdir/Emote-$_pkgref" -p1 <"$srcdir/fix-skin-tone-static-path.patch"
  cd "$srcdir/Emote-$_pkgref"
  ./update-emojis "$srcdir/openmoji.csv"
}

build() {
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
