# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: kiefer <jorgelmadrid@gmail.com>

pkgname=lxdm-gtk3
_pkgname=lxdm
pkgver=0.5.1
pkgrel=4
pkgdesc='Lightweight X11 Display Manager (GTK+ 3 version)'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/lxdm/"
license=('GPL')
groups=('lxde-gtk3')
depends=('gtk3' 'xorg-server')
makedepends=('intltool' 'iso-codes')
optdepends=('iso-codes: show language names in language chooser'
            'librsvg: display the default background')
conflicts=($_pkgname)
install=$_pkgname.install
backup=('etc/lxdm/lxdm.conf' 'etc/pam.d/lxdm' 'etc/lxdm/Xsession'
        'etc/lxdm/PreLogin' 'etc/lxdm/LoginReady' 'etc/lxdm/PostLogin'
        'etc/lxdm/PostLogout' 'etc/lxdm/PreReboot' 'etc/lxdm/PreShutdown')
source=(http://downloads.sourceforge.net/lxdm/$_pkgname-$pkgver.tar.xz
        git-fixes.patch
        default-config.patch
        lxdm.pam
        Xsession)
md5sums=('9e03ce5f6d303bc9b689732401934dc6'
         '8f514a4ba8fe204c8f0db293246dba3d'
         'f0ae6c072f151104c53a030fd7757821'
         'c941ef896248bc7c03901b513490425c'
         '6ff73570368501a06ee7badc8e415d0a')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"

  # Apply fixes from git
  patch -Np1 -i ../git-fixes.patch

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
