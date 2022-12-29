# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Morfeo <morfeo89@hotmail.it>

pkgbase=lightdm-guest
pkgname=(
  lightdm-guest
  liblightdm-qt5-guest
)
pkgver=1.32.0
pkgrel=1
epoch=1
pkgdesc='A lightweight display manager. With guest-session enabled'
_add_group=add-autologin-group
arch=(x86_64)
url=https://github.com/canonical/lightdm
license=(
  GPL3
  LGPL3
)
makedepends=(
  glib2
  git
  gobject-introspection
  gtk-doc
  intltool
  itstool
  libgcrypt
  libx11
  libxcb
  libxdmcp
  libxklavier
  pam
  polkit
  qt5-base
  vala
  yelp-tools
)
install=$_add_group.install
_tag=9e72b5b3072ff9990211f35aa2a48e971ff710c7
source=(
  git+https://github.com/CanonicalLtd/lightdm.git?signed#tag=${_tag}
  lightdm.service
  lightdm.sysusers
  lightdm.tmpfiles
  lightdm.pam
  lightdm-autologin.pam
  lightdm.rules
  lightdm-default-config.patch
  Xsession
  0001-guest-account-Add-default-GSettings-support.patch
  0002-guest-account-Enable-autologin-guest-account-command.patch
  $_add_group.script
  $_add_group.service
)
validpgpkeys=(497851B5D455C606543F2B9318EAA1890F7C882E) # Robert Ancell <robert.ancell@gmail.com>
b2sums=('SKIP'
        'edf722759d922428f5aba6793923e3b1846ddcfab67fe3e2bac109edf16219e037242aa5536fbab346e04295069b4fc0fa98062e3006088ec9780c58e503463a'
        '901702d0bc471de1f8f796576f4d3b451daf632dd703fecc3be7228f9b8deb911d834cd53e8fd5ee24227f46be6a4789b1983a96ec7c32d170d7427ef00c5293'
        '8d04b2f9b861a65707bc1965a80f64d4e03cfe09c84addda27e8dca74b40f4fe85c43773e41dcb972772df7684d4bfc2aacd32c9bc1ac9fa1c2a8d6c27cd02b2'
        '11f4c568c6b766d3baf65ea91be2ec0641381a6c195ef460a9a0e282591c1211603d0a3db630e901079fba28819a4efab45bb8b722947dfac37659daafe14aaf'
        '3349ad387eb3c928e3314f557800f88abb58eb2d5f2e4ccb882c4469f7ed26f940cd70a89ad33484eb3f14246ea7c7402a24396aeeea7046c002bedace631c26'
        '9e7b4f2adacfa18e9c029f93b922da45e3326266495a1919465f299fa630d769eaaa2101d76966cea496f66c4bd8469c73ef55acde5cd19fa559921c192acd04'
        'f252322abfc5351c076ab64c4891a31fcb4cf806ad186d8287f23ae968164f612ff140da83160ebe7e6633d3b039dc4791fa4dd7dbc363dadec544a341675aa2'
        '7785c19bb2343732d75dd2abd744148ae8baa6d8ad2b295a8e28d5eb78d7bd525e17784ae8a75784ab4cdb3fde73c66789b1bc033c53dafe13f8d19988e5ba18'
        '5f684c420f91c7458422e9daf8f75690ffcba6938e71e79a1c97039969d33a76d902699602795a7626ee0e8f0afa987123f9e53356af239360cb9c03b933ae77'
        'a79443e9f7e84f7e2baadb40c97c72448cd0f69b1ca49aa1a615d0e937a521b1201450bec7e97a95a43e8a7e1f8490fb8da0eba14b508ea4f494bac7c7164701'
        '0aaa0792bbfd9057ad98417e218ce9fe032f3f043216270eb2232c98446cccd0b397273ca7f959eaa3f01e31567384d6211dd3961a96ca07b3acae8a9a307a0d'
        '055dda3ce02e0fd5fc5e5de04941cab2850d10772095fa969780354ea529c1c79b889af935fac26840803b6485ce5afff7fe1b8378784e79ab3fd0b4be53e846')

prepare() {
  cd lightdm
  patch -Np1 -i ../lightdm-default-config.patch

  # Do not use Ubuntu's language-tools
  sed -i '/04_language_handling.patch/d' debian/patches/series

  for i in $(grep -v '#' debian/patches/series); do
      patch -p1 -i "debian/patches/${i}"
  done

  # Add support for settings GSettings/dconf defaults in the guest session. Just
  # put the files in /etc/guest-session/gsettings/. The file format is the same
  # as the regular GSettings override files.
  patch -p1 -i ../0001-guest-account-Add-default-GSettings-support.patch

  # Add support for autologin in the guest session. In Archlinux and derivatives
  # this is a requirement to enable a fully functional session. It requires adding
  # the autologin tweak.
  patch -p1 -i ../0002-guest-account-Enable-autologin-guest-account-command.patch

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd lightdm
  git describe --tags
}

