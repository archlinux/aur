# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=pds-gatekeeper-git
pkgver=r18.2e39f1e
pkgrel=7
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
        'pds-gatekeeper.env'
        'gatekeeper-data-directory.patch')
b2sums=('SKIP'
        '4876ae2e7f31cc7091f4a7e42d92732f995516d384546041f1315baca8d677e778377f5abbc33fbcbd9ef5a39179ebfc4579591f233c02ee9b41632f35d413c4'
        '1ba5239a968d87a40adee3ffce34d30492fd674311374c52ef8141a5329000978c9cbc37ce6de461a59d4693e13f0c336f3b6cd8145266d908ff7fb257fea1d0'
        '9b50a4c084f8a46217a925775c37d3a4e7d103c7aeebd486a0e0cc6e92266f926afc543e13d6bd74228773a833c93deb729a0afa2d9968d3e661cccfd54a068b'
        'f3412766407c581071e00199163293b97df3c01f7d07fe5d55c8e681ad0975ead5d01f6e36d5ea8db4fbc2aae8ed0484808216eb6d30c6e02063f53d28aa96f4'
        '1b41c1351d4433d3e9065de2aa3e56c5ec3042db2685d5fe8f4fa28ace6e159e76e188dad0840c9c85e431b47ca13a7197e1fc2ce924c39071cb861c9da17e3c')

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

  install -Dm0755 "target/release/pds_gatekeeper" "$pkgdir/usr/bin/pds-gatekeeper"

  install -Dm0644 "$srcdir/pds-gatekeeper.service" "$pkgdir/usr/lib/systemd/system/pds-gatekeeper.service"
  install -Dm0644 "$srcdir/pds-gatekeeper.sysusers" "$pkgdir/usr/lib/sysusers.d/pds-gatekeeper.conf"
  install -Dm0644 "$srcdir/pds-gatekeeper.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/pds-gatekeeper.conf"
  install -Dm0644 "$srcdir/pds-gatekeeper.env" "$pkgdir/etc/pds-gatekeeper.env"

  install -Dm0644 email_templates/* -t "$pkgdir/usr/share/pds-gatekeeper/email_templates"

  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
