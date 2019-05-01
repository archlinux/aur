# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgname=onedrive
pkgname=$_pkgname-abraunegg-git
pkgver=2.3.3.r4.gfbad4b4
pkgrel=2
epoch=1
pkgdesc="Free OneDrive client written in D - abraunegg's fork"
arch=('i686' 'x86_64')
url='https://github.com/abraunegg/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite' 'libnotify')
makedepends=('dmd' 'git')
provides=("onedrive=$pkgver")
conflicts=('onedrive')
source=('git+https://github.com/abraunegg/onedrive.git')
sha256sums=('SKIP')

prepare() {
  sed -i 's/std\.c\./core.stdc./g' $_pkgname/src/sqlite.d
}

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  ./configure --enable-notifications --enable-completions --prefix=/usr --sysconfdir=/etc
  make COMPLETIONS=1 NOTIFICATIONS=1 PREFIX=/usr
}

package() {
  make COMPLETIONS=1 NOTIFICATIONS=1 PREFIX=/usr DESTDIR="$pkgdir" -C $_pkgname install
  install -Dm644 $_pkgname/config "$pkgdir/usr/share/onedrive/config.default"
}
