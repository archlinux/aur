# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=monero-vanity-git
_pkgname=monero-vanity
pkgver=v0.6.0.r0.gdb90d31
pkgrel=2
pkgdesc='Monero Vanity Address Generator GUI/CLI'
url='https://github.com/hinto-janai/monero-vanity'
arch=('x86_64')
license=('custom')
makedepends=('git' 'rust' 'cargo')
conflicts=('monero-vanity-bin' 'monero-vanity')
provides=('monero-vanity')
source=("git+$url.git"
        "monero-vanity.desktop")
sha512sums=('SKIP'
            '978594ecf63f305b2162ce0316b8a783dfb0e161dad4fbfaac7425ef0346b55e772defa53eb112f5af99979db22c4082c9b70f0e6766df46330422aa9e2c2884')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname/external
  rm -rf *
  git clone https://github.com/hinto-janai/curve25519-dalek
  git clone https://github.com/hinto-janai/monero-rs
} 

build() {
  cd $_pkgname
  RUSTFLAGS="-C target-cpu=native" cargo build --release
} 

package() {
  install -Dm755 "${srcdir}/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "${srcdir}/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "${srcdir}/$_pkgname/images/icon.png" "$pkgdir/usr/share/pixmaps/monero-vanity.png"
  install -Dm644 "${srcdir}/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
