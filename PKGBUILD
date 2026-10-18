# Maintainer: stevedefacto (https://aur.archlinux.org/account/stevedefacto)
pkgname=enclavedns
pkgver=0.1.4
pkgrel=1
pkgdesc="EnclaveDNS client: DNS through EnclaveDNS (DNSSEC validated in an attested enclave), and .eth sites in the browser"
arch=('x86_64' 'aarch64')
url="https://github.com/EnclaveHost/enclavedns-client"
license=('LicenseRef-Enclave-Source-Available')
depends=('gcc-libs' 'glibc' 'ca-certificates' 'p11-kit' 'nss')
makedepends=('cargo')
optdepends=('kubo: open .eth sites on IPFS'
            'tor: open .eth sites that are Tor onion services'
            'networkmanager: handled by `enclavedns enable`')
backup=('etc/enclavedns/config.toml')
install=enclavedns.install
# ring's C code built with makepkg's -flto is GCC bytecode the Rust linker cannot read
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55b6c58dee04335da8bd1b862735903dd1b7fcb6b21a11a8890462423f8841b1')

prepare() {
  cd "enclavedns-client-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "enclavedns-client-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p enclavedns
}

check() {
  cd "enclavedns-client-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release -p enclavedns-core
}

package() {
  cd "enclavedns-client-$pkgver"
  install -Dm755 target/release/enclavedns "$pkgdir/usr/bin/enclavedns"
  install -Dm644 packaging/linux/enclavedns.service "$pkgdir/usr/lib/systemd/system/enclavedns.service"
  install -Dm644 packaging/linux/enclavedns-watchdog.service "$pkgdir/usr/lib/systemd/system/enclavedns-watchdog.service"
  install -Dm644 packaging/linux/enclavedns-watchdog.timer "$pkgdir/usr/lib/systemd/system/enclavedns-watchdog.timer"
  install -Dm644 packaging/linux/enclavedns.sysusers "$pkgdir/usr/lib/sysusers.d/enclavedns.conf"
  install -Dm644 packaging/linux/config.toml "$pkgdir/etc/enclavedns/config.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
