# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# This package no longer depends on a specific toolkit. It will build the GTK and
# Qt libraries and recommend the installation of those respective tookits using
# optdepends.

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=vivid
# vercheck-launchpad: name=${pkgname%-*}

pkgname=lightdm-ubuntu
_ubuntu_rel=0ubuntu1
pkgver=1.15.0
pkgrel=1
pkgdesc="A lightweight display manager"
arch=(i686 x86_64)
url="https://launchpad.net/lightdm"
# Libraries are LGPLv3+, everything else is GPLv3+
license=(GPL3 LGPL3)
groups=(unity)
depends=(libgcrypt libxcb libxdmcp libxklavier)
# Useful dependencies, but not required
#depends=('gnome-themes-standard' 'gnome-backgrounds' 'gnome-icon-theme' 'webkitgtk3')
makedepends=(gnome-common gobject-introspection gtk-doc gtk3 intltool qt4 qt5-base yelp-tools)
optdepends=('accountsservice: DBus interface for querying user information'
            'gnome-keyring: For pam_gnome_keyring.so in the greeter PAM config'
            'gtk3: For using the GTK greeter'
            'lightdm-unity-greeter: Default Ubuntu 13.04 Greeter'
            'qt4: To use the qt4 version of liblightdm-qt'
            'qt5-base: To use the qt5 version of liblightdm-qt')
provides=("lightdm=${pkgver}" "liblightdm-qt4=${pkgver}")
conflicts=(lightdm liblightdm-qt4)
options=(emptydirs)
backup=(etc/lightdm/keys.conf
        etc/lightdm/lightdm.conf
        etc/lightdm/users.conf)
install=lightdm.install
source=(#"https://launchpad.net/ubuntu/+archive/primary/+files/lightdm_${pkgver}.orig.tar.gz"
        #"https://launchpad.net/ubuntu/+archive/primary/+files/lightdm_${pkgver}-${_ubuntu_rel}.diff.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/lightdm_${pkgver}-${_ubuntu_rel}.tar.gz"
        lightdm.service
        lightdm.tmpfiles.d
        lightdm.pam
        lightdm-autologin.pam
        lightdm-greeter.pam
        lightdm.rules
        0001-guest-account-Use-cross-distro-commands.patch
        0002-guest-account-Add-default-GSettings-support.patch)
sha512sums=('d0ef9d4066c2f23db87a57c239e8ddea05c427e103e42ecf9b58b4d16e856ba93a89f6348c144f0b5cb31ae41341623c7d6b079539fa76e239d3d9a77cf88082'
            '26bb333e58ee63a6a0d472bb0a7f9006b93c7de629780399b1dff4af3aaccea02aa74ed0410b8fa6ba55b285f7c7bb6180db059928feba56f779c5b8f3ba8b86'
            '81a76a49eb208b1d33f5ac0184d87a377cd37c522d74a93ccd3d96b3d6e32c44872a65873b91fec3daba0846cdb5a938b51944697e636c045d03259bd5424644'
            '1067bcb25b6d6d01256b176b5854d1ace700ba2b7323b4af257aa95d2f47d5043ac22811f65e99f1e961772cd1e81c153ef69b162918827bd9d7d50d458908df'
            '6f59d97515b37d53fb4f56de0f65994710e02c197c6d4c096aa7cdb9fe518d29223960018ae4ad8003056fed3210f47f3aa459c85b8efca80089f2046196892c'
            '3b482f7e551df20a5c5d9331a420275d1dad5bb6aad287247baea82dc40dc31dca22db4da180fbb950865e37cf94f1737fa1ee7ec2f5233540f82f2f570a408b'
            '8d6aa12c4d129c25e56ecf2904db4e294d46631d11bd8bec2f20a76c871ba758094abb24616d3d2038a684fbb736ee61d1f80697d525d62c4dc68113e101194f'
            '490eef8c2136ebe6525ef09e5b7ee15d2b78827538f1d4c9c4c5f2f1175d4d1d097ff57fac4ce880ceb2cfe9a810431f82625a8712c6d9306bbaf3ad5ceae742'
            '8a9e280bc4b60cfd9c48097878542b1005c7f3b3345296e448b3cd19987f0e51975518eb33b4c228a4d79701f57621b43cdb81f58662cb51d70d1bb9f4a3cf41')

