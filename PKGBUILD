# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=pantheon-default-settings-git
pkgver=r310.39b0a63
pkgrel=2
arch=('any')
url='https://github.com/elementary/default-settings'
license=('GPL')
groups=('pantheon-unstable')
makedepends=('git')
source=('pantheon-default-settings::git+https://github.com/elementary/default-settings.git#branch=meson'
        'arch-tweaks.patch')
sha256sums=('SKIP'
            'b13ef0db2c0a38405ca386e77982959867041038f2c7cb96a2b676261691ca42')

pkgver() {
  cd $srcdir/pantheon-default-settings

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/pantheon-default-settings

  patch -Np1 -i ../arch-tweaks.patch
}


package() {
  pkgdesc='Default settings for Pantheon'
  depends=('elementary-icon-theme' 'gtk-theme-elementary-git'
           'gnome-themes-standard' 'elementary-wallpapers-git'
           'ttf-droid' 'ttf-opensans')
  provides=('pantheon-default-settings')
  conflicts=('pantheon-default-settings')

  cd $srcdir/pantheon-default-settings
  meson build
  DESTDIR=$pkgdir ninja -C build install

  install -dm 755 "${pkgdir}"/usr/share/glib-2.0/schemas
  install -m 644 debian/elementary-default-settings.gsettings-override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
  install -Dm 755 $pkgdir/etc/lightdm/lightdm.conf $pkgdir/etc/skel/.config/lightdm/lightdm.conf
  rm $pkgdir/etc/lightdm/lightdm.conf
}

# vim: ts=2 sw=2 et:
