# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: eworm <arch@eworm.de>
# Contributor: pisuka <tekmon@gmail.com>

pkgbase=lightdm-bzr
pkgname=('lightdm-bzr' 'liblightdm-qt4-bzr' 'liblightdm-qt5-bzr')
pkgver=r2117
pkgrel=1
pkgdesc='A lightweight display manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm'
license=('GPL3' 'LGPL3')
makedepends=('bzr' 'gobject-introspection' 'gtk-doc' 'intltool' 'itstool'
             'libxklavier' 'polkit' 'qt4' 'qt5-base' 'systemd' 'yelp-tools')
source=('bzr+lp:lightdm'
        'lightdm.service'
        'lightdm.tmpfiles'
        'lightdm.pam'
        'lightdm-autologin.pam'
        'lightdm.rules'
        'lightdm-default-config.patch'
        'Xsession')
sha256sums=('SKIP'
            '0d2adba25cdbe59e97ffd302083db9d5e23920780f41e04f64512cd6b633289a'
            'b29521fbd7a48a8f60b93ecca3b30c30bcb71560de8033c8d39b25c22c6f696f'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0'
            '33e3c3d6e16c8d30756754ea3f31f5457c5be0343686aad287692be34958984a'
            'a89566307e1c81c24f037d854cbd472d2f94f8a4b759877a01563a332319f7d6'
            'f1c4d1f29ac9f8aabe957d48a41be54d3a81c90360530b1061cbd13a6591315f'
            '7fb85a1b54406032a922e8fd6f45d869fcfe5681df630e74e8e50c040b786ee4')

pkgver() {
  cd lightdm

  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd ${pkgbase%-*}

  patch -Np1 -i ../lightdm-default-config.patch
}

build() {
  cd lightdm

  export MOC4='moc-qt4'
  export MOC5='moc-qt5'

  ./autogen.sh \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lightdm' \
    --localstatedir='/var' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --with-greeter-session='lightdm-gtk-greeter' \
    --with-greeter-user='lightdm' \
    --disable-static \
    --disable-tests
   make
}

package_lightdm-bzr() {
depends=('libxklavier' 'polkit' 'systemd')
optdepends=('xorg-server-xephyr: LightDM test mode'
            'accountsservice: limit visible accounts')
provides=('lightdm')
conflicts=('lightdm')
backup=('etc/apparmor.d/lightdm-guest-session'
        'etc/lightdm/keys.conf'
        'etc/lightdm/lightdm.conf'
        'etc/lightdm/users.conf'
        'etc/lightdm/Xsession'
        'etc/pam.d/lightdm'
        'etc/pam.d/lightdm-autologin'
        'etc/pam.d/lightdm-greeter')
install='lightdm.install'

  cd lightdm

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C liblightdm-qt uninstall
  install -m 755 ../Xsession "${pkgdir}"/etc/lightdm/Xsession
  rm -rf "${pkgdir}"/etc/init
  rm -rf "${pkgdir}"/usr/include/lightdm-qt{,5}-*

  install -dm 755 "${pkgdir}"/var/cache/lightdm
  install -dm 770 "${pkgdir}"/var/lib/lightdm{,-data}
  install -dm 711 "${pkgdir}"/var/log/lightdm
  chmod +t "${pkgdir}"/var/{cache/lightdm,lib/lightdm{,-data}}
  echo 'GDK_CORE_DEVICE_EVENTS=true' > "${pkgdir}"/var/lib/lightdm/.pam_environment
  chmod 644 "${pkgdir}"/var/lib/lightdm/.pam_environment
  chown 620:620 -R "${pkgdir}"/var/lib/lightdm{,-data}
  chgrp 620 "${pkgdir}"/var/log/lightdm

# PAM
  install -m 644 ../lightdm.pam "${pkgdir}"/etc/pam.d/lightdm
  install -m 644 ../lightdm-autologin.pam "${pkgdir}"/etc/pam.d/lightdm-autologin

# PolicyKit
  install -dm 700 -o polkitd "${pkgdir}"/usr/share/polkit-1/rules.d
  install -m 644 ../lightdm.rules "${pkgdir}"/usr/share/polkit-1/rules.d/lightdm.rules

# Systemd
  install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d}
  install -m 644 ../lightdm.service "${pkgdir}"/usr/lib/systemd/system/lightdm.service
  install -m 644 ../lightdm.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lightdm.conf
}

package_liblightdm-qt4-bzr() {
pkgdesc='LightDM Qt client library'
depends=('lightdm' 'qt4')
provides=('liblightdm-qt4')
conflicts=('liblightdm-qt4')
options=('!emptydirs')

  cd lightdm

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt5* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt5* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt5* -exec rm {} +
}

package_liblightdm-qt5-bzr() {
pkgdesc='LightDM Qt client library'
depends=('lightdm' 'qt5-base')
provides=('liblightdm-qt5')
conflicts=('liblightdm-qt5')
options=('!emptydirs')

  cd lightdm

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}

# vim: ts=2 sw=2 et:
