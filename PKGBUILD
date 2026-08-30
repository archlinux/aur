# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=cinnamon-aliveos
pkgver=6.6.9
pkgrel=10
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
          'libical' 'libkeybinder3' 'libnm' 'libnotify' 'libportal-gtk3' 'libsecret' 'libx11'
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
        'inline-reply-notifications.patch'
        'zenity-session-quit.py'
        'zenity-run-dialog.py'
        'zenity-confirm-dialog.py'
        'zenity-question-dialog.py'
        'zenity-audio-device-dialog.py'
        'zenity-display-change-dialog.py'
        'zenity-polkit-dialog.py'
        'zenity-keyring-dialog.py'
        'audioDeviceSelection.js'
        'polkitAuthenticationAgent.js'
        'keyringPrompt.js'
        'patch-dialogs.py')
sha256sums=('5f09a128f937eff0edd78047eddeae911de1b216c49640e55338a21570c97224'
            '1b46a3e8720269ba2c5abf3604835a7aff527abbb1bb401121f8626f74427255'
            'f89390f4af9e81219e6e0fa88d61044053dab66b42d53a4748b5d5d82009573a'
            'a71adbacde83112333df881cc839299df51ca18b9507b95df0430a39cb0f449e'
            '941feee7505bf2dd3fe30c8e755d1bc2b9ef8994b624c3ed236c41e769a3b0b9'
            '1800fb7b95b3eede3c003ead6a5f8507f0bef982511b79da15b3ec11833bc0f8'
            '0298bfcae9fe8563e7974a35c44f9dead0b1e598862e399e071deefe37d38d95'
            '57656be9f89f5e93e388705cacf36199e94a703f15424f6f2002a853ecdd4a9e'
            '566c38d544d5ff71f6d32e64503af225539cc0a1e92a5a7dfed0058b891257c4'
            '03645d19a6638ebb3be5da436776edbb6668ed6d3e8aa53f333755577fb9558d'
            'b4cb9099aa3a264300ca51cb04ab0db04d8e3a161f0279bc1a2bca03b5feb05a'
            'c01deee7b86de81c9f1ef604c342e33ff250c97b6f193b299324f4e07bedc1bc'
            'f3b2febe0c6a555c903ec9bc11e33dcebd267493a1c822305136d3ea2df9aeeb'
            'b9be55ba9602d0338b9efa6fbe6e5dbbea8fbd67453a7fed6270ee7a770262aa'
            '049c98adab7c6295274c9c659ae1d5fdbe7761b46dac23e8b39f6b686a990537'
            '64e6a318cb09597ce9453cd596cc993522176640ac9c835ae3d63567098b2185')

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
    sed -i 's/nemo-autostart/dory-autostart/g' "$pkgdir/usr/share/cinnamon-session/sessions/"*.session 2>/dev/null || true
  fi

  # Remove nemo-related files if any exist
  rm -f "$pkgdir/usr/share/applications/nemo.desktop" 2>/dev/null || true
  rm -f "$pkgdir/usr/share/applications/nemo-autostart.desktop" 2>/dev/null || true
  rm -f "$pkgdir/usr/share/applications/nemo-autorun-software.desktop" 2>/dev/null || true
  rm -f "$pkgdir/etc/xdg/autostart/nemo-autostart.desktop" 2>/dev/null || true

  # Ensure dory-autostart.desktop is installed in /etc/xdg/autostart/
  if [ -f "$pkgdir/usr/share/applications/dory-autostart.desktop" ]; then
    install -Dm644 "$pkgdir/usr/share/applications/dory-autostart.desktop" \
      "$pkgdir/etc/xdg/autostart/dory-autostart.desktop"
  fi

  # Route GTK3 native file choosers through the portal so Dory is used
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/gtk-portal.sh" << 'EOF'
export GTK_USE_PORTAL=1
EOF

  # Patch cs_actions.py to use Dory layout editor instead of Nemo
  sed -i \
    -e 's|nemo-action-layout-editor|dory-action-layout-editor|' \
    -e 's|nemo/layout-editor|dory/layout-editor|' \
    -e 's|nemo_action_layout_editor|dory_action_layout_editor|' \
    -e 's|NemoActionsOrganizer|DoryActionsOrganizer|' \
    -e 's|\.local/share/nemo/actions|.local/share/dory/actions|' \
    "$pkgdir/usr/share/cinnamon/cinnamon-settings/modules/cs_actions.py"

  # Override session quit dialog with GTK3 Zenity dialog
  install -Dm755 "$srcdir/zenity-session-quit.py" \
    "$pkgdir/usr/share/cinnamon-session/cinnamon-session-quit.py"
  install -Dm755 "$srcdir/zenity-session-quit.py" \
    "$pkgdir/usr/bin/cinnamon-session-quit"

  # Override run dialog with GTK3 Zenity run dialog
  install -Dm755 "$srcdir/zenity-run-dialog.py" \
    "$pkgdir/usr/bin/zenity-run-dialog.py"

  # Install zenity confirm dialog helper
  install -Dm755 "$srcdir/zenity-confirm-dialog.py" \
    "$pkgdir/usr/bin/zenity-confirm-dialog.py"

  # Install zenity question dialog helper (3-button support)
  install -Dm755 "$srcdir/zenity-question-dialog.py" \
    "$pkgdir/usr/bin/zenity-question-dialog.py"

  # Install zenity audio device selection dialog
  install -Dm755 "$srcdir/zenity-audio-device-dialog.py" \
    "$pkgdir/usr/bin/zenity-audio-device-dialog.py"

  # Install zenity display change confirmation dialog
  install -Dm755 "$srcdir/zenity-display-change-dialog.py" \
    "$pkgdir/usr/bin/zenity-display-change-dialog.py"

  # Install zenity polkit password dialog helper
  install -Dm755 "$srcdir/zenity-polkit-dialog.py" \
    "$pkgdir/usr/bin/zenity-polkit-dialog.py"

  # Install zenity keyring unlock/create dialog helper
  install -Dm755 "$srcdir/zenity-keyring-dialog.py" \
    "$pkgdir/usr/bin/zenity-keyring-dialog.py"

  # Install dialog patching script
  install -Dm755 "$srcdir/patch-dialogs.py" \
    "$pkgdir/usr/share/cinnamon/patch-dialogs.py"

  # Patch main.js to route Alt+F2 runDialog and ShowEndSessionDialog to GTK3 helpers
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/main.js" ]; then
    sed -i \
      -e 's|runDialog = new RunDialog.RunDialog();|runDialog = { open: function() { Util.spawnCommandLine("/usr/bin/zenity-run-dialog.py"); return true; }, close: function() {}, destroy: function() {} };|' \
      -e 's|function showEndSessionDialog(mode) {.*|function showEndSessionDialog(mode) { Util.spawnCommandLine("/usr/bin/cinnamon-session-quit"); }|' \
      "$pkgdir/usr/share/cinnamon/js/ui/main.js"
  fi

  # Patch windowManager.js to use zenity for DisplayChangeDialog
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/windowManager.js" ]; then
    PKGDIR="$pkgdir" python3 - << 'PYEOF'
