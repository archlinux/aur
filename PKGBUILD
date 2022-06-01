# Maintainer: Tun Win Naing <tunwn.mdy at gmail dot com>
pkgname=ozbe-pocket-cli-git
_name=pocket-cli
_binname=pocket
pkgver=r21.42164f8
pkgrel=1
pkgdesc="Command-line interface to interact with Pocket API (Rust)"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ozbe/pocket-cli"
license=('MIT' 'Apache')
depends=('openssl' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('pocket')
# conflicts=('')
options=(!emptydirs)
source=('git+https://github.com/ozbe/pocket-cli')
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
  install -D -o root -g root -m 755 target/release/pocket "$pkgdir/usr/bin/${_binname}"

  # Install MIT license
  install -Dm 644 "${srcdir}/${_name}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

pkgver() {
  cd "$srcdir/$_name" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
