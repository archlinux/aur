# Maintainer: forivall <forivall@gmail.com>

_pkgname=logitech-g710-kmod
pkgname=${_pkgname}-git
pkgver=20130512
pkgrel=1
pkgdesc="Linux kernel module to allow use of extra keys on the Logitech g710+ (logitech-g710-linux-driver)"
arch=('i686' 'x86_64')
url="http://github.com/Wattos/logitech-g710-linux-driver"
license=('GPL2')
makedepends=('git' 'linux-headers')
provides=('logitech-g710')
conflicts=('logitech-g710')
install='logitech-g710-kmod.install'

_gitroot=git://github.com/Wattos/logitech-g710-linux-driver.git
_gitname=logitech-g710-linux-driver

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/${_gitname}-build"
  git clone "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"
  cd "$srcdir/${_gitname}-build"

  make
}

package() {
  cd "$srcdir/${_gitname}-build/"
  mkdir -p "$pkgdir/lib/modules/$(uname -r)/extramodules/"
  install -D src/kernel/hid-lg-g710-plus.ko "$pkgdir/lib/modules/$(uname -r)/extramodules/"

  mkdir -p "$pkgdir/etc/udev/rules.d/"
  cp misc/90-logitech-g710-plus.rules "$pkgdir/etc/udev/rules.d/"

  mkdir -p "$pkgdir/usr/share/logitech-g710/"
  cp misc/.Xmodmap "$pkgdir/usr/share/logitech-g710/"
}

# vim:set ts=2 sw=2 et:
