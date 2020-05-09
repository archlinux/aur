# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: <Eugeny Borisov flekst@gmail.com>
# Based on [extra]'s xf86-input-evdev: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xf86-input-evdev

_pkgname=xf86-input-evdev
pkgname=$_pkgname-git
pkgver=2.10.6.2.r685.g7103611
pkgrel=1
pkgdesc="X.org evdev input driver - Git version"
arch=('x86_64')
url="https://cgit.freedesktop.org/xorg/driver/$_pkgname/"
license=('custom')
groups=('xorg' 'xorg-drivers')
depends=('glibc' 'systemd' 'mtdev')
makedepends=('xorg-server-devel' 'xorgproto-git' 'git' 'libevdev')
provides=("$_pkgname=$pkgver" 'xf86-input-driver')
conflicts=('xorg-server<1.18.0' 'X-ABI-XINPUT_VERSION<22' "$_pkgname")
options=('!libtool' '!makeflags')
source=("git://anongit.freedesktop.org/xorg/driver/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git describe --long | cut -d "-" -f4-5 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f6)
}

build() {
  cd $_pkgname

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
