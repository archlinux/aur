# Maintainer: OrPudding <t3164473115@163.com>
pkgname=aiot-ide
pkgver=1.7.0
pkgrel=1
pkgdesc="Code editing. Redefined. AIoT IDE is the first choice for developing quickApp."
arch=('x86_64')
url="https://iot.mi.com/vela/quickapp/"
license=('custom')
options=('!debug')
depends=(
  'ca-certificates'
  'alsa-lib'
  'at-spi2-core'
  'atk'
  'cairo'
  'cups'
  'curl'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'gtk3'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbfile'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
  'vulkan-icd-loader'
)
source=("$pkgname-$pkgver.deb::https://vela-ide.cnbj3-fusion.mi-fds.com/vela-ide/ide/v1.7.0/AIoT_IDE_ubuntu.deb")
sha256sums=('37809fde16cac7838e757e81754236f235af7180a56ecf40c78ad8030f5533e6')

prepare() {
  # Extract DEB package
  ar x "$pkgname-$pkgver.deb"
  tar -xf data.tar.*
}

package() {
  # Copy all files
  cp -r usr "$pkgdir"
  
  # Create executable symlink
  install -d "$pkgdir/usr/bin/"
  ln -s "/usr/share/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Fix permissions
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/$pkgname" -type f -executable -exec chmod 755 {} \;
  
  # Fix desktop files
  find "$pkgdir/usr/share/applications" -name "*.desktop" -exec chmod 644 {} \;
  
  # Install license
  if [ -f "$pkgdir/usr/share/$pkgname/LICENSE.txt" ]; then
    install -Dm644 "$pkgdir/usr/share/$pkgname/LICENSE.txt" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f "$pkgdir/usr/share/$pkgname/LICENSES.chromium.html" ]; then
    install -Dm644 "$pkgdir/usr/share/$pkgname/LICENSES.chromium.html" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
  else
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "Proprietary license - see package source" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  # Fix icon permissions
  if [ -d "$pkgdir/usr/share/pixmaps" ]; then
    find "$pkgdir/usr/share/pixmaps" -type f -exec chmod 644 {} \;
  fi
  
  # Ensure sandbox is executable
  if [ -f "$pkgdir/usr/share/$pkgname/chrome-sandbox" ]; then
    chmod 4755 "$pkgdir/usr/share/$pkgname/chrome-sandbox"
  fi
}
