# Maintainer: FireZ <firez199984@gmail.com>
# Contributor: Det <nimetonmaili g-mail>
# Based on Det's xf86-input-evdev-git

# This package fix the buttons on the Surface Pen 3 (except the OneNote button which based on bluetooth)

_pkgname=xf86-input-evdev
pkgname=$_pkgname-git-surfacepen3
pkgver=2.10.1.3.r663.g7b0a65d
pkgrel=1
pkgdesc="X.org evdev input driver - Git version (with the patch for Surface Pen 3)"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/driver/$_pkgname/"
license=('custom')
groups=('xorg' 'xorg-drivers')
depends=('glibc' 'systemd-tools' 'mtdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto' 'git' 'libevdev')
provides=("$_pkgname=$pkgver" 'xf86-input-driver')
conflicts=('xorg-server<1.18.0' 'X-ABI-XINPUT_VERSION<22' "$_pkgname")
options=('!libtool' '!makeflags')
source=("git://anongit.freedesktop.org/xorg/driver/$_pkgname"
        'surfacepen3.patch')
md5sums=('SKIP'
         'ddb5ab63cdb436b1fbc0f94b1f4ebb3c')

pkgver() {
  cd $_pkgname

  echo $(git describe --long | cut -d "-" -f4-5 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f6)
}

build() {
  cd $_pkgname

  patch -p1 < ${srcdir}/surfacepen3.patch

  msg2 "Starting autogen.sh..."
  ./autogen.sh --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd $_pkgname

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
