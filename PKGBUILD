# Maintainer: Yubo Cao <cao2006721@gmail.com>
pkgname=typeless-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='AI voice dictation for any application (official Linux binary)'
arch=('x86_64')
url='https://www.typeless.com/'
license=('LicenseRef-proprietary')
depends=('acl' 'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libglvnd' 'libnotify'
         'libpulse' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst'
         'mesa' 'nspr' 'nss' 'pango' 'procps-ng' 'systemd-libs' 'util-linux'
         'wl-clipboard' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support'
            'ibus: VoiceIME integration'
            'python-gobject: Python IBus VoiceIME engine')
provides=("typeless=$pkgver")
conflicts=('typeless')
options=('!strip' '!debug')
source=("https://typeless-static.com/desktop-release/Typeless-${pkgver}-x64.deb")
sha256sums=('d73926db8f95d66ea9fc748ecf0cc70a370dc34c41bfdb23bcf7873b54650275')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Typeless/typeless "$pkgdir/usr/bin/typeless"
  chmod 4755 "$pkgdir/opt/Typeless/chrome-sandbox"

  # Package the device configuration rather than running Debian's postinst.
  install -d "$pkgdir/usr/lib/udev/rules.d" "$pkgdir/usr/lib/modules-load.d"
  printf '%s\n' 'ACTION!="remove", KERNEL=="uinput", SUBSYSTEM=="misc", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput", TAG+="uaccess"' \
    > "$pkgdir/usr/lib/udev/rules.d/70-typeless-uinput.rules"
  printf '%s\n' uinput > "$pkgdir/usr/lib/modules-load.d/typeless-uinput.conf"

  # Extract upstream's component template without executing its system installer.
  local helper=/opt/Typeless/resources/lib/input-helper/build/linux/x64
  install -d "$pkgdir/usr/share/ibus/component"
  sed -n '/^<?xml /,/^<\/component>/p' "$pkgdir$helper/register-voice-ime.sh" \
    | sed "s|\${engine_path}|$helper/typeless-voice-ime|g" \
    > "$pkgdir/usr/share/ibus/component/typeless-voice-ime.xml"

  # Upstream includes development debug files that are not needed at runtime.
  find "$pkgdir/opt/Typeless" -type f -name '*.debug' -delete
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /opt/Typeless/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s /opt/Typeless/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
