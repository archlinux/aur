# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=5
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
        'pds-gatekeeper.env'
        'gatekeeper-data-directory.patch')
b2sums=('SKIP'
        '4876ae2e7f31cc7091f4a7e42d92732f995516d384546041f1315baca8d677e778377f5abbc33fbcbd9ef5a39179ebfc4579591f233c02ee9b41632f35d413c4'
        '1ba5239a968d87a40adee3ffce34d30492fd674311374c52ef8141a5329000978c9cbc37ce6de461a59d4693e13f0c336f3b6cd8145266d908ff7fb257fea1d0'
        'f3412766407c581071e00199163293b97df3c01f7d07fe5d55c8e681ad0975ead5d01f6e36d5ea8db4fbc2aae8ed0484808216eb6d30c6e02063f53d28aa96f4'
        'e6dd99f4501b80fdf62d1b7be53dc05cbdd89cbaeba231866d6c27adcab82d6f581669010978f2115577684fcc62189bda36a489ba1b8ace0344d4c9d8efef49')

pkgver() {
  cd "$srcdir/pds-gatekeeper"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/pds-gatekeeper"

  patch -Np1 -i "$srcdir/gatekeeper-data-directory.patch"

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
