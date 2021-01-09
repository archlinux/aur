# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=1.2.0
_pkgref=dbff57507b20b4e723f1b82a9506809810711276
pkgrel=1
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-xlib' 'libkeybinder3')
makedepends=('python-setuptools' 'python-pipenv')
source=(
  "setup.py"
  "emojis.patch"
  "https://github.com/tom-james-watson/Emote/archive/${_pkgref}.tar.gz"
)
sha512sums=(
  '83b6697b96882d3854c0f64a208571bfeec3e6324790e5508a6bd32092c5d462e86fa676c561111d98cce8058f1730303658612427b66daac086236e3e365316'
  'cefe0364d1adcfdd914c8a265a7e9146506d03bd6208c6b1dd54fbd65daa276ef48fa2936f622e1aba694caf29dd3041af6f54a9e200d98de838f7d12852e746'
  '2dae4a078c006a64b2ece589e55a6aa392292cbd5fd596e3b08bdeb50977e6859b359b66fdbad7ae9d30c3bb5fafb90744a4add0aef4950cf8cdff91921f8fed'
)

build() {
  # Replace setup.py
  mv -f "$srcdir/setup.py" "$srcdir/Emote-$_pkgref/setup.py"
  # Apply emoji patch
  patch -d "$srcdir/Emote-$_pkgref" -p1 <emojis.patch
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
