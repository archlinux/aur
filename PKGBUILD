# Maintainer: tarball <bootctl@gmail.com>

pkgname=letmein
pkgver=8.0.0
pkgrel=1
pkgdesc='Authenticating port knocker'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/mbuesch/letmein'
license=(Apache-2.0 MIT)
makedepends=(cargo)
depends=(glibc gcc-libs nftables)
install=$pkgname.install
backup=(etc/letmein.conf etc/letmeind.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('388bd0c189d0033606a1e01afbbf551048f745d21f9c1bbfa1bc7ced58ad07e0')

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $pkgname-$pkgname-$pkgver
  cargo build --release --locked
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $pkgname-$pkgname-$pkgver
  cargo test --locked
}

package() {
  cd $pkgname-$pkgname-$pkgver

  install -Dm755 -t "$pkgdir/usr/bin/" \
    target/release/letmein{,d,fwd}

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md CONFIGURATION.md nftables.conf

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
    LICENSE-{APACHE,MIT}

  install -Dm644 -t "$pkgdir/etc/" letmein/letmein.conf
  install -Dm640 -t "$pkgdir/etc/" letmeind/letmeind.conf

  local _systemd=(
    letmeind/letmeind.{service,socket}
    letmeinfwd/letmeinfwd.{service,socket}
  )

  sed -i 's:/opt/letmein:/usr:g' "${_systemd[@]}"

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
    "${_systemd[@]}"
}
