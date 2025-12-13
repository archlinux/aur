# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=4
pkgdesc="Microservice to bring 2FA to self hosted AT Protocol PDSes"
arch=('x86_64')
url="https://tangled.org/baileytownsend.dev/pds-gatekeeper"
license=('MIT')
depends=('gcc-libs' 'glibc' 'atproto-pds')
makedepends=('cargo' 'git')
options=('!lto') # LTO causes build failures for sqlx
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
backup=('etc/pds-gatekeeper.env')
source=("git+https://tangled.org/baileytownsend.dev/pds-gatekeeper.git"
        'pds-gatekeeper.service'
        'pds-gatekeeper.sysusers'
        'pds-gatekeeper.env')
b2sums=('SKIP'
        '1c049e8b81c081cf2b0a27cc5aeac042bf2f48de60eeffe292655c42d95f230c93d67a9e879c19fbb75f13c76c9f05851c0c776eed046d21004c2ee799b36377'
        '881412b13dc22f6c05b11634ba4b728b4e080e9a6a58e17e212063f91072ca370661f7b97fbf61219b522a49774e7cac26731e27ede5864ef8172908e5401bde'
        'cf188c11ab976a7a54f77eab17cac6206ac95779429e227a44358249b33375e6e0e7f07bdbeb1f2579ce7f1120cc5158eb0e0dae8a82ed3167706dc86e4cea17')

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

  # Install sysusers
  install -Dm0644 "$srcdir/pds-gatekeeper.sysusers" "$pkgdir/usr/lib/sysusers.d/pds-gatekeeper.conf"

  # Install environment file
  install -Dm0644 "$srcdir/pds-gatekeeper.env" "$pkgdir/etc/pds-gatekeeper.env"

  # Install email templates
  install -Dm0644 email_templates/* -t "$pkgdir/usr/share/pds-gatekeeper/email_templates"

  # Install license
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
