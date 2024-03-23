# Maintainer: Giovanni Harting

pkgname=asus-numpad
pkgver=0.4.1
pkgrel=7
pkgdesc='Linux daemon for Asus laptops to activate numpad on touchpad'
arch=(x86_64)
url='https://github.com/iamkroot/asus-numpad'
license=(MIT)
depends=(libevdev gcc-libs glibc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$url/commit/702141b3752bd38abf82215e74f255fffc1a6266.patch"
        $pkgname.{sysusers,service,rules,modules})
b2sums=('74bd538beb97f8455f2b6dd059bd43d6638b7db58f102d7e0e9a03455c5e80bc1be41537197fb523ad78a15314fc90904a0d5cbe635f602b9aa9e7c169eab924'
        'f0eb246a1b80566ea6faca8b9fb2977f7adb273a8bcef1f4a1fce3488b80d4ead55da41ba27993153c8aa792b69839f90ed514552b73e3ecc0b6458b0f467d97'
        '8c7ab593e3626237abad9bbf9ee37939ab6258722291d82713281d1bae714c13d09e50e4bcffe5d5893911cb20b698ee07e1f6313559741a3a36070e80289cf1'
        '10e6cd26a818c7bafdc2bc9b8b2bb263eb42c98044bc396a495b297586ccbf11f7f5392ffea718f4ae238bafcc47edd212e6f4aca21792a918e40945241bc2c5'
        'c3656778241ac205cfe73c59c91a4a588b245c58ecadd8c3e147c8c0cd4fd401007b9c5c69897555e11c5af1d57d5412b02fabcaeadaadd0a89acb70b04384bc'
        'ff669b533f2911f39160e33bc958f7ea471f2efb29d1cafae281fbd81d7ff97b198598734991d3894ce5f848e1857293f76e39693a08a12fc23ec622a1e2a7bb')

prepare() {
  cd $pkgname-$pkgver

  # use stable rust toolchain
  patch -p1 < ../702141b3752bd38abf82215e74f255fffc1a6266.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/target/release/$pkgname"

  # license
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # configs
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 $pkgname.rules "$pkgdir/usr/lib/udev/rules.d/99-$pkgname.rules"
  install -Dm644 $pkgname.modules "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