import os, re
p = os.path.join(os.environ['PKGDIR'], "usr/share/cinnamon/js/ui/windowManager.js")
s = open(p).read()
# Add Util import if missing
imp_old = "const Main = imports.ui.main;\nconst WindowMenu = imports.ui.windowMenu;"
imp_new = "const Main = imports.ui.main;\nconst Util = imports.misc.util;\nconst WindowMenu = imports.ui.windowMenu;"
if imp_old in s:
    s = s.replace(imp_old, imp_new)
old = re.compile(r'''_confirmDisplayChange\(\) \{\n(\s*).*?\n\s*\};''', re.DOTALL)
new = '''_confirmDisplayChange() {
        let wm = this._cinnamonwm;
        let timeout = Meta.MonitorManager.get_display_configuration_timeout();
        let cmd = "/usr/bin/zenity-display-change-dialog.py " + timeout;
        Util.spawnCommandLineAsyncIO(cmd,
            (stdout, stderr, exitCode) => {
                if (exitCode === 0)
                    wm.complete_display_change(true);
                else
                    wm.complete_display_change(false);
            });
    }
};
'''
s, n = old.subn(new, s)
assert n == 1, f"windowManager patch matched {n} times"
open(p, 'w').write(s)
PYEOF
  fi

  # Patch audioDeviceSelection.js to use zenity instead of Clutter/St ModalDialog
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/audioDeviceSelection.js" ]; then
    cp "$srcdir/audioDeviceSelection.js" "$pkgdir/usr/share/cinnamon/js/ui/audioDeviceSelection.js"
  fi

  # Replace polkitAuthenticationAgent.js with GTK3 zenity-based agent
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/polkitAuthenticationAgent.js" ]; then
    cp "$srcdir/polkitAuthenticationAgent.js" "$pkgdir/usr/share/cinnamon/js/ui/polkitAuthenticationAgent.js"
  fi

  # Replace keyringPrompt.js with GTK3 zenity-based keyring dialog
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/keyringPrompt.js" ]; then
    cp "$srcdir/keyringPrompt.js" "$pkgdir/usr/share/cinnamon/js/ui/keyringPrompt.js"
  fi

  # Patch applet.js to use zenity for remove applet confirmation
  if [ -f "$pkgdir/usr/share/cinnamon/js/ui/applet.js" ]; then
    sed -i '/let dialog = new ModalDialog.ConfirmDialog/,/dialog.open();/{
      /let dialog = new ModalDialog.ConfirmDialog/c\            let cmd = "/usr/bin/zenity-confirm-dialog.py --text=\\"Are you sure you want to remove %s?\\" --title=\\"Confirm\\"".format(this._meta.name);\
            Util.spawnCommandLineAsync(cmd, () => AppletManager._removeAppletFromPanel(this._uuid, this.instance_id));
      /_("Are/d
      /() => AppletManager._removeAppletFromPanel/d
      /);/d
      /dialog.open();/d
    }' "$pkgdir/usr/share/cinnamon/js/ui/applet.js"
  fi

  # Patch remaining dialogs using Python script
  python3 "$pkgdir/usr/share/cinnamon/patch-dialogs.py" "$pkgdir/usr/share/cinnamon/js/ui"
  rm -f "$pkgdir/usr/share/cinnamon/patch-dialogs.py"


}
