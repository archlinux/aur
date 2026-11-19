# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/greeter>
pkgname=hornero-greeter
pkgver=1.2.0
pkgrel=1
pkgdesc='HorneroOS SDDM greeter theme on Hornero Signal (generative horizon, offline)'
arch=('any')
url='https://github.com/HorneroOS/greeter'
license=('GPL-3.0-only')
# Qt6 runtime: the theme imports QtQuick, QtQuick.Effects, QtQuick.Shapes,
# QtQuick.Window and QtQuick.VirtualKeyboard (see Main.qml /
# components/*.qml); sddm runs it. ttf-ibm-plex supplies the Hornero Signal
# families (IBM Plex Sans, Mono and Sans Condensed); without it fontconfig
# falls back to the default sans/mono and the greeter still renders.
# The background is drawn in code: no photos or videos ship with the theme.
depends=('sddm' 'qt6-declarative' 'qt6-virtualkeyboard' 'ttf-ibm-plex')
# Only an administrator's own opt-in video (theme.conf backgroundImage)
# needs QtMultimedia; components/UserVideo.qml is loaded on demand and the
# generative horizon stays when the module is missing.
optdepends=('qt6-multimedia: play an opt-in video background'
            'gst-plugins-good: decode common video formats for an opt-in background')
# Named "$pkgname" so the checkout lands at "${srcdir}/$pkgname";
# package() below only ever reads from there, so AUR chroot builds
# behave exactly like local packaging/ builds.
source=("$pkgname::git+https://github.com/HorneroOS/greeter.git#commit=7c21ed038da9cf8f143cb627b33d58d61b703fe0")
sha256sums=('SKIP')

package() {
  local src="$srcdir/$pkgname" dest="$pkgdir/usr/share/sddm/themes/hornero/"
  install -d "$dest"
  # Theme payload: QML and configs (all required).
  install -Dm644 "$src/Main.qml" "${dest}Main.qml"
  # theme.conf.user is an optional administrator override. Shipping a
  # sample as an active override masks theme.conf defaults on a fresh
  # install (including the default typeface and login affordance).
  for f in theme.conf metadata.desktop; do
    install -Dm644 "$src/$f" "${dest}$f"
  done
  cp -a "$src/components" "$dest"
  # Preview image for theme pickers (an original render of this theme).
  install -Dm644 "$src/screens/screenshot.png" "${dest}screens/screenshot.png"
  # Layered SDDM snippet: selects this theme WITHOUT rewriting /etc/sddm.conf.
  install -Dm644 "$src/packaging/arch/hornero-greeter/hornero.conf" \
    "$pkgdir/etc/sddm.conf.d/10-hornero.conf"
  # Virtual keyboard is opt-in because InputMethod changes SDDM's global
  # greeter input context and is not supported by SDDM's Wayland greeter.
  install -Dm644 "$src/packaging/arch/hornero-greeter/sddm-virtual-keyboard.conf.example" \
    "$pkgdir/usr/share/doc/hornero-greeter/sddm-virtual-keyboard.conf.example"
  # sddm-readable permissions throughout.
  find "$pkgdir" -type d -exec chmod 0755 {} +
  find "$pkgdir" -type f -exec chmod 0644 {} +
}