build() {
  cd lightdm
  export MOC5=moc-qt5
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/lightdm \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --disable-static \
    --disable-tests \
    --enable-gtk-doc \
    --with-greeter-user=lightdm \
    --with-greeter-session=lightdm-gtk-greeter
  make
}

package_lightdm-guest() {
  depends=(
    glib2
    libgcrypt
    libx11
    libxcb
    libxdmcp
    libxklavier
    pam
    polkit
  )
  optdepends=(
    'accountsservice: Enhanced user accounts handling'
    'lightdm-gtk-greeter: GTK greeter'
    'xorg-server-xephyr: LightDM test mode'
  )
  provides=(lightdm)
  conflicts=(lightdm)
  backup=(
    etc/apparmor.d/lightdm-guest-session
    etc/lightdm/keys.conf
    etc/lightdm/lightdm.conf
    etc/lightdm/users.conf
    etc/lightdm/Xsession
    etc/pam.d/lightdm
    etc/pam.d/lightdm-autologin
    etc/pam.d/lightdm-greeter
  )

  cd lightdm

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C liblightdm-qt uninstall
  install -m 755 ../Xsession "${pkgdir}"/etc/lightdm/Xsession
  rm -rf "${pkgdir}"/etc/init
  rm -rf "${pkgdir}"/usr/include/lightdm-qt{,5}-*

  # PAM
  install -m 644 ../lightdm.pam "${pkgdir}"/etc/pam.d/lightdm
  install -m 644 ../lightdm-autologin.pam "${pkgdir}"/etc/pam.d/lightdm-autologin

  # PolicyKit
  install -dm 750 -g 102 "${pkgdir}"/usr/share/polkit-1/rules.d
  install -m 644 ../lightdm.rules "${pkgdir}"/usr/share/polkit-1/rules.d/lightdm.rules

  # Systemd
  install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,sysusers.d,tmpfiles.d}
  install -m 644 ../lightdm.service "${pkgdir}"/usr/lib/systemd/system/lightdm.service
  install -m 644 ../lightdm.sysusers "${pkgdir}"/usr/lib/sysusers.d/lightdm.conf
  install -m 644 ../lightdm.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lightdm.conf

  # Additional LightDM configuration files
  install -dm755 "${pkgdir}"/etc/lightdm/lightdm.conf.d/
  install -m644 debian/50-{xserver-command,greeter-wrapper,guest-wrapper,disable-log-backup}.conf \
                  "${pkgdir}"/etc/lightdm/lightdm.conf.d/

  # Install binaries and scripts
  install -dm755 "${pkgdir}"/usr/bin/
  install -m755 debian/guest-account.sh "${pkgdir}"/usr/bin/guest-account
  install -m755 debian/guest-session-auto.sh "${pkgdir}"/usr/lib/lightdm/
  install -m755 debian/lightdm-session "${pkgdir}"/usr/bin/
  install -m755 debian/lightdm-greeter-session "${pkgdir}"/usr/lib/lightdm/
  install -m755 debian/config-error-dialog.sh "${pkgdir}"/usr/lib/lightdm/

  # Skeleton files for guest account
  install -dm755 "${pkgdir}"/usr/share/lightdm/guest-session/skel/.config/autostart/
  install -m644 debian/guest-session-startup.desktop \
                  "${pkgdir}"/usr/share/lightdm/guest-session/skel/.config/autostart/
  install -m755 debian/guest-session-setup.sh \
                  "${pkgdir}"/usr/share/lightdm/guest-session/setup.sh

  # Create GSettings defaults directory
  install -dm755 "${pkgdir}"/etc/guest-session/gsettings/

  # Remove apparmor stuff
  rm -rvf "${pkgdir}"/etc/apparmor.d/

  # Install autologin systemd service
  cd /$srcdir

  if [ ! -f $pkgdir/usr/bin/$_add_group.script ]; then
    install -Dm755 $_add_group.script $pkgdir/usr/bin/$_add_group
  fi

  if [ ! -f $pkgdir/usr/bin/$_add_group.service ]; then
    install -Dm644 $_add_group.service $pkgdir/etc/systemd/system/$_add_group.service
  fi

}

package_liblightdm-qt5-guest() {
  pkgdesc='LightDM Qt client library. With guest-session enabled'
  depends=(
    lightdm
    qt5-base
  )
  options=(!emptydirs)
  provides=(liblightdm-qt5)
  conflicts=(liblightdm-qt5)

  cd lightdm
  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}

# vim: ts=2 sw=2 et:
