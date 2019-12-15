# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: eworm <arch@eworm.de>
# Contributor: pisuka <tekmon@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgbase=lightdm-git
pkgname=('lightdm-git' 'liblightdm-qt5-git')
pkgver=1.30.0.r9.g03f21898
pkgrel=1
pkgdesc='A lightweight display manager'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm'
license=('GPL3' 'LGPL3')
makedepends=('git' 'gobject-introspection' 'gtk-doc'
             'intltool' 'itstool' 'glib2' 'libxcb' 'libgcrypt'
             'vala' 'libx11' 'libxdmcp' 'pam'
             'libxklavier' 'polkit' 'qt5-base'
             'systemd' 'yelp-tools')

source=("git+https://github.com/CanonicalLtd/lightdm"
        'lightdm.service'
        'lightdm.sysusers'
        'lightdm.tmpfiles'
        'lightdm.pam'
        'lightdm-autologin.pam'
        'lightdm.rules'
        'lightdm-default-config.patch'
        'Xsession')
sha256sums=('SKIP'
            '0d2adba25cdbe59e97ffd302083db9d5e23920780f41e04f64512cd6b633289a'
            'fd93291bfc9985f0a1bb288472866aa0a9bcd259e024c3a29d20ca158bc08403'
            'b29521fbd7a48a8f60b93ecca3b30c30bcb71560de8033c8d39b25c22c6f696f'
            'e8c4c5fd3b801a390d201166fd1fb9730e78a5c62928768103b870b6bd980ea0'
            '33e3c3d6e16c8d30756754ea3f31f5457c5be0343686aad287692be34958984a'
            'a89566307e1c81c24f037d854cbd472d2f94f8a4b759877a01563a332319f7d6'
            '6cd0b5502f30cc6166b9755b92ee3d77bd839e48b3139197ac6874799f28415b'
            '7fb85a1b54406032a922e8fd6f45d869fcfe5681df630e74e8e50c040b786ee4')

pkgver() {
  cd $srcdir/lightdm

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/lightdm

  patch -Np1 -i ../lightdm-default-config.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $srcdir/lightdm

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
    --enable-gtk-doc \
    --disable-tests
   make
}

package_lightdm-git() {
depends=('libxklavier' 'polkit' 'systemd' 'glib2'
         'libgcrypt' 'libx11' 'libxcb' 'pam' 'libxdmcp')
optdepends=('xorg-server-xephyr: LightDM test mode'
            'accountsservice: limit visible accounts'
            'lightdm-gtk-greeter: GTK greeter')
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

  cd $srcdir/lightdm

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
  install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d,sysusers.d}
  install -m 644 ../lightdm.service "${pkgdir}"/usr/lib/systemd/system/lightdm.service
  install -m 644 ../lightdm.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lightdm.conf
  install -m 644 ../lightdm.sysusers "${pkgdir}"/usr/lib/sysusers.d/lightdm.conf
}

package_liblightdm-qt5-git() {
pkgdesc='LightDM Qt client library'
depends=('lightdm' 'qt5-base')
provides=('liblightdm-qt5')
conflicts=('liblightdm-qt5')
options=('!emptydirs')

  cd $srcdir/lightdm

  make DESTDIR="${pkgdir}" -C liblightdm-gobject install
  make DESTDIR="${pkgdir}" -C liblightdm-qt install
  make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
  find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
  find "${pkgdir}" -type f  -name *qt[!5]* -exec rm {} +
  find "${pkgdir}" -type l  -name *qt[!5]* -exec rm {} +
}

# vim: ts=2 sw=2 et:
