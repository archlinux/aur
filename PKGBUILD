# Maintainer: Vladimir Tsanev <tsachev at gmail dot com>
# libslimbook + slimbookctl, built from upstream tag 1.28.1.
pkgname=libslimbook
pkgver=1.28.1
pkgrel=1
pkgdesc="Slimbook core library, slimbookctl CLI and settings load/store service"
arch=('x86_64')
url="https://github.com/Slimbook-Team/libslimbook"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc')
makedepends=('git' 'meson')
source=("$pkgname::git+https://github.com/Slimbook-Team/libslimbook.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  # Arch has no /usr/libexec; use /usr/lib/slimbook
  sed -i 's|/usr/libexec/slimbook|/usr/lib/slimbook|' src/slimbookctl.cpp
  sed -i "s|'libexec/slimbook/'|'lib/slimbook/'|" meson.build
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # upstream installs slimbookctl setuid root; the systemd service already runs as root
  chmod 755 "$pkgdir/usr/bin/slimbookctl"

  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
