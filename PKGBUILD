# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-workarounds
pkgver=r1103.3661cbd
pkgrel=2
pkgdesc='Workarounds for Pantheon derivatives'
arch=('i686' 'x86_64')
url='https://github.com/quequotion/pantheon-bzr-qq'
license=('GPL3')
groups=('pantheon-qq')
depends=(gnome-settings-daemon-{elementary,compat} 'pantheon-session-git')
optdepends=("pantheon-qq-default-settings-git: Pantheon configuration and themeing for Pantheon derivatives"
            "contractor-git: A desktop-wide extension service"
            "pantheon-print-git: Print settings dialog"
            "pantheon-polkit-agent-git: Polkit Authentication Agent"
            "pantheon-geoclue2-agent-git: Pantheon Geoclue2 Agent"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops"
            "numlockx: Turn on the numlock key in X11")
makedepends=('git' 'intltool')
provides=(gala{,-bzr,-git}="${pkgver}")
conflicts=(gala{,-bzr,-git})
install='gala.install'
source=("https://raw.githubusercontent.com/elementary/gala/master/data/org.pantheon.desktop.gala.gschema.xml.in"
        'pantheon-session-qq'
        'gnome-fallback-media-keys-helper-pantheon.desktop'
        'gnome-fallback-background-helper-pantheon.desktop'
        'gnome-fallback-mount-helper-pantheon.desktop'
        'numlockx-pantheon.desktop')
sha512sums=('30a488431a23ff5521a12e97fa69ed17b2033ba8f016bb922e07ad9bf2d671e14a90a38266de1567c4dcbf178b6919a8108fad3dd13e50573018dc2a8e9b070e'
            '842db1b456c96287865955741ba00c3ceeecf82691700f691d9fc45dc665230f1224ce7cdf5a1301826ab96cfe59e922c3878a5986ab3639da0cb79a2948f727'
            'b01a18bb7829eb7a48b72c90bdf5aa5913c24247426e0bfc509cba22f49d2d8c9eb301e1937b70f3f7f01a873c987e0bdea6dd5f24f8d900b952188fa5635d39'
            '0df6355d85d2329e245593408a74d09281c0dcea206ed594a7312b78db4d3cd57941a5ec29be780f965128fe512532edae85ffaf11a94b57374d5906875967fc'
            'c06e3b8c59681ebe64fa0dd724eea1d40a579956372ce0851f30ededdda3ac41d329d40e5463bd779daba0d55853faec357203b042a4de3d601eafc8b09c350e'
            'bc5724ef255adad39e35e3fbd7beacbd3ea270c7019362ff6a8bc15cf8f503a4304c18c5e35ae2a6ddb8d1e6e7cc6973642a2ffdc8fe9e219c7f2dbacf5eab72')

pkgver() {
  cd "${srcdir}"
  git clone -n "https://github.com/elementary/gala.git"
  cd "${srcdir}/gala"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mv org.pantheon.desktop.gala.gschema.xml{.in,}
  sed -i 's|@GETTEXT_PACKAGE@|gala|g' org.pantheon.desktop.gala.gschema.xml
}

package() {
  install -Dm644 {"${srcdir}","${pkgdir}"/usr/share/glib-2.0/schemas}/org.pantheon.desktop.gala.gschema.xml

  #Old-school
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-media-keys-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-background-helper-pantheon.desktop
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/gnome-fallback-mount-helper-pantheon.desktop

  #numlockx
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/numlockx-pantheon.desktop

  #Script to initiate Pantheon derivative gnome-sessions
  install -Dm755 {"${srcdir}","${pkgdir}"/usr/bin}/pantheon-session-qq
}
