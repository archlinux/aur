# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-bzr
pkgver=r62
pkgrel=1
pkgdesc='The Pantheon Session Handler'
arch=('any')
url='https://code.launchpad.net/~elementary-os/elementaryos/pantheon-xsession-settings'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cerbere-bzr' 'gala-bzr' 'gconf' 'gnome-keyring' 'gnome-session'
         'gnome-settings-daemon' 'gnome-user-share' 'polkit-gnome'
         'slingshot-launcher-bzr' 'wingpanel-bzr' 'xdg-user-dirs-gtk')
makedepends=('bzr')
optdepends=('pantheon-default-settings-bzr')
source=('pantheon-session::bzr+lp:~elementary-os/elementaryos/pantheon-xsession-settings'
        'pantheon-session.sh')
sha256sums=('SKIP'
            '1e0c8e9403e52614d43ecb920e507ee1e96b1439bb20949ff814741e5e5e2284')

pkgver() {
  cd pantheon-session

  echo "r$(bzr revno)"
}

prepare() {
  cd pantheon-session

  sed 's/policykit-1/polkit/' -i autostart/polkit-gnome-authentication-agent-1-pantheon.desktop
  sed 's|gnome-session --session=pantheon|/usr/bin/pantheon-session|' -i debian/pantheon.desktop
}

package() {
  cd pantheon-session

  mkdir -p "${pkgdir}"/{etc/xdg,usr/{bin,share/{gnome-session/sessions,pantheon,xsessions}}}
  cp -dr --no-preserve='ownership' autostart "${pkgdir}/etc/xdg/"
  cp -dr --no-preserve='ownership' debian/pantheon.desktop "${pkgdir}/usr/share/xsessions/"
  cp -dr --no-preserve='ownership' debian/pantheon.session "${pkgdir}/usr/share/gnome-session/sessions/"
  cp -dr --no-preserve='ownership' gconf "${pkgdir}/usr/share/GConf"
  cp -dr --no-preserve='ownership' unity-greeter "${pkgdir}/usr/share/"
  cp -dr --no-preserve='ownership' applications "${pkgdir}/usr/share/pantheon/"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +

# gnome-session workaround
  install -m 755 ../pantheon-session.sh "${pkgdir}"/usr/bin/pantheon-session
}

# vim: ts=2 sw=2 et:
