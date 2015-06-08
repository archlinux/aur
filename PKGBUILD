# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: padfoot <padfoot@exemail.com.au>
# Contributor: Morfeo <morfeo89@hotmail.it>

pkgbase=lightdm-devel
pkgname=('lightdm-devel' 'liblightdm-qt4-devel' 'liblightdm-qt5-devel')
pkgver=1.15.0
pkgrel=1
pkgdesc='A lightweight display manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm'
license=('GPL3' 'LGPL3')
makedepends=('gobject-introspection' 'gtk-doc' 'intltool' 'itstool'
             'libxklavier' 'polkit' 'qt4' 'qt5-base' 'systemd')
source=("https://launchpad.net/lightdm/${pkgver%.*}/${pkgver}/+download/lightdm-${pkgver}.tar.xz"
        'lightdm.service'
        'lightdm.tmpfiles'
        'lightdm.pam'
        'lightdm-autologin.pam'
        'lightdm.rules'
        'lightdm-default-config.patch'
        'Xsession')
sha256sums=('1a8a4a4bf81a00e44fb57e13cff475b7cfedf94a09c2be544b04e3b372140c38'
            '0d2adba25cdbe59e97ffd302083db9d5e23920780f41e04f64512cd6b633289a'
            'b29521fbd7a48a8f60b93ecca3b30c30bcb71560de8033c8d39b25c22c6f696f'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0'
            '33e3c3d6e16c8d30756754ea3f31f5457c5be0343686aad287692be34958984a'
            'a89566307e1c81c24f037d854cbd472d2f94f8a4b759877a01563a332319f7d6'
            'ed3dca57ef19d32499b72668bc78eaff0d9e772718b76f3816c5ee5f816b1891'
            '7fb85a1b54406032a922e8fd6f45d869fcfe5681df630e74e8e50c040b786ee4')

prepare() {
  cd lightdm-${pkgver}

  patch -Np1 -i ../lightdm-default-config.patch
}

build() {
  cd lightdm-${pkgver}

  export MOC4='moc-qt4'
  export MOC5='moc-qt5'

  ./configure \
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

package_lightdm-devel() {
depends=('libxklavier' 'polkit' 'systemd')
optdepends=('xorg-server-xephyr: LightDM test mode'
            'accountsservice: limit visible accounts')
provides=("lightdm=${pkgver}")
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

  cd lightdm-${pkgver}

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

package_liblightdm-qt4-devel() {
pkgdesc='LightDM Qt client library'
depends=('lightdm' 'qt4')
provides=('liblightdm-qt4')
conflicts=('liblightdm-qt4')
options=('!emptydirs')

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt5* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt5* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt5* -exec rm {} +
}

package_liblightdm-qt5-devel() {
pkgdesc='LightDM Qt client library'
depends=('lightdm' 'qt5-base')
provides=('liblightdm-qt5')
conflicts=('liblightdm-qt5')
options=('!emptydirs')

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}

# vim: ts=2 sw=2 et:
