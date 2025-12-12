# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=1
pkgdesc="Microservice to bring 2FA to self hosted PDSes"
arch=('x86_64')
url="https://tangled.org/baileytownsend.dev/pds-gatekeeper"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('atproto-pds: PDS environment file at /etc/pds.env')
options=('!lto') # LTO causes build failures for sqlx
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
backup=('etc/pds-gatekeeper.env')
install='pds-gatekeeper.install'
source=("git+https://tangled.org/baileytownsend.dev/pds-gatekeeper.git"
        'pds-gatekeeper.service'
        'pds-gatekeeper.sysusers'
        'pds-gatekeeper.tmpfiles'
        'pds-gatekeeper.env')
b2sums=('SKIP'
        '76dd8bf42db0e4bd9c497df36f091fbd5ef26b5df8b99ee1736142abefd019cd65ce756380d81aa0c35234e5670f3570c388f0eba69f348bc069240715809fc8'
        '7ad0ff18a07f95db8d7af27c037e8e98abaa74f0ce4aac1537024e034d0587816f41bf653e9042e65789933b600058c1871fac8ad462bc11f641029fce20b0e0'
        '0205b10c145ad9473bc933a9603eaf7c91399f88649925d2049b234c54e9be7f716880206bfacc067e040ac567ab37597b0fb3b50a33894462a6314f7aa1f776'
        '3ff6343038a551089df28a19cd945f0dd8bf7e2b2ced52f176f529d0658288de923578f0898878467eab407478c8775a25d379707476d1d88ced19dc25a2df6e')

pkgver() {
  cd "$srcdir/pds-gatekeeper"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/pds-gatekeeper"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/pds-gatekeeper"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/pds-gatekeeper"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/pds-gatekeeper"

  # Install binary
  install -Dm0755 "target/release/pds_gatekeeper" "$pkgdir/usr/bin/pds-gatekeeper"

  # Install systemd service
  install -Dm0644 "$srcdir/pds-gatekeeper.service" "$pkgdir/usr/lib/systemd/system/pds-gatekeeper.service"

  # Install sysusers and tmpfiles
  install -Dm0644 "$srcdir/pds-gatekeeper.sysusers" "$pkgdir/usr/lib/sysusers.d/pds-gatekeeper.conf"
  install -Dm0644 "$srcdir/pds-gatekeeper.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/pds-gatekeeper.conf"

  # Install environment file
  install -Dm0644 "$srcdir/pds-gatekeeper.env" "$pkgdir/etc/pds-gatekeeper.env"

  # Install license
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
