# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=3.3.2.r236.g9f6b6a3
pkgrel=1
pkgdesc='Workarounds for Pantheon derivatives'
arch=('any')
url='https://github.com/quequotion/pantheon-qq'
license=('GPL3')
groups=('pantheon-qq')
depends=("cinnamon-settings-daemon"
         "dconf" gnome-{keyring,session} "xdg-user-dirs-gtk"
         "pantheon-applications-menu" "plank" "libwingpanel-3.0.so")
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
            "pantheon-dpms-helper: DPMS helper for Pantheon"
            "pantheon-files: The Pantheon File Browser"
            "pantheon-geoclue2-agent: Pantheon Geoclue2 Agent"
            "pantheon-music: The Pantheon Music Player"
            "pantheon-notifications-git: A Gtk notification server for Pantheon"
            "pantheon-photos: The Pantheon Photos Manager"
            "pantheon-polkit-agent: Pantheon Polkit Agent"
            "pantheon-print: Simple shim for printing support via Contractor"
            "pantheon-screenshot: The Pantheon Screenshot Tool"
            "pantheon-terminal: The Pantheon Terminal Emulator"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops"
            "wingpanel-standalone-git: Stylish top panel (with autohide and without Gala dependencies)")
makedepends=('git' 'intltool')
provides=("libgala.so=0-64")
conflicts=("libgala.so=0-64")
install='gala.install'
source=("https://raw.githubusercontent.com/elementary/gala/master/data/org.pantheon.desktop.gala.gschema.xml.in"
        'pantheon-session-qq'
        'numlockx-pantheon.desktop'
        'gtk.css'
        'settings.ini'
        '26_pantheon-qq-gconf.gschema.override'
        '.xprofile')
sha256sums=('203e769a0d7e2293086ed47fab4939934ff4ac83b3c5bb067cdad4bd2347dce3'
            'f208ab4c523df5eb7716fa37d300f568ab84259ca82aefb06f7a064bcb190174'
            'd3c5deda2d6ef11451c2ea68043e4e424dd37858862a0c6251990243872f8311'
            'cb195dc08f81545504d61a0bd24d4ed0d7ecb0fc2a40d947bb889879616b32ae'
            'bdb56c33b53195a92d77083273479b99bdef4d63cb9454b0e54d191530048b83'
            '46626576db2641f6a627df8e2776bab28c74bf6c2ef9dc296614689f129c8b6f'
            '26bf13c56a66172e5d70c7b35dc5b8dbdcbbe8d32d3fb666e26e05c0b7e62ee7')

pkgver() {
  cd "${srcdir}"
  git clone -n --quiet "https://github.com/elementary/gala.git"
  cd "gala"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"
  mv org.pantheon.desktop.gala.gschema.xml{.in,}
  sed -i 's|@GETTEXT_PACKAGE@|gala|g' org.pantheon.desktop.gala.gschema.xml
}

package() {
  #Gala's dconf satisfies runtime dependencies in switchboard (plugs), etc.
  install -Dm644 {"${srcdir}","${pkgdir}"/usr/share/glib-2.0/schemas}/org.pantheon.desktop.gala.gschema.xml

  #numlockx
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/numlockx-pantheon.desktop

  #Script to initiate Pantheon derivative gnome-sessions
  install -Dm755 {"${srcdir}","${pkgdir}"/usr/bin}/pantheon-session-qq

  #Use cinnamon-settings-daemon (gnome-settings-daemon has deprecated modularity and xorg)
  #Skip "Screensaver" plugin in Pantheon: session-indicator needs org.freedesktop.ScreenSaver.Lock
  #Skip "Xrandr" plugin in Pantheon: monitors.xml configuration doesn't seem to work, is undocumented, etc
  for i in /etc/xdg/autostart/cinnamon-settings-daemon-*.desktop; do
    if [[ ${i} != *screensaver* ]] && [[ ${i} != *xrandr* ]] && [[ ${i} != *pantheon* ]]; then
      sed s/X-Cinnamon/Pantheon/ "${i}" > "${pkgdir}${i/.desktop/-pantheon.desktop}"
    fi
  done
}
