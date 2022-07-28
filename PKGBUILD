# Contributor: prg <prg-archlinux@xannode.com>
# Maintainer: prg <prg-archlinux@xannode.com>

# Based on existing debootstrap and debootstrap-git packages
# Thank you to those contributors.

pkgname=debootstrap-devuan-git
pkgver=1.0.126+nmu1devuan1.r0.gf8c417b
pkgrel=1
pkgdesc="Bootstrap a basic Debian-derived devuan system"
arch=('any')
license=('GPL')
url="https://git.devuan.org/devuan/debootstrap"
conflicts=('debootstrap')
replaces=('debootstrap')
depends=('perl' 'wget' 'binutils')
source=(git+https://git.devuan.org/devuan/debootstrap.git
        arch-detect.patch)
optdepends=('gnupg: check release signatures'
            'debian-archive-keyring: check release signatures for Debian'
            'debian-ports-archive-keyring: check release signatures for Debian Ports'
            'ubuntu-keyring: check release signatures for Ubuntu')
sha256sums=('SKIP'
	'2e37df02dbcdeeea3cc6dd440efaf28c9d03c45c357b6a170c3fa3b662e2b881')

pkgver() {
  cd debootstrap
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's|devuan/||'
}

prepare() {
  cd debootstrap

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect Architecture
  patch -p1 -i ../arch-detect.patch
}

package() {
  cd debootstrap
  make DESTDIR="$pkgdir" install

  install -Dm644 debootstrap.8 "$pkgdir"/usr/share/man/man8/debootstrap.8
}
