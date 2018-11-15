# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot 

pkgbase=lightdm-guest
pkgname=('lightdm-guest' 'liblightdm-qt4-guest' 'liblightdm-qt5-guest')
pkgver=1.28.0
pkgrel=1
epoch=1
pkgdesc='A lightweight display manager. With guest-session enabled and other tweaks'
arch=('x86_64')
url='https://www.freedesktop.org/wiki/Software/LightDM/'
license=('GPL3' 'LGPL3')
makedepends=('gcc-libs' 'glib2' 'glibc' 'gobject-introspection' 'gtk-doc'
             'intltool' 'itstool' 'libgcrypt' 'libx11' 'libxcb' 'libxdmcp'
             'libxklavier' 'pam' 'polkit' 'qt4' 'qt5-base' 'vala' 'yelp-tools')
source=("lightdm-${pkgver}.tar.gz::https://github.com/CanonicalLtd/lightdm/archive/${pkgver}.tar.gz"
        'lightdm.service'
        'lightdm.sysusers'
        'lightdm.tmpfiles'
        'lightdm.pam'
        'lightdm-autologin.pam'
        'lightdm.rules'
        'lightdm-default-config.patch'
        'Xsession'
        0001-guest-account-Add-default-GSettings-support.patch
	0002-Fix-separator-error.patch)
sha256sums=('e76eb297ff9bf57d38f3480789b9cc0d99a939bd0b5f280c7309ff313d956784'
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP
             SKIP)

prepare() {
    cd "lightdm-${pkgver}"

    patch -p1 -i "${srcdir}"/lightdm-default-config.patch
    # patch -p1 -i "${srcdir}"/0002-Fix-separator-error.patch

    # Do not use Ubuntu's language-tools
    sed -i '/04_language_handling.patch/d' debian/patches/series

    for i in $(grep -v '#' debian/patches/series); do
        patch -p1 -i "debian/patches/${i}"
    done

    # Add support for settings GSettings/dconf defaults in the guest session. Just
    # put the files in /etc/guest-session/gsettings/. The file format is the same
    # as the regular GSettings override files.
    patch -p1 -i ../0001-guest-account-Add-default-GSettings-support.patch
}

build() {
  cd lightdm-${pkgver}

  export MOC4='moc-qt4'
  export MOC5='moc-qt5'

    gtkdocize
    aclocal --install --force
    autoreconf -vfi
    intltoolize -f

  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lightdm' \
    --localstatedir='/var' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --disable-static \
    --disable-tests \
    --enable-gtk-doc \
    --with-greeter-user='lightdm' \
    --with-greeter-session='lightdm-gtk-greeter'
  make
}

package_lightdm-guest() {
  depends=('glib2' 'glibc' 'libgcrypt' 'libx11' 'libxcb' 'libxdmcp'
           'libxklavier' 'pam' 'polkit')
  optdepends=('accountsservice: Enhanced user accounts handling'
              'lightdm-gtk-greeter: GTK greeter'
              'xorg-server-xephyr: LightDM test mode'
              'bindfs: Used for guest session to avoid copying skeleton dotfiles')
    provides=(lightdm)
    conflicts=(lightdm)
  backup=('etc/apparmor.d/lightdm-guest-session'
          'etc/lightdm/keys.conf'
          'etc/lightdm/lightdm.conf'
          'etc/lightdm/users.conf'
          'etc/lightdm/Xsession'
          'etc/pam.d/lightdm'
          'etc/pam.d/lightdm-autologin'
          'etc/pam.d/lightdm-greeter')

  cd lightdm-${pkgver}

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
}

package_liblightdm-qt4-guest() {
  pkgdesc='LightDM Qt client library. With guest-session enabled and other tweaks'
  depends=('gcc-libs' 'glibc' 'lightdm' 'qt4')
  options=('!emptydirs')
  provides=(liblightdm-qt4)
  conflicts=(liblightdm-qt4)

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt5* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt5* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt5* -exec rm {} +
}

package_liblightdm-qt5-guest() {
  pkgdesc='LightDM Qt client library. With guest-session enabled and other tweaks'
  depends=('gcc-libs' 'glibc' 'lightdm' 'qt5-base')
  options=('!emptydirs')
  provides=(liblightdm-qt5)
  conflicts=(liblightdm-qt5)

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}
