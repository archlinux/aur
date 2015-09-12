# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Hills <hills.as@gmail.com>
# Contributor: John <graysky@archlinux.us>

pkgname=tightvnc
pkgver=1.3.10
pkgrel=10
pkgdesc='VNC server and viewer'
arch=('x86_64' 'i686')
license=('GPL')
url='http://www.tightvnc.com/'
depends=('libjpeg' 'zlib' 'libxaw' 'libxp' 'xorg-xauth' 'perl')
makedepends=('imake' 'setconf' 'gendesk')
options=('!makeflags')
source=("http://downloads.sf.net/sourceforge/vnc-tight/$pkgname-${pkgver}_unixsrc.tar.bz2"
        'http://people.csail.mit.edu/jaffer/Color/rgb.txt'
        'vncserver.service'
        'tightvnc.png::http://www.tightvnc.com/logo/tightvnc-logo-90x90.png')
sha256sums=('f48c70fea08d03744ae18df6b1499976362f16934eda3275cead87baad585c0d'
            'af6c056a95ae725f98534db22b9a4916d17f2356fdca84a4a038211a82fa8a73'
            'ccadf1fc708fad601e6113464d6c533a629f6dc9116f6071347cd0b465c1f48b'
            '9059bdfe62231fc645a35c3fe694c7e97e2bdeb5e3e23ce8eab2961e583219a8')

prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec vncviewer \
    --name 'TightVNC Viewer' --categories 'Application;Network'

  cd vnc_unixsrc
  setconf vncserver '$vncClasses' \"/usr/share/tightvnc\"\;
  setconf vncserver '$fontPath' \
    \"/usr/share/fonts/misc/,/usr/share/fonts/75dpi/,/usr/share/fonts/100dpi/,/usr/share/fonts/Type1/\"\;
  sed -i 's:/lib/cpp:/usr/bin/cpp:' Xvnc/config/cf/linux.cf
}

build() {
  cd vnc_unixsrc

  xmkmf
  make World

  cd Xvnc
  ./configure
  setconf programs/Xserver/dix/Makefile DEFAULTRGBDATABASE '/usr/share/tightvnc/rgb'
  setconf programs/Xserver/os/Makefile PROTO_DEFINES "-D_XOPEN_SOURCE=500L"
  setconf lib/font/fc/Makefile PROTO_DEFINES "-D_XOPEN_SOURCE=500L"

  make
}

package() {
  cd vnc_unixsrc

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/$pkgname"

  ./vncinstall "$pkgdir/usr/bin" "$pkgdir/usr/share/man"

  cd "$srcdir"
  install -Dm644 vnc_unixsrc/classes/* \
    $pkgdir/usr/share/$pkgname
  install -Dm644 rgb.txt $pkgdir/usr/share/$pkgname/rgb.txt
  install -Dm644 $pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png \
    $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 vncserver.service \
    $pkgdir/usr/lib/systemd/system/vncserver.service
}

# vim:set ts=2 sw=2 et:
