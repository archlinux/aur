# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=6
pkgrel=1
pkgdesc='Workarounds for modular and minimal Pantheon Desktop Environments'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
groups=('pantheon-qq')
depends=('dconf' gnome-{keyring,settings-daemon-{elementary,compat},session,user-share}
         'polkit-gnome' 'xdg-user-dirs-gtk')
optdepends=("pantheon-default-settings-git: Pantheon configuration and themeing"
            "contractor-git: Service for sharing data between apps"
            "pantheon-print-git: Print settings dialog"
            "pantheon-agent-polkit-bzr: Polkit Authentication Agent"
            "pantheon-geoclue2-agent-git: Pantheon Geoclue2 Agent"
            "pantheon-dpms-helper-git: Script and settings for X DPMS"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops")
makedepends=('bzr' 'intltool')
conflicts=(pantheon-session{,-bzr,-git} gala{,-bzr,-git})
install='gala.install'
source=("pantheon-session::git+https://github.com/elementary/session-settings#branch=meson"
        "https://raw.githubusercontent.com/elementary/gala/master/data/org.pantheon.desktop.gala.gschema.xml.in"
        'pantheon-session.sh'
        'gnome-fallback-media-keys-helper-pantheon.desktop'
        'gnome-fallback-background-helper-pantheon.desktop'
        'gnome-fallback-mount-helper-pantheon.desktop'
        'xsessions-typo.patch')
sha512sums=('SKIP'
            '30a488431a23ff5521a12e97fa69ed17b2033ba8f016bb922e07ad9bf2d671e14a90a38266de1567c4dcbf178b6919a8108fad3dd13e50573018dc2a8e9b070e'
            'b2630c31724675c247b7017eea0862c76ec80a9f46691b65bc7f76702a9cacda46d9350d3bddc05ee21ded154f4d8ab277d536439152972dca0764f28e62cb38'
            'b01a18bb7829eb7a48b72c90bdf5aa5913c24247426e0bfc509cba22f49d2d8c9eb301e1937b70f3f7f01a873c987e0bdea6dd5f24f8d900b952188fa5635d39'
            '0df6355d85d2329e245593408a74d09281c0dcea206ed594a7312b78db4d3cd57941a5ec29be780f965128fe512532edae85ffaf11a94b57374d5906875967fc'
            'c06e3b8c59681ebe64fa0dd724eea1d40a579956372ce0851f30ededdda3ac41d329d40e5463bd779daba0d55853faec357203b042a4de3d601eafc8b09c350e'
            '09248891b1f5dc41add3ded2150e564b86dc11eee4a695fa8eea11b51e040ca1daaa28701f791d681c88d8869821b7304e2d11eb771d439d13b708e893702108')

prepare() {
  cd "${srcdir}"
  mv org.pantheon.desktop.gala.gschema.xml{.in,}
  sed -i 's|@GETTEXT_PACKAGE@|gala|g' org.pantheon.desktop.gala.gschema.xml

  git clone -n "https://github.com/elementary/gala.git"
  cd "${srcdir}/gala"
  export pkgvergala="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"


  cd "${srcdir}/pantheon-session"
  export pkgverpantheonsession="$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"

  patch -Np2 < ../xsessions-typo.patch

  # This space reserved for pantheon-default-settings(-git)
}

provides=(pantheon-session{,-bzr,-git}="${pkgverpantheonsession}" gala{,-bzr,-git}="${pkgvergala}")

package() {
  install -Dm644 {"${srcdir}","${pkgdir}"/usr/share/glib-2.0/schemas}/org.pantheon.desktop.gala.gschema.xml

  cd "${srcdir}"/pantheon-session
  meson --prefix=/usr --datadir=share builddir
  DESTDIR=$pkgdir ninja -C builddir install

  #These may no longer be needed
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-media-keys-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-background-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-mount-helper-pantheon.desktop

  # This space reserved for pantheon-default-settings-bzr

  # gnome-session workaround
  install -Dm755 "${srcdir}"/pantheon-session.sh "${pkgdir}"/usr/bin/pantheon-session
}

