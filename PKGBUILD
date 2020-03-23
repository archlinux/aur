# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=3.2.0.r73.gc49189b
#pkgver=r1158.5898845
pkgrel=2
pkgdesc='Workarounds for Pantheon derivatives'
arch=('any')
url='https://github.com/quequotion/pantheon-bzr-qq'
license=('GPL3')
groups=('pantheon-qq')
depends=(cinnamon-settings-daemon
         dconf gnome-{keyring,session} xdg-user-dirs-gtk
         pantheon-applications-menu plank wingpanel)
optdepends=("contractor: A desktop-wide extension service"
            "numlockx: Turn on the numlock key in X11"
            "pantheon-dpms-helper: Manage DPMS settigns in place of gnome-settings-daemon"
            "pantheon-default-settings: Pantheon configuration and themeing"
            "pantheon-geoclue2-agent-git: Pantheon Geoclue2 Agent"
            "pantheon-polkit-agent: Polkit Authentication Agent"
            "pantheon-print: Print settings dialog"
            "pantheon-screenshot: Screenshot utility"
            "pantheon-shortcut-overlay: OS-wide shortcut overlay"
            "simple-scan: Simple scan utility"
            "switchboard: Pluggable settings manager"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops")
makedepends=('git' 'intltool')
provides=(gala{,-bzr,-git}="${pkgver}")
conflicts=(gala{,-bzr,-git})
install='gala.install'
source=("https://raw.githubusercontent.com/elementary/gala/master/data/org.pantheon.desktop.gala.gschema.xml.in"
        'pantheon-session-qq'
        'numlockx-pantheon.desktop'
        'gtk.css'
        'settings.ini'
        '26_pantheon-qq-gconf.gschema.override'
        '.xprofile')
sha512sums=('30a488431a23ff5521a12e97fa69ed17b2033ba8f016bb922e07ad9bf2d671e14a90a38266de1567c4dcbf178b6919a8108fad3dd13e50573018dc2a8e9b070e'
            '842db1b456c96287865955741ba00c3ceeecf82691700f691d9fc45dc665230f1224ce7cdf5a1301826ab96cfe59e922c3878a5986ab3639da0cb79a2948f727'
            'bc5724ef255adad39e35e3fbd7beacbd3ea270c7019362ff6a8bc15cf8f503a4304c18c5e35ae2a6ddb8d1e6e7cc6973642a2ffdc8fe9e219c7f2dbacf5eab72'
            '5481a5784ee687c346fd22751796c0264ce981710dd722d036397afd8423ecf356e5c24b7d348257a04c99af2250f2076c958c069a604db438b61c342359bf05'
            '983fde059024d4456e8bc748862ce20796b339d31fb792dbc30bb6d49345b269b7e6f8dabe04aea139dc8bdb9f88f288506f15343664fec012eff7a07a3fac98'
            '59ff0ac632091ddf9bcbe51785b0664daef005d272b8fd4295fa1fa4d2aead9318126e5e3e9850b7a59d44428511eb9b46e4b3809583023e86c538755e6145f2'
            '372e89fc0cdf1beca7ec56686e2aefc49b576134a28c1d407b809cc9817e0e3196ff6698d45a4b518a1644d7ba7936b93fcc8e6408e55d9db797b81be8f610a5')

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
  for i in /etc/xdg/autostart/cinnamon-settings-daemon-*.desktop; do
    sed s/X-Cinnamon/Pantheon/ "${i}" > "${pkgdir}${i/.desktop/-pantheon.desktop}"
  done
}
