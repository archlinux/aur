pkgname=ssmcp-git
pkgver=0.1.0.r3.g3d5e2d3
pkgrel=1
pkgdesc='Expose a local terminal as MCP through an SSH public-key connection'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/ssmcp'
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssh')
makedepends=('git' 'rust' 'cargo')
provides=('ssmcp')
conflicts=('ssmcp')
backup=('etc/ssmcpd/ssmcpd.env')
source=('ssmcp::git+https://github.com/LIghtJUNction/ssmcp.git')
sha256sums=('SKIP')

pkgver() {
 cd "$srcdir/ssmcp"
 printf '%s.r%s.g%s' "$(sed -n 's/^version = "\([^"]*\)"/\1/p' Cargo.toml | head -1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 cd "$srcdir/ssmcp"
 RUSTUP_TOOLCHAIN=stable cargo build --locked --release
}

check() {
 cd "$srcdir/ssmcp"
 RUSTUP_TOOLCHAIN=stable cargo test --locked
}

package() {
 cd "$srcdir/ssmcp"
 make install-server DESTDIR="$pkgdir" PREFIX=/usr
 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/ssmcp.conf" <<'SYSUSERS'
g ssmcp -
u ssmcpd -:ssmcp "SSH terminal MCP gateway" /nonexistent /usr/bin/nologin
SYSUSERS
 sed -i 's|/usr/local/bin/|/usr/bin/|g' "$pkgdir/usr/share/doc/ssmcp/examples/sshd-ssmcp.conf"
}
