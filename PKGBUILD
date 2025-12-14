# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=11
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
        '4ab76855d9856c6bc033efe38ea95cfaf6c92847f2aaf8fa8aff500fa479fc170809dbfb8068307d05c6863f72db56be53d94b2514bf3ff302dda9bf655e80af'
        '86cb9becebc3f6701306ad47f8cdbe18bc7b266d03ab9cd85cad3f26f3dd3586b0284fc2c6100229952c94ddcfa2d162f2ef1121a09b2429e9fb1e67eeeea872'
        '10b3590a847c671e46a010f4292367d47de45e09a730c00ca3ae83e99882d78990a0841aa71afb3d7d9be51b1885f315066ee4c815658f0972cfa3b01eeb88f5'
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
