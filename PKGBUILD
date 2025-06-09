# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-git
_pkgname=mpdris
pkgver=1.2.0.r32.g725f550
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- git version'
url='https://github.com/jasger9000/mpDris'
license=('MIT')
arch=('any')
provides=("mpdris=${pkgver}")
conflicts=('mpdris')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=('libsystemd: run mpdris as a service')
source=("${_pkgname}::git+${url}.git"
        "mpdris.service")
sha256sums=('SKIP'
            '29fb19d923984a0d58edf647be99f916d82c37b04e58abb40f793517c8e0a903')
options=(!lto)

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  depends+=('dbus' 'mpd')
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/mpdris" "$pkgdir/usr/bin/mpdris"
  install -Dm644 "$startdir/mpdris.service" "$pkgdir/usr/lib/systemd/user/mpdris.service"
  install -Dm644 "resources/sample.mpdris.conf" "$pkgdir/usr/share/doc/${_pkgname}/sample.mpdris.conf"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sts=2 sw=2 et: syntax=sh
