# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: arti.zirk <arti.zirk@gmail.com>

pkgname=debootstrap-git
pkgver=1.0.114.r0.g67a3c1c
pkgrel=1
pkgdesc="Bootstrap a basic Debian system"
conflicts=('debootstrap')
provides=('debootstrap')
arch=('any')
license=('GPL')
url="https://tracker.debian.org/pkg/debootstrap"
depends=('wget' 'binutils')
makedepends=('git')
source=("$pkgname::git+https://salsa.debian.org/installer-team/debootstrap.git"
        arch-detect.patch)
optdepends=('gnupg: check release signatures'
            'debian-archive-keyring: check release signatures for Debian'
            'ubuntu-keyring: check release signatures for Ubuntu')
sha512sums=('SKIP'
            '56e25f48027f99f7e720859a9e14fe769b1cbd6227c7a7e27e14c2fea88520109342d6e5b127dc34ce8cc40f46941a0c5157ad35cf8ef9b3e4323877a4b32d97')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect Architecture
  patch -p1 -i ../arch-detect.patch
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dm644 debootstrap.8 "$pkgdir"/usr/share/man/man8/debootstrap.8
}
