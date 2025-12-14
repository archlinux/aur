# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=8
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
        'pds-gatekeeper.tmpfiles'
        'pds-gatekeeper.env')
b2sums=('SKIP'
        '92e665b58eb4f0382dca2020daaa783aa23e47b7dfabb13465294488c3453a2e519cc4353a8204be67a85b3bdf13f1f183873ee84c2f39d86f901d6c18c5fb0e'
        'ef81480e060073e44e633f23199108cf3a560d397619e1252f26354cb16d05d6978a25fbe323748ec4191f3d9140c6d02b606e82c6904272c39c6669aecb41c8'
        '020162305da622e63e3a32c206907215bfd601f8afd37b789bec8cd37121d58a379b3453f6cd39621be2ca695fbc4eccd67a790be3d5f91d8e0b231c57362da4'
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

  install -Dm0755 "target/release/pds_gatekeeper" "$pkgdir/usr/bin/pds-gatekeeper"

  install -Dm0644 "$srcdir/pds-gatekeeper.service" "$pkgdir/usr/lib/systemd/system/pds-gatekeeper.service"
  install -Dm0644 "$srcdir/pds-gatekeeper.sysusers" "$pkgdir/usr/lib/sysusers.d/pds-gatekeeper.conf"
  install -Dm0644 "$srcdir/pds-gatekeeper.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/pds-gatekeeper.conf"
  install -Dm0644 "$srcdir/pds-gatekeeper.env" "$pkgdir/etc/pds-gatekeeper.env"

  install -Dm0644 email_templates/* -t "$pkgdir/usr/share/pds-gatekeeper/email_templates"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
