# Maintainer: Vítor Ferreira <vitor.dominor@gmail.com>
pkgname=xboxdrv-stable-git
pkgver=20130227
pkgrel=1
pkgdesc="An XBox/XBox 360 gamepad driver - as alternative to the xpad-kernel module - with more configurability, runs in userspace and supports a multitude of controllers"
arch=('i686' 'x86_64')
url="http://pingus.seul.org/~grumbel/xboxdrv/"
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusbx')
makedepends=('git' 'scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
provides=('xboxdrv')
conflicts=('xboxdrv')
source=(
  'xboxdrv.service'
  'xboxdrv.conf')
md5sums=('c44dc13f6d34cd7fc61c87ecd8c3a547'
         'c73bb9cf8ff763e7c477366472d19813')

_gitroot=git://github.com/Grumbel/xboxdrv.git
_gitname=xboxdrv-stable

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --branch stable
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  
  install -D -m755 "$srcdir/xboxdrv.service" "$pkgdir/usr/lib/systemd/system/xboxdrv.service"
  install -D -m644 "$srcdir/xboxdrv.conf" "$pkgdir/etc/conf.d/xboxdrv"

}

# vim:set ts=2 sw=2 et:
