# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=cinnamon-aliveos
pkgver=6.6.9
pkgrel=1
pkgdesc="Cinnamon desktop environment for AliveOS (without Nemo, with Dory integration and custom enhancements)"
arch=('x86_64')
url="https://github.com/linuxmint/cinnamon"
license=('GPL-2.0-or-later')
depends=('accountsservice' 'at-spi2-core' 'bash' 'cairo' 'cinnamon-control-center'
         'cinnamon-desktop' 'cinnamon-menus' 'cinnamon-screensaver' 'cinnamon-session'
         'cinnamon-settings-daemon' 'cinnamon-translations' 'cjs' 'dconf'
         'evolution-data-server' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gnome-backgrounds' 'gnome-themes-extra' 'gsound' 'gstreamer' 'gtk3'
         'hicolor-icon-theme' 'libgcc' 'libgirepository' 'libglvnd' 'libibus'
         'libical' 'libkeybinder3' 'libnm' 'libnotify' 'libsecret' 'libx11'
         'libxfixes' 'libxml2' 'muffin' 'network-manager-applet' 'pango'
         'papirus-icon-theme' 'polkit' 'python' 'python-cairo' 'python-gobject'
         'python-pam' 'python-pexpect' 'python-pillow' 'python-psutil'
         'python-pyinotify' 'python-pytz' 'python-requests'          'python-setproctitle'
         'python-tinycss2' 'python-xapp' 'sound-theme-freedesktop' 'timezonemap'
         'upower' 'xapp' 'xdg-desktop-portal-xapp')
makedepends=()
optdepends=('blueman: Bluetooth support'
            'cinnamon-translations: i1n'
            'gnome-terminal: X terminal emulator'
            'gnome-panel: fallback mode'
            'ibus: input method support'
            'metacity: fallback mode'
            'switcheroo-control: GPU offloading'
            'system-config-printer: printer settings'
            'touchegg: touch gestures'
            'wget: cover download support in audio applet')
conflicts=('cinnamon' 'nemo' 'cinnamon-no-nemo')
provides=("cinnamon=$pkgver")
replaces=('cinnamon-no-nemo')
backup=('etc/xdg/cinnamon-session/sessions/cinnamon.session')
source=("cinnamon-$pkgver-$pkgrel-x86_64.pkg.tar.zst::https://archlinux.org/packages/extra/x86_64/cinnamon/download"
        'cinnamon.session'
        'gwl-grouping-heuristics.patch'
        'inline-reply-notifications.patch')
sha256sums=('5f09a128f937eff0edd78047eddeae911de1b216c49640e55338a21570c97224'
            '1b46a3e8720269ba2c5abf3604835a7aff527abbb1bb401121f8626f74427255'
            'f89390f4af9e81219e6e0fa88d61044053dab66b42d53a4748b5d5d82009573a'
            'a71adbacde83112333df881cc839299df51ca18b9507b95df0430a39cb0f449e')

# Disable strip and debug to speed up repackaging
options=('!strip' '!debug' 'emptydirs')

prepare() {
  # Extract the official package
  mkdir -p extracted
  cd extracted
  tar -xf "$srcdir/cinnamon-$pkgver-$pkgrel-x86_64.pkg.tar.zst"

  # Apply custom PR patches
  patch -Np1 -i "$srcdir/gwl-grouping-heuristics.patch"
  patch -Np1 -i "$srcdir/inline-reply-notifications.patch"
}

package() {
  # Copy extracted files
  cp -a extracted/* "$pkgdir/"

  # Replace cinnamon.session with dory version
  install -Dm644 "$srcdir/cinnamon.session" \
    "$pkgdir/etc/xdg/cinnamon-session/sessions/cinnamon.session"

  # Also install to usr/share as fallback
  if [ -d "$pkgdir/usr/share/cinnamon-session/sessions" ]; then
    install -Dm644 "$srcdir/cinnamon.session" \
      "$pkgdir/usr/share/cinnamon-session/sessions/cinnamon.session"
  fi

  # Remove nemo-related files if any exist
  rm -f "$pkgdir/usr/share/applications/nemo.desktop" 2>/dev/null || true
  rm -f "$pkgdir/usr/share/applications/nemo-autostart.desktop" 2>/dev/null || true
  rm -f "$pkgdir/usr/share/applications/nemo-autorun-software.desktop" 2>/dev/null || true
  rm -f "$pkgdir/etc/xdg/autostart/nemo-autostart.desktop" 2>/dev/null || true

  # Disable GTK portal usage - use native file chooser (Dory) instead
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/gtk-no-portal.sh" << 'EOF'
export GTK_USE_PORTAL=0
EOF

  # Patch cs_actions.py to use Dory layout editor instead of Nemo
  sed -i \
    -e 's|nemo-action-layout-editor|dory-action-layout-editor|' \
    -e 's|nemo/layout-editor|dory/layout-editor|' \
    -e 's|nemo_action_layout_editor|dory_action_layout_editor|' \
    -e 's|NemoActionsOrganizer|DoryActionsOrganizer|' \
    -e 's|\.local/share/nemo/actions|.local/share/dory/actions|' \
    "$pkgdir/usr/share/cinnamon/cinnamon-settings/modules/cs_actions.py"
}
