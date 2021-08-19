# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-qq-common
pkgver=1
pkgrel=2
pkgdesc='Common dependencies of Pantheon 3D and Pantheon Lite'
arch=('any')
url='https://github.com/quequotion/pantheon-qq'
license=('GPL3')
groups=('pantheon-qq')
depends=({cinnamon,pantheon}-settings-daemon gnome-{keyring,session} 'xdg-user-dirs-gtk'
         wingpanel pantheon-{dock,applications-menu})
optdepends=("contractor: A desktop-wide extension service"
            "dconf-editor: GUI gsettings editor"
            "elementary-blue-icon-theme-git: Restore blue folder icons to elementary theme"
            "file-roller-pantheon: Archive manipulator for GNOME (with elementary OS patches)"
            "lightdm-gtk-greeter: GTK+ Greeter for LightDM"
            "numlockx: Turn on the numlock key in X11"
            "pantheon-calculator: The Pantheon Calculator"
            "pantheon-calendar: The Pantheon Calendar"
            "pantheon-code: The Pantheon Code Editor"
            "pantheon-default-settings: Default settings for Pantheon"
            "pantheon-dock-instctl-git: Dock for Pantheon with instance controls"
            "pantheon-dpms-helper: DPMS helper for Pantheon"
            "pantheon-files: The Pantheon File Browser"
            "pantheon-geoclue2-agent: Pantheon Geoclue2 Agent"
            "pantheon-music: The Pantheon Music Player"
            "pantheon-notifications: A Gtk notification server for Pantheon"
            "pantheon-photos: The Pantheon Photos Manager"
            "pantheon-polkit-agent: Pantheon Polkit Agent"
            "pantheon-print: Simple shim for printing support via Contractor"
            "pantheon-screenshot: The Pantheon Screenshot Tool"
            "pantheon-terminal: The Pantheon Terminal Emulator"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops"
            "wingpanel-standalone-git: Stylish top panel (with autohide and without Gala dependencies)")
conflicts=('pantheon-workarounds')
source=('pantheon-session-qq'
        'numlockx-pantheon.desktop')
sha256sums=('f208ab4c523df5eb7716fa37d300f568ab84259ca82aefb06f7a064bcb190174'
            'd3c5deda2d6ef11451c2ea68043e4e424dd37858862a0c6251990243872f8311')

package() {
  #numlockx
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/numlockx-pantheon.desktop

  #Script to initiate Pantheon derivative gnome-sessions
  install -Dm755 {"${srcdir}","${pkgdir}"/usr/bin}/pantheon-session-qq

  #Use cinnamon-settings-daemon (gnome-settings-daemon has deprecated modularity and xorg)
  #Skip "Screensaver" plugin in Pantheon: session-indicator needs org.gnome.ScreenSaver.Lock
  #Skip "Xrandr" plugin in Pantheon: monitors.xml configuration doesn't seem to work, is undocumented, etc.
  for i in /etc/xdg/autostart/cinnamon-settings-daemon-*.desktop; do
    if [[ ${i} != *screensaver* ]] && [[ ${i} != *xrandr* ]] && [[ ${i} != *pantheon* ]]; then
      sed s/X-Cinnamon/Pantheon/ "${i}" > "${pkgdir}${i/.desktop/-pantheon.desktop}"
    fi
  done

  echo "Get the latest dotfiles: https://gist.github.com/quequotion/a7c2e82451a87a05dbca50e5e8176615"
}
