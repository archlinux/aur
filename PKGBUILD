# Maintainer: Det <nimetonmaili g-mail>
# Contributor: <Eugeny Borisov flekst@gmail.com>
# Based on [extra]'s xf86-input-evdev: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xf86-input-evdev

_pkgname=xf86-input-evdev
pkgname=$_pkgname-git
pkgver=2.9.1.6.r644.gb370ccd
pkgrel=1
pkgdesc="X.org evdev input driver - Git version"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xorg/driver/$_pkgname/"
license=('custom')
groups=('xorg' 'xorg-drivers')
depends=('glibc' 'systemd-tools' 'mtdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto' 'git' 'libevdev')
provides=("$_pkgname=$pkgver")
conflicts=('xorg-server<1.16.0' 'X-ABI-XINPUT_VERSION!=21' "$_pkgname")
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
