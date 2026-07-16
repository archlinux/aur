# Maintainer: Hunter Grey <grey@huntergrey.cn>
# Contributor: level666 <lev3l666@gmail.com>

pkgname=zeppossimulator
pkgver=2.1.1
pkgrel=1
pkgdesc="Zepp OS simulator"
arch=('x86_64')
url="https://zeppos.com/developer/simulator/"
license=('custom')
options=('!strip' '!debug')

# Electron runtime. Most are pulled in by gtk3, but Electron dlopens
# libnotify/libXss/libXtst/libsecret, so they must be listed explicitly.
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gdk-pixbuf2' 'glib2'
  'gtk3' 'libcups' 'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'util-linux-libs' 'xdg-utils'

  # bundled qemu-system-arm
  'gnutls' 'libaio' 'libepoxy' 'libjpeg-turbo' 'libpng' 'libsasl' 'numactl'
  'pixman' 'sdl2' 'vte3' 'zlib'
)
optdepends=('libappindicator-gtk3: tray icon support')

_deb="simulator_${pkgver}_linux_amd64.deb"
source=("https://upload-cdn.zepp.com/zepp-applet-and-wechat-applet/20260410/${_deb}")
noextract=("$_deb")
sha256sums=('f9c46dda365ec5ede123e8cdd8ba79f2e33c1810ef103aadfeedeba79174c0fa')

package() {
  bsdtar -xOf "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

  local _app="$pkgdir/opt/simulator"
  local _fw="$_app/resources/firmware"

  # The .deb ships these 0644; upstream's postinst papered over it with a
  # blanket `chmod 777 -R /opt/simulator`. Nothing writes into /opt at runtime
  # (state lives in ~/.zepp), so keep the tree read-only and just fix the modes.
  chmod 755 "$_fw/qemu_linux/qemu-system-arm" "$_fw/start_qemu.sh"

  # Arch ships cyrus-sasl 2.1.28 as libsasl2.so.3; Debian ships the same
  # version with its soname frozen at .2. start_qemu.sh already puts this
  # directory on LD_LIBRARY_PATH, so the shim stays out of /usr/lib.
  ln -s /usr/lib/libsasl2.so.3 "$_fw/qemu_linux/lib/libsasl2.so.2"

  # Prefer the system libjpeg over the vendored copy, which is otherwise
  # shadowed onto qemu via that same LD_LIBRARY_PATH and never gets updates.
  rm -f "$_fw/qemu_linux/lib/libjpeg.so.8"

  # https://github.com/electron/electron/issues/17972
  chmod 4755 "$_app/chrome-sandbox"

  # apt-get script, useless on Arch and misleading if anyone runs it
  rm -f "$_fw/setup_for_linux.sh"

  # Mach-O binary vendored by term-size, dead weight in a linux package
  rm -rf "$_app/resources/app.asar.unpacked/node_modules/term-size/vendor"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/simulator/simulator "$pkgdir/usr/bin/simulator"

  # Upstream's .desktop lists MimeType twice and uses the deprecated
  # "Application" category, which buries it in a catch-all menu section.
  sed -i -e 's/^MimeType=.*/MimeType=x-scheme-handler\/zepp;/' \
         -e 's/^Categories=.*/Categories=Development;/' \
         "$pkgdir/usr/share/applications/simulator.desktop"

  # Icon is a 512x512 PNG filed under a bogus 0x0 size directory.
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/0x0/apps/simulator.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/simulator.png"
  rm -r "$pkgdir/usr/share/icons/hicolor/0x0"

  install -Dm644 "$_app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$_app/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

  mv "$pkgdir/usr/share/doc/simulator" "$pkgdir/usr/share/doc/$pkgname"
}
