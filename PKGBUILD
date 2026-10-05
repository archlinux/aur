# shellcheck disable=SC2034,SC2154
# Maintainer: LightJunction <lightjunction@users.noreply.github.com>
pkgname=mcpmux-git
pkgver=0.1.1.r2.gd398a72
pkgrel=1
pkgdesc='Minimal authenticated MCP path gateway with HTTP and stdio upstreams'
arch=('x86_64' 'aarch64')
url='https://github.com/TokenNotIncluded/mcpmux'
license=('MIT')
optdepends=('systemd: service management and automatic service account creation')
provides=('mcpmux')
conflicts=('mcpmux')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git' 'python')
# Rust handles LTO; makepkg C LTO can produce incompatible ring objects.
options=('!lto')
source=("mcpmux::git+$url.git"
        'mcpmux.sysusers'
        'mcpmux.tmpfiles'
        'README.md'
        'configuration.md')
sha256sums=('SKIP'
            'a4984471d3c1c51e64dbc4524f800f50aa1928e405dee689e7a58b0696a71902'
            '045c17f44bfc907939decbddd25c2f8c6b7a4fd1dee85e68d2afd13ae61c49ae'
            'da705fdf39599d70c4d35e97e2b88a5794e2a5d7996d38447c6c99115072991b'
            '6cc75a040e7e9ef731ca01a8fd59a9fa4a42b44602239d4b25e308814af63dbb')

pkgver() {
  cd mcpmux || return
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mcpmux || return
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd mcpmux || return
  cargo build --release --frozen
}

check() {
  cd mcpmux || return
  cargo test --release --frozen
  python tests/e2e.py target/release/mcpmux
}

package() {
  local upstream=mcpmux
  local binary=mcpmux/target/release/mcpmux
  install -Dm755 "$binary" "$pkgdir/usr/bin/mcpmux"
  install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 configuration.md "$pkgdir/usr/share/doc/$pkgname/docs/configuration.md"
  install -Dm644 "$upstream/packaging/nginx.conf" "$pkgdir/usr/share/doc/$pkgname/nginx.conf"
  install -Dm644 "$upstream/packaging/mcpmux.service" "$pkgdir/usr/lib/systemd/system/mcpmux.service"
  sed -i 's|/usr/local/bin/mcpmux|/usr/bin/mcpmux|g' "$pkgdir/usr/lib/systemd/system/mcpmux.service"
  install -Dm644 mcpmux.sysusers "$pkgdir/usr/lib/sysusers.d/mcpmux.conf"
  install -Dm644 mcpmux.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mcpmux.conf"
}
