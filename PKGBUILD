# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot 

pkgbase=lightdm-guest
pkgname=(
  lightdm-guest
  liblightdm-qt5-guest
)
pkgver=1.30.0
pkgrel=1
epoch=1
pkgdesc='A lightweight display manager. With guest-session enabled'
_add_group=add-autologin-group
arch=(x86_64)
url=https://www.freedesktop.org/wiki/Software/LightDM/
license=(
  GPL3
  LGPL3
)
makedepends=(
  glib2
  glibc
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
source=(
    "lightdm-${pkgver}.tar.gz::https://github.com/CanonicalLtd/lightdm/archive/${pkgver}.tar.gz"
    lightdm.service
    lightdm.sysusers
    lightdm.tmpfiles
    lightdm.pam
    lightdm-autologin.pam
    lightdm.rules
    lightdm-default-config.patch
    Xsession
    0001-guest-account-Add-default-GSettings-support.patch
    $_add_group.script
    $_add_group.service
)
sha256sums=('05fe38d10dc8966f19806f001561edc057e757656ed37e08ca3127ab32a02692'
            '0db37a14521be729411a767f157fbd07adb738b14006277def53a1efe4dacfb8'
            'fd93291bfc9985f0a1bb288472866aa0a9bcd259e024c3a29d20ca158bc08403'
            'cd69f928a1a5b30a30ba916e1b64c9f3657597cb28f3f0e220494d6e5e4bf587'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0'
            '33e3c3d6e16c8d30756754ea3f31f5457c5be0343686aad287692be34958984a'
            'a89566307e1c81c24f037d854cbd472d2f94f8a4b759877a01563a332319f7d6'
            '70b1d952d1ea8ade6b5561e6de781cfbfe3a86a116c10ea9774cfae73281c7a6'
            'd30321a1b490500483b8ed7825fcff2c24a7c760ac627789ff517693888ec3c5'
            'e4c2c618f5484ba165776b747befadd101e40cfdbe4bc01cbb6d3e22beb6ab65'
            '8b665387245531d4d25ffee9636a3735667876937238c376d7eece97f7a82c14'
            '2199300cc27b6b407e46206abd181b2be2679d2520ddd183e4a37a3fc691739a')

prepare() {
    cd "lightdm-${pkgver}"

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
}

build() {
  cd lightdm-${pkgver}

  export MOC5=moc-qt5

    gtkdocize
    aclocal --install --force
    autoreconf -vfi
    intltoolize -f

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
    bindfs
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

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" -C liblightdm-qt uninstall
  install -m 755 ../Xsession "${pkgdir}"/etc/lightdm/Xsession
  rm -rf "${pkgdir}"/etc/init
  rm -rf "${pkgdir}"/usr/include/lightdm-qt{,5}-*

  # Dbus
  mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
  rmdir "${pkgdir}"/etc/dbus-1

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
  install -Dm755 $_add_group.script $pkgdir/usr/bin/$_add_group
  install -Dm644 $_add_group.service $pkgdir/etc/systemd/system/$_add_group.service
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

  cd lightdm-${pkgver}

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}
