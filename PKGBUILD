# Maintainer: minpeter <minpeter@users.noreply.github.com>
pkgname=wap-bin
pkgver=0.0.50
pkgrel=2
pkgdesc="Wap - Chromium-based browser with a local AI agent daemon and CLI (prebuilt)"
arch=('x86_64')
url="https://github.com/minpeter/wap"
# The repository's LICENSE records that no project-wide license grant has been
# selected; third-party components keep their own licenses (THIRD_PARTY_NOTICES).
license=('LicenseRef-Wap')
provides=('wap')
conflicts=('wap')
options=('!strip' '!debug')
install=wap-bin.install
# depends: Arch packages owning every DT_NEEDED soname of the shipped ELF files
# (chrome, chrome_crashpad_handler, chrome_sandbox, bundled ANGLE/Vulkan .so,
# bun, wap-daemon, rg) that the tarball does not ship itself, plus gtk3, which
# Chromium dlopen()s at startup as its Linux UI toolkit. The Qt shims are
# dlopen()ed only for Qt UI integration, so qt5-base/qt6-base stay optional.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3'
         'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
         'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
optdepends=('xorg-server-xvfb: run the browser when no X display is available'
            'bubblewrap: sandbox agent shell commands when WAP_ENABLE_BWRAP_SANDBOX=1'
            'libpulse: PulseAudio/PipeWire audio output (ALSA is used otherwise)'
            'pciutils: GPU detection for hardware acceleration'
            'qt5-base: Qt 5 UI integration'
            'qt6-base: Qt 6 UI integration'
            'python: run the Context Awareness capture helper'
            'python-gobject: observe other apps for Context Awareness (AT-SPI bindings)'
            'tesseract: on-device screen text (OCR) for Context Awareness'
            'tesseract-data-eng: English OCR data for Context Awareness'
            'grim: Wayland screenshots for Context Awareness screen text'
            '1password-cli: 1Password integration')
source=("wap-$pkgver-linux-x64.tar.gz::https://github.com/minpeter/wap/releases/download/wap@$pkgver/wap-$pkgver-linux-x64.tar.gz"
        "wap-$pkgver-LICENSE::https://raw.githubusercontent.com/minpeter/wap/wap@$pkgver/LICENSE"
        "wap-$pkgver-THIRD_PARTY_NOTICES.md::https://github.com/minpeter/wap/releases/download/wap@$pkgver/wap-$pkgver-THIRD_PARTY_NOTICES.md")
sha256sums=('f741e530cec6b82fbf6d468a25d6f0dd29f00af3442116f8d7e7564b627638d1'
            'f45e6ba66a864b1952833a6bf6d869b0c9fef5a8cba1984040f30f68399b9409'
            'a4ddf25fea104d3259cb9a0d015cbb5fe8b1e372631b8329aac8937665e6be0d')

package() {
  cd "wap-$pkgver"
  # install.sh owns DESTDIR staging, desktop-entry and systemd-unit templating,
  # native-messaging manifests and permission hardening (it runs as root under
  # fakeroot, so chrome_sandbox gets its setuid bit).
  DESTDIR="$pkgdir" ./install.sh --prefix /usr
  # The privileged-helper invoker token must be unique per machine: generate it
  # in post_install instead of shipping the one created while staging.
  rm -f "$pkgdir/var/lib/wap/privileged-helper/invoker-token"
  # The user units are already in /usr/lib/systemd/user; drop the /etc copies.
  rm -f "$pkgdir/etc/systemd/user/wap-updater.service" "$pkgdir/etc/systemd/user/wap-updater.timer"
  rmdir "$pkgdir/etc/systemd/user" "$pkgdir/etc/systemd" 2>/dev/null || true
  # Match the modes/owners Arch gives shared system directories so pacman does
  # not warn that directory permissions differ: /etc/sudoers.d (filesystem)
  # and /etc/polkit-1/rules.d (polkit; gid 102 is Arch's fixed polkitd group).
  chmod 0750 "$pkgdir/etc/sudoers.d"
  chown root:102 "$pkgdir/etc/polkit-1/rules.d"
  chmod 0750 "$pkgdir/etc/polkit-1/rules.d"
  install -Dm644 "$srcdir/wap-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/wap-$pkgver-THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
