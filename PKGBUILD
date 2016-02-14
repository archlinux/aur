# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=pantheon-default-settings-bzr
pkgname=('elementary-dpms-helper-bzr' 'pantheon-default-settings-bzr')
pkgver=r181
pkgrel=1
arch=('any')
url='https://code.launchpad.net/~elementary-os/elementaryos/default-settings-loki'
license=('GPL')
groups=('pantheon-unstable')
makedepends=('bzr')
install='pantheon-default-settings.install'
source=('pantheon-default-settings::bzr+lp:~elementary-os/elementaryos/default-settings-loki'
        'arch-tweaks.patch')
sha256sums=('SKIP'
            '303efd641a5f993b8c5c0d3123fc2395b341ac254c5484c7074bfce9182ec3ad')

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
  cp -dr --no-preserve='ownership' profile.d "${pkgdir}"/etc/
}

# vim: ts=2 sw=2 et:
