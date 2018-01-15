# Maintainer: Tom Nguyen <tom81094@gmail.com>
# Contributor: lyoko

pkgname=networkmanager-ssh-git
pkgver=r233.fe3dc5d
pkgrel=1
pkgdesc="SSH VPN support for NetworkManager"
arch=('any')
url="https://github.com/danfruehauf/NetworkManager-ssh"
license=('GPL2')
depends=('networkmanager>=1.1.0'
	 'libnm-glib>=1.1.0'
	 'nm-connection-editor')
optdepends=()
options=()
makedepends=('git' 'make' 'gcc' 'autoconf' 'intltool')
provides=('networkmanager-ssh')

source=($pkgname::'git://github.com/danfruehauf/NetworkManager-ssh.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  if [ ! -f configure ]; then
    autoreconf -fvi
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-static \
    --disable-dependency-tracking \
    --enable-more-warnings=no

  make ${MAKEFLAGS}
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" INSTALL="install -p" CP="cp -p" install
}
