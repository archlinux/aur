# Maintainer: DanielH <danielmirkin_at_gmail_dot_com>

# NOTE
# Add usbpicprog's user(s) to the uucp group, to allow communicate with hardware through USB ports:
# sudo gpasswd -a $USER uucp

pkgname=usbpicprog
pkgver=0.9.9_1.0.0_beta
pkgrel=1
epoch=1
pkgdesc="Software and firmware for the open hardware USB PIC Programmer"
arch=('x86_64')
url="http://usbpicprog.org/"
license=('GPL2')
depends=('libtool' 'wxgtk2' 'libusb' 'intltool')
conflicts=('usbpicprog<=140617')
source=(https://sourceforge.net/projects/usbpicprog/files/usbpicprog-software/usbpicprog-0.9.9-1.0.0-beta-software/usbpicprog-0.9.9-1.0.0-beta.tar.gz/download)
md5sums=('b0becbf499ca1df9102ca8b946631659') #generate with 'makepkg -g'

prepare() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  sed -i 's|/lib/udev/rules.d|/usr/lib/udev/rules.d|g' Makefile.in
  sed -i 's|plugdev|uucp|g' 26-microchip.rules
  sed -i 's/if (fp==NULL)/if (!fp.is_open())/' src/hexfile.cpp
}

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
}
