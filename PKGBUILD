# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: FireZ <firez199984@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Based on Det's xf86-input-evdev-git

# This package fix the buttons on the Surface Pen 3 (except the OneNote button which based on bluetooth)

_pkgname=xorg-xf86-input-evdev
pkgname=xf86-input-evdev-git-surfacepen3
pkgver=2.10.6.r2.g7103611
pkgrel=1
pkgdesc="X.org evdev input driver with the patch for Surface Pen 3 (Git)"
arch=('i686' 'x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('systemd-libs' 'mtdev' 'libevdev')
makedepends=('xorg-server-devel' 'X-ABI-XINPUT_VERSION=24.1' 'xorgproto' 'git')
provides=("$_pkgname=$pkgver" 'xorg-server' 'X-ABI-XINPUT_VERSION' 'X-ABI-XINPUT_VERSION')
conflicts=('xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<24.1' 'X-ABI-XINPUT_VERSION>=25' "$_pkgname")
options=('!makeflags')
source=("git+https://github.com/freedesktop/xorg-xf86-input-evdev.git"
        'surfacepen3.patch')
sha512sums=('SKIP'
            '21b7ec3aa0b4aea6b2398aec8d2a08b2071a2879916c65c9adfa0bd14c2124069ac21fdd5871a8590dac3ac73ef6accdb160ea76b21494e66db31109ca534a29')

pkgver() {
  cd $srcdir/$_pkgname
  # cutting off 'xf86.input.evdev.' prefix that presents in the git tag
  git describe --long | sed 's/^xf86.input.evdev.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  patch -p1 < $srcdir/surfacepen3.patch
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"

}