prepare() {
  cd "lightdm-${pkgver}"

  #patch -p1 -i "../lightdm_${pkgver}-${_ubuntu_rel}.diff"

  # Apply Ubuntu patches

  # Disable patches
    # Do not use Ubuntu's language-tools
      sed -i '/04_language_handling.patch/d' debian/patches/series

  for i in $(grep -v '#' debian/patches/series); do
    patch -p1 -i "debian/patches/${i}"
  done

  # Do not depend on Debian/Ubuntu specific adduser package
  patch -p1 -i ../0001-guest-account-Use-cross-distro-commands.patch

  # Add support for settings GSettings/dconf defaults in the guest session. Just
  # put the files in /etc/guest-session/gsettings/. The file format is the same
  # as the regular GSettings override files.
  patch -p1 -i ../0002-guest-account-Add-default-GSettings-support.patch
}

build() {
  cd "lightdm-${pkgver}"

  export MOC4=moc-qt4
  export MOC5=moc-qt5

  gtkdocize
  aclocal --install --force
  autoreconf -vfi
  intltoolize -f

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static \
    --libexecdir=/usr/lib/lightdm \
    --localstatedir=/var \
    --with-user-session=ubuntu \
    --with-greeter-user=lightdm

  make
}

package() {
  cd "lightdm-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/usr/lib/systemd/system/"

  # Additional LightDM configuration files
  install -dm755 "${pkgdir}"/etc/lightdm/lightdm.conf.d/
  install -m644 debian/50-{xserver-command,greeter-wrapper,guest-wrapper}.conf \
                "${pkgdir}"/etc/lightdm/lightdm.conf.d/

  # Install PAM service
  install -dm755  "${pkgdir}"/etc/pam.d/
  install -m644 "${srcdir}"/lightdm.pam "${pkgdir}"/etc/pam.d/lightdm
  install -m644 "${srcdir}"/lightdm-autologin.pam \
                "${pkgdir}"/etc/pam.d/lightdm-autologin
  install -m644 "${srcdir}"/lightdm-greeter.pam \
                "${pkgdir}"/etc/pam.d/lightdm-greeter

  # Install configuration files
  install -dm755 "${pkgdir}"/usr/share/doc/lightdm/
  install -m644 "${pkgdir}"/etc/lightdm/lightdm.conf \
                "${pkgdir}"/usr/share/doc/lightdm/
  install -m644 "${pkgdir}"/etc/lightdm/keys.conf \
                "${pkgdir}"/usr/share/doc/lightdm/

  # Install binaries and scripts
  install -dm755 "${pkgdir}"/usr/bin/
  install -m755 debian/guest-account.sh "${pkgdir}"/usr/bin/guest-account
  install -m755 debian/lightdm-session "${pkgdir}"/usr/bin/
  install -m755 debian/lightdm-greeter-session "${pkgdir}"/usr/lib/lightdm/
  install -m755 debian/config-error-dialog.sh "${pkgdir}"/usr/lib/lightdm/

  # Install systemd service
  install -m644 "${srcdir}"/lightdm.service "${pkgdir}"/usr/lib/systemd/system/

  # Install systemd tmpfiles.d file
  install -dm755 "${pkgdir}"/usr/lib/tmpfiles.d/
  install -m644 "${srcdir}"/lightdm.tmpfiles.d \
                "${pkgdir}"/usr/lib/tmpfiles.d/lightdm.conf

  # Install PolicyKit rules from Fedora which allow the lightdm user to access
  # the systemd-logind, consolekit, and upower DBus interfaces
  install -dm700 "${pkgdir}"/usr/share/polkit-1/rules.d/
  install -m644 "${srcdir}"/lightdm.rules \
                "${pkgdir}"/usr/share/polkit-1/rules.d/

  # Configuration settings that differ from Ubuntu
  sed -i \
    -e 's/^\(minimum-uid=\).*$/\11000/g' \
    -e 's@/usr\(/sbin/nologin\)$@\1@g' \
    "${pkgdir}"/etc/lightdm/users.conf

  # Configuration files specific to Ubuntu
  rm -rvf "${pkgdir}"/etc/init/

  # Create GSettings defaults directory
  install -dm755 "${pkgdir}"/etc/guest-session/gsettings/

  # Remove apparmor stuff
  rm -rvf "${pkgdir}"/etc/apparmor.d/
}
