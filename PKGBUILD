# Maintainer: Luke Arms <luke@arms.to>

pkgname=emote
pkgver=4.0.1
pkgrel=2
url="https://github.com/tom-james-watson/Emote"
pkgdesc="Emoji Picker for Linux written in GTK3"
arch=('any')
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'python-manimpango' 'libkeybinder3' 'python-setproctitle' 'dbus-python' 'hicolor-icon-theme' 'emoji-font' 'xdotool')
makedepends=('python-setuptools' 'python-pipenv')
source=("https://github.com/tom-james-watson/Emote/archive/refs/tags/v${pkgver}.tar.gz"
        'setup.py')
sha256sums=('29814ec5dc5cef61f99a8c651fccefb8de7a034325a5b97a921f4b852509d3ca'
            'fd547230882ef6ad500579afab912b0567e7ba061f36283c84b8504a78356d59')

prepare() {
  local staticdir=$srcdir/Emote-$pkgver/static rootdir
  # Remove "X-Flatpak=..." and "X-GNOME-Autostart-enabled=...", and replace
  # "Icon=..." while copying com.tomjwatson.Emote.desktop to emote.desktop
  sed -E '/^X-(Flatpak|GNOME-Autostart-enabled)=/d; s/^(Icon)=.*/\1=emote/' \
    "$staticdir/com.tomjwatson.Emote.desktop" |
    install -Dm 644 /dev/stdin "$staticdir/emote.desktop"
  # Duplicate logo.svg as emote.svg to save renaming it later
  install -Dm 644 "$staticdir/logo.svg" "$staticdir/emote.svg"
  # Add static files Emote needs at runtime to the emote package
  install -Dm 644 -t "$srcdir/Emote-$pkgver/emote/static/" "$staticdir"/{emojis.csv,logo.svg,style.css}
  # Replace setup.py with one that installs the assets above
  install -Dm 644 "$srcdir/setup.py" "$srcdir/Emote-$pkgver/setup.py"
  # And replace relative references to "static/"
  rootdir=$(python -c 'import sysconfig as _; print(_.get_paths()["purelib"])')/emote
  rootdir=${rootdir//\\/\\\\}
  rootdir=${rootdir//\//\\\/}
  sed -Ei "s/([^/])(static\\/)/\\1${rootdir}\\/\\2/" "$srcdir/Emote-$pkgver"/emote/*.py
}

build() {
  cd "$srcdir/Emote-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Emote-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  # Start automatically by default
  install -Dm 644 "$pkgdir/usr/share/applications/emote.desktop" "$pkgdir/etc/xdg/autostart/emote.desktop"
}
