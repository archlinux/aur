# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=cinnamon-no-nemo
pkgver=6.6.8
pkgrel=1
pkgdesc="Cinnamon desktop environment repackaged without Nemo dependency (uses Dory)"
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
conflicts=('cinnamon' 'nemo')
provides=("cinnamon=$pkgver")
backup=('etc/xdg/cinnamon-session/sessions/cinnamon.session')
source=("cinnamon-6.6.8-1-x86_64.pkg.tar.zst"
        'cinnamon.session')
sha256sums=('SKIP'
            'SKIP')

# Disable strip and debug to speed up repackaging
options=('!strip' '!debug' 'emptydirs')

prepare() {
  # Extract the official package
  mkdir -p extracted
  cd extracted
  tar -xf "$srcdir/cinnamon-$pkgver-$pkgrel-x86_64.pkg.tar.zst" || \
  tar -xf "$srcdir/cinnamon-$pkgver-$pkgrel-x86_64.pkg.tar.xz" || \
  tar -xf "$srcdir/cinnamon-$pkgver-$pkgrel-x86_64.pkg.tar.gz" || true
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
}
