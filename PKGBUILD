# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: mouse256 & AndyRTR
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=keytouch
pkgver=2.4.1
pkgrel=8
pkgdesc="A program to easily configure the extra function keys of your keyboard"
arch=('i686' 'x86_64')
url="http://keytouch.sourceforge.net/"
license=('GPL')
depends=('libxtst' 'gnome-menus2' 'alsa-lib' 'gtk2')
optdepends=('acpid: for ACPI support')
options=('!makeflags')
install=keytouch.install
backup=('etc/X11/Xsession')
source=(http://downloads.sourceforge.net/sourceforge/keytouch/${pkgname}-${pkgver}.tar.gz \
        keytouch.daemon keytouch.desktop Xsession automake.patch)
md5sums=('c3a917ae9666c9649d43d9aa09ecc96a'
         '5bd72f347f56c0524c7a7c8f44fc9a3a'
         'c5ffe28988dc74fae812ffe204f8883b'
         '795430001f4fdb6691d0e93b09a241a9'
         '6eb8756a6b639fe62e1a0b5303f9d8f6')
sha1sums=('f1f26dc95c21afd404aebe2b1066e75c8313ca80'
          '9c3ff4fd979fd0322014768bec132ddf005c7f7b'
          '5bac2f62f1ac26caa32da02a8075dc090d981cfb'
          '960b2fa51cfdeb2bc3fa7e086dc9f3a3be483dff'
          '5560d66e372cad3a1991e4a2f38b9645721a37e3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < $srcdir/automake.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mv configure.in configure.ac
  aclocal
  automake --add-missing --copy
  ./configure LDFLAGS='-ldl' --prefix=/usr --sysconfdir=/etc 
  make

  cd keytouch-config
  mv configure.in configure.ac
  aclocal
  automake --add-missing --copy
  ./configure --prefix=/usr --sysconfdir=/etc
  make

  cd ../keytouch-keyboard
  mv configure.in configure.ac
  aclocal
  automake --add-missing --copy
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}"/etc/{rc.d,X11/Xsession.d}
  install -d "${pkgdir}/usr/share/keytouch"
  make DESTDIR="${pkgdir}" install

  cd keytouch-config
  make DESTDIR="${pkgdir}" install

  cd ../keytouch-keyboard
  make DESTDIR="${pkgdir}" install

  install -Dm755 "${srcdir}/keytouch.daemon" "${pkgdir}/etc/rc.d/keytouch"
  install -Dm644 "${srcdir}/keytouch.desktop" "${pkgdir}/usr/share/applications/keytouch.desktop"
  install -Dm755 "${srcdir}/Xsession" "${pkgdir}/etc/X11/Xsession"
  chmod 755 "${pkgdir}"/etc/X11/Xsession.d/*
  rm "${pkgdir}"/etc/rc.d/*.sh
}
