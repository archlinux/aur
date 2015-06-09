# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: kiefer <jorgelmadrid@gmail.com>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=lxdm-consolekit
_pkgname=lxdm
pkgver=0.5.1
pkgrel=1
pkgdesc='LXDM with consolekit support enabled'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/lxdm/"
license=('GPL')
groups=('lxde')
depends=('gtk2' 'xorg-server' 'consolekit')
makedepends=('intltool' 'iso-codes')
optdepends=('gtk-engines: default GTK+ theme'
            'iso-codes: show language names in language chooser'
            'librsvg: display the default background')
conflicts=('lxdm')
provides=('lxdm')
install=$_pkgname.install
backup=('etc/lxdm/lxdm.conf' 'etc/pam.d/lxdm' 'etc/lxdm/Xsession'
        'etc/lxdm/PreLogin' 'etc/lxdm/LoginReady' 'etc/lxdm/PostLogin'
        'etc/lxdm/PostLogout' 'etc/lxdm/PreReboot' 'etc/lxdm/PreShutdown')
source=(http://downloads.sourceforge.net/lxdm/$_pkgname-$pkgver.tar.xz
        default-config.patch
        lxdm.pam
        Xsession)
md5sums=('9e03ce5f6d303bc9b689732401934dc6'
         'd42d17443e544beee46a9ab47cb24b86'
         '06f54c141668495b1e600dc56d3cec1a'
         '6ceea02bf33f6d122365f83435f976ab')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"

  # Adjust Arch-specific settings
  patch -Np1 -i ../default-config.patch

  # Use our custom pam and Xsession files
  cp ../lxdm.pam pam/lxdm
  cp ../Xsession data/Xsession

  # Support for pulseaudio
  echo 'test -x /usr/bin/pax11publish && /usr/bin/pax11publish -r' >> data/PostLogout.in
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/lxdm \
              --sysconfdir=/etc --localstatedir=/var
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
