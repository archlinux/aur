# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=pantheon-default-settings-bzr
pkgname=('elementary-dpms-helper-bzr' 'pantheon-default-settings-bzr')
pkgver=r138
pkgrel=1
arch=('any')
url='https://code.launchpad.net/~elementary-os/elementaryos/default-settings-trusty'
license=('GPL')
groups=('pantheon-unstable')
makedepends=('bzr')
install='pantheon-default-settings.install'
source=('pantheon-default-settings::bzr+lp:~elementary-os/elementaryos/default-settings-trusty'
        'arch-tweaks.patch')
sha256sums=('SKIP'
            'be262f2b4cb410f12751032b20b021821f7155f0f3d663b3fab698f41fb8e943')

pkgver() {
  cd pantheon-default-settings

  echo "r$(bzr revno)"
}

prepare() {
  cd pantheon-default-settings

  patch -Np1 -i ../arch-tweaks.patch
}

package_elementary-dpms-helper-bzr() {
  pkgdesc='DPMS helper for Pantheon'
  depends=('gnome-settings-daemon')
  provides=('elementary-dpms-helper')
  conflicts=('elementary-dpms-helper')

  cd pantheon-default-settings/dpms

  install -dm 755 "${pkgdir}"/{etc/xdg/autostart,usr/{bin,share/glib-2.0/schemas}}
  install -m 644 elementary-dpms-helper.desktop "${pkgdir}"/etc/xdg/autostart/
  install -m 755 elementary-dpms-helper "${pkgdir}"/usr/bin/
  install -m 644 org.pantheon.dpms.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas/
}

package_pantheon-default-settings-bzr() {
  pkgdesc='Default settings for Pantheon'
  depends=('elementary-icon-theme' 'gtk-theme-elementary-bzr'
           'gnome-themes-standard' 'pantheon-backgrounds-bzr'
           'plank-theme-pantheon-bzr' 'ttf-droid' 'ttf-opensans')
  provides=('pantheon-default-settings')
  conflicts=('pantheon-default-settings')

  cd pantheon-default-settings

  install -dm 755 "${pkgdir}"/usr/share/glib-2.0/schemas
  install -m 644 debian/elementary-default-settings.gsettings-override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
  install -dm 755 "${pkgdir}"/usr/share/applications
  install -m 644 policykit.desktop "${pkgdir}"/usr/share/applications/
  install -dm 755 "${pkgdir}"/etc/{gtk-3.0,skel/.config,xdg/xdg-elementary}
  install -m 644 settings.ini "${pkgdir}"/etc/gtk-3.0/
  install -m 644 light-locker.desktop "${pkgdir}"/etc/xdg/xdg-elementary/
  cp -dr --no-preserve='ownership' plank "${pkgdir}"/etc/skel/.config/
  cp -dr --no-preserve='ownership' midori "${pkgdir}"/etc/xdg/
}

# vim: ts=2 sw=2 et:
