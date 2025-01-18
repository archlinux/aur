# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Luke Arms <luke@arms.to>

pkgname=emote
_pkgname=Emote
pkgver=4.1.0
pkgrel=2
pkgdesc='Modern popup emoji picker'
arch=('any')
url='https://github.com/tom-james-watson/Emote'
license=('GPL-3.0-only')
depends=('python' 'gtk3' 'python-gobject' 'libkeybinder3' 'python-setproctitle' 'dbus-python' 'hicolor-icon-theme' 'emoji-font')
makedepends=('python-setuptools' 'python-pipenv')
optdepends=('xdotool: automatic pasting in X11'
            'wl-clipboard: automatic copying in Wayland'
            'ydotool: automatic pasting in Wayland')
source=("https://github.com/tom-james-watson/$_pkgname/archive/refs/tags/v${pkgver}.tar.gz"
        'setup.py' # might be better to patch upstream rather than hardcoding a completely new version
        "${pkgname}_154.patch::${url}/pull/154.patch"
        'emote_wayland_autopaste.patch')
sha256sums=('171ddf7e216f12a9e0ed63cd0a97796fd63967df3b3aa5e452877b74aabd48c9'
            'c4a32b3e4be22e0214012c46a20de8218dd77cf54f884a4dccc3c4ff2ca0a18f'
            'c8fab9cd79c7def484809158930df576de5a6a4c08232272b3f8eed9ae18c874'
            '386def90668191e0930f2773e9b756399a4b8ec402760391128956ec02a35893')

prepare() {
  # Patch to remove unnecessary (and problematic) manimpango https://github.com/tom-james-watson/Emote/issues/126
  # N.B. this patches setup.py, which will be modified below anyway
  cd $_pkgname-$pkgver
  patch -p1 -i "$srcdir/${pkgname}_154.patch"

  local staticdir=$srcdir/$_pkgname-$pkgver/static rootdir
  # Remove "X-Flatpak=..." and "X-GNOME-Autostart-enabled=...", and replace
  # "Icon=..." while copying com.tomjwatson.Emote.desktop to emote.desktop
  sed -E '/^X-(Flatpak|GNOME-Autostart-enabled)=/d; s/^(Icon)=.*/\1=emote/' \
    "$staticdir/com.tomjwatson.Emote.desktop" |
    install -Dm 644 /dev/stdin "$staticdir/emote.desktop"
  # Duplicate logo.svg as emote.svg to save renaming it later
  install -Dm 644 "$staticdir/logo.svg" "$staticdir/emote.svg"
  # Add static files Emote needs at runtime to the emote package
  install -Dm 644 -t "$srcdir/$_pkgname-$pkgver/emote/static/" "$staticdir"/{emojis.csv,logo.svg,style.css}
  # Replace setup.py with one that installs the assets above
  install -Dm 644 "$srcdir/setup.py" "$srcdir/$_pkgname-$pkgver/setup.py"
  # And replace relative references to "static/"
  rootdir=$(python -c 'import sysconfig as _; print(_.get_paths()["purelib"])')/emote
  rootdir=${rootdir//\\/\\\\}
  rootdir=${rootdir//\//\\\/}
  sed -Ei "s/([^/])(static\\/)/\\1${rootdir}\\/\\2/" "$srcdir/$_pkgname-$pkgver"/emote/*.py

  # Patch to automatically paste in Wayland https://github.com/tom-james-watson/Emote/issues/157
  patch -p1 -i "$srcdir/${pkgname}_wayland_autopaste.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  # Start automatically by default
  install -Dm 644 "$pkgdir/usr/share/applications/emote.desktop" "$pkgdir/etc/xdg/autostart/emote.desktop"
}
