# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=miniaturo-git
_name=miniaturo
_binname=raw-thumbnailer
pkgver=r8.5296a44
pkgrel=1
pkgdesc="A raw image thumbnailer. Drop-in replacement for raw-thumbnailer."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dbrgn/miniaturo"
license=('GPL3')
depends=('libopenraw')
makedepends=('git' 'rust' 'cargo')
optdepends=('raw-thumbnailer-entry: Thumbnailer configs for Nautilus/Thunar')
provides=('raw-thumbnailer')
conflicts=('raw-thumbnailer')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/miniaturo')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name" || exit 1

  # Patch version
  sed -i 's/^version = "\(.*\)"/version = "\1-aur-'${pkgver}'"/' Cargo.toml

  # Build a release build
  cargo build --release
}

package() {
  cd "$srcdir/$_name" || exit 1

  # Install binary
  install -D -o root -g root -m 755 target/release/${_name} "$pkgdir/usr/bin/${_binname}"
}

pkgver() {
  cd "$srcdir/$_name" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
