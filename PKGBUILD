# Maintainer: forivall <forivall@gmail.com>

_pkgbase=hid-lg-g710-plus
_pkgname=${_pkgbase}-dkms
pkgname=${_pkgname}-git
pkgver=r19.ecd2099
pkgrel=1
pkgdesc="Linux dkms kernel module to allow use of extra keys on the Logitech g710+ (logitech-g710-linux-driver)"
arch=('i686' 'x86_64')
url="http://github.com/Wattos/logitech-g710-linux-driver"
license=('GPL2')
depends=('dkms' 'linux-headers')
makedepends=('git')
provides=('hid-lg-g710-plus')
conflicts=('logitech-g710-kmod-git' 'hid-lg-g710-plus' 'logitech-g710')
install='hid-lg-g710-plus-dkms.install'

source=("${_pkgbase}::git://github.com/Wattos/logitech-g710-linux-driver.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# build() {
#   cd "$srcdir/$_pkgbase"
#   # make
# }

package() {
  cd "$srcdir/$_pkgbase"

  local rev="$(git rev-parse --short HEAD)"

  # msg2 "Starting make install..."
  # make DESTDIR="${pkgdir}" install

  # copy dkms.conf
  # install -Dm644 src/kernel/dkms.conf "${pkgdir}/usr/src/${_pkgbase}-$pkg/dkms.conf"

  # copy sources
  msg2 "Copying sources, including dkms.conf..."
  mkdir -p "${pkgdir}/usr/src/"
  cp -r src/kernel "${pkgdir}/usr/src/${_pkgbase}-$pkgver/"

  msg2 "Copying udev rules..."
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  cp misc/90-logitech-g710-plus.rules "$pkgdir/etc/udev/rules.d/"

  msg2 "Copying .Xmodmap..."
  mkdir -p "${pkgdir}/usr/share/logitech-g710/"
  cp misc/.Xmodmap "${pkgdir}/usr/share/logitech-g710/"
}

# vim:set ts=2 sw=2 et:
