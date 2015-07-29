# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: kiefer <jorgelmadrid@gmail.com>

pkgname=lxdm-gtk3
_pkgname=lxdm
pkgver=0.5.1
pkgrel=3
pkgdesc='Lightweight X11 Display Manager (GTK+ 3 version)'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/lxdm/"
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3' 'xorg-server')
makedepends=('intltool' 'iso-codes')
optdepends=('gtk-engines: default GTK+ theme'
            'iso-codes: show language names in language chooser'
            'librsvg: display the default background')
conflicts=($_pkgname)
provides=($_pkgname)
install=$_pkgname.install
backup=('etc/lxdm/lxdm.conf' 'etc/pam.d/lxdm' 'etc/lxdm/Xsession'
        'etc/lxdm/PreLogin' 'etc/lxdm/LoginReady' 'etc/lxdm/PostLogin'
        'etc/lxdm/PostLogout' 'etc/lxdm/PreReboot' 'etc/lxdm/PreShutdown')
source=(http://downloads.sourceforge.net/lxdm/$_pkgname-$pkgver.tar.xz
        0001-Make-gtk3-theme-consistent-with-gtk2-theme.patch
        default-config.patch
        lxdm.pam
        Xsession
        lxdm.git-2abf1d971198d224c68b20c56862df2fe7c6a648.patch
        lxdm.git-4dfe7924a220643600be58861b01f186225fe251.patch)
md5sums=('9e03ce5f6d303bc9b689732401934dc6'
         '1ce01d9b47317d0d820abf9d5f116c08'
         'f0ae6c072f151104c53a030fd7757821'
         'c941ef896248bc7c03901b513490425c'
         '6ff73570368501a06ee7badc8e415d0a'
         '54c3de1d6108f8d68dea31622dd976e1'
         '2522db72aeddffc22e349bfea24ae48e')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"

  # Kill user processes on logout (fix second login with systemd >= 222)
  patch -Np1 -i ../lxdm.git-2abf1d971198d224c68b20c56862df2fe7c6a648.patch
  patch -Np1 -i ../lxdm.git-4dfe7924a220643600be58861b01f186225fe251.patch

  # Make gtk3 theme consistent with gtk2 theme
  patch -Np1 -i ../0001-Make-gtk3-theme-consistent-with-gtk2-theme.patch

  # Adjust Arch-specific settings
  patch -Np1 -i ../default-config.patch

  # Use our custom pam and Xsession files
  cp ../lxdm.pam pam/lxdm
  cp ../Xsession data/Xsession

  # Support for pulseaudio
  echo 'test -x /usr/bin/pax11publish && /usr/bin/pax11publish -r' >>data/PostLogout.in
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/lxdm \
              --sysconfdir=/etc --localstatedir=/var --enable-gtk3
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  chmod 644 "$pkgdir/etc/lxdm/lxdm.conf"

  # Home directory
  install -dm 755 "$pkgdir/var/lib/lxdm"
  echo 'GDK_CORE_DEVICE_EVENTS=true' > "$pkgdir"/var/lib/lxdm/.pam_environment
  chown -R 121:121 "$pkgdir/var/lib/lxdm"
}
