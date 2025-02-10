# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-git
_pkgname=mpdris
pkgver=1.1.1.r0.g9c9f8ee
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- git version'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('any')
provides=("mpdris=${pkgver}")
conflicts=('mpdris' 'mpdris-bin')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=('libsystemd: run mpdris as a service')
source=("${_pkgname}::git+${url}.git"
    "mpdris.service")
sha256sums=('SKIP'
    '29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --locked
}

package() {
  depends+=('dbus' 'mpd')
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "$startdir/mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
