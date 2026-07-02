# Maintainer: Marat Bakeev <hawara@gmail.com>
pkgname=floocast
pkgver=1.1.8.3
pkgrel=3
pkgdesc="GUI to control and configure FlooGoo USB Bluetooth dongles (FMA120): pairing, AuraCast broadcasting and DFU"
arch=('any')
url="https://github.com/Flairmesh/FlooCast"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-wxpython'
  'python-pyserial'
  'python-certifi'
  'python-pillow'
  'python-numpy'
  'python-sounddevice'
)
optdepends=('python-samplerate: smoother resampling (only used on the macOS split-stream path)')
makedepends=('imagemagick')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/Linux_$pkgver.tar.gz"
  "$pkgname.desktop"
  "70-$pkgname.rules"
  "floocast_singleton.py"
  "$pkgname-single-instance.patch"
)
sha256sums=('7541f0f0f658f794111d11f7cfa7ae13303cbf6eff56ef6a3fbfab18ed98eea5'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_srcdir="FlooCast-Linux_$pkgver"

prepare() {
  # The .ico is a single 256x256 PNG frame; extract a proper hicolor icon.
  magick "$_srcdir/FlooCastApp.ico" "$srcdir/$pkgname.png"

  # Guard against multiple instances fighting over the dongle; a second launch
  # raises the running window instead (also the restore path on Wayland, where
  # wxWidgets' GtkStatusIcon tray never appears). See the .patch / helper.
  cp "$srcdir/floocast_singleton.py" "$_srcdir/"
  patch -Np1 -d "$_srcdir" < "$srcdir/$pkgname-single-instance.patch"
}

package() {
  # App resources (icons, locales) are loaded relative to dirname(sys.argv[0]),
  # so ship the whole tree and launch it in place via a wrapper.
  local appdir="$pkgdir/usr/share/$pkgname"
  install -d "$appdir"
  cp -r "$_srcdir"/*.py "$appdir/"
  cp -r "$_srcdir/locales" "$appdir/"
  install -m644 "$_srcdir"/FlooCastApp.ico "$_srcdir"/FlooCastApp.gif \
    "$_srcdir"/FlooCastHeader.png "$_srcdir"/onS.png "$_srcdir"/offS.png "$appdir/"

  # Entry point run via a "floocast"-named symlink so the basename of
  # sys.argv[0] (and thus the wxGTK Wayland app_id) is "floocast", which lets
  # the compositor match the window to floocast.desktop and show its icon.
  ln -s main.py "$appdir/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python /usr/share/$pkgname/$pkgname "\$@"
EOF

  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/70-$pkgname.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-$pkgname.rules"
  install -Dm644 "$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
