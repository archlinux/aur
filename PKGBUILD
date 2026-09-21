# Maintainer: Marat Bakeev <hawara@gmail.com>
pkgname=floocast
pkgver=1.1.9
pkgrel=1
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
  'python-pystray'
)
optdepends=('python-samplerate: smoother resampling (only used on the macOS split-stream path)')
makedepends=('imagemagick')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/Linux_$pkgver.tar.gz"
  "$pkgname.desktop"
  "70-$pkgname.rules"
  "floocast_singleton.py"
  "$pkgname-single-instance.patch"
  "$pkgname-sni-tray.patch"
)
sha256sums=('f3f328c8ff50423c1f61b0a5c9ef9627e51a4581d57c7e32badce5854968050a'
            '9ab1d5bc3edbe9f51cd7075e511dceed5ce3c0a0ce0ca267e0dce81040c6d477'
            'f5a152c07de10d0f238e693d068664c9507eaebc24b04e50b32c3138312fd936'
            '33b2afb9305a74b77fa764820e611fb3c08fb00e296d047b2ed0de280fefb383'
            '5f07e92c189883f2217f2e9ce46a2aae6253d34040b8b85f656127737ba4b238'
            '9f6f63b54c95c158ddf05aee6e5bc38373b44ab386a6f21202504785aec421f8')

_srcdir="FlooCast-Linux_$pkgver"

prepare() {
  # The .ico is a single 256x256 PNG frame; extract a proper hicolor icon.
  magick "$_srcdir/FlooCastApp.ico" "$srcdir/$pkgname.png"

  # Guard against multiple instances fighting over the dongle; a second launch
  # raises the running window instead (also the restore path on Wayland, where
  # wxWidgets' GtkStatusIcon tray never appears). See the .patch / helper.
  cp "$srcdir/floocast_singleton.py" "$_srcdir/"
  patch -Np1 -d "$_srcdir" < "$srcdir/$pkgname-single-instance.patch"

  # Replace the wxWidgets tray (GtkStatusIcon, invisible on Wayland) with a
  # pystray/AppIndicator StatusNotifierItem tray that modern shells render.
  patch -Np1 -d "$_srcdir" < "$srcdir/$pkgname-sni-tray.patch"
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
