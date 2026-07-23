# Maintainer: Gurov <thuggerthugger1@duck.com>
# Contributor: Bert Peters <bertptrs@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=sudo-rs-system-names-git
_pkgname=sudo-rs
pkgver=0.2.14.r0.g65557a3
pkgrel=1
pkgdesc="Memory-safe implementation of sudo (installed under system names)"
arch=('x86_64')
url="https://github.com/trifectatechfoundation/sudo-rs"
license=('Apache-2.0 AND MIT')

depends=(
  glibc
  libgcc
  pam
)
makedepends=(
  cargo
  git
)
checkdepends=(
  procps-ng
)
optdepends=(
  'apparmor: apparmor support'
)

# Protect live configuration files from pacman overwrites
backup=('etc/sudoers')

provides=(sudo)
conflicts=(sudo)

source=("git+https://github.com/trifectatechfoundation/sudo-rs.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen --features apparmor
}

check() {
  cd "$_pkgname"
  cargo test --frozen --features apparmor
}

package() {
  cd "$_pkgname"

  # Install sudo binary with setuid (chmod 4755) and visudo
  install -Dm4755 target/release/sudo "$pkgdir/usr/bin/sudo"
  install -Dm0755 target/release/visudo "$pkgdir/usr/bin/visudo"

  # Hard link sudoedit -> sudo
  ln "$pkgdir/usr/bin/sudo" "$pkgdir/usr/bin/sudoedit"

  # Install required PAM configuration
  install -Dm0644 /dev/stdin "$pkgdir/etc/pam.d/sudo" << 'EOF'
#%PAM-1.0
auth		include		system-auth
account		include		system-auth
password	include		system-auth
session		include		system-auth
EOF

  # Licenses and docs
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" CHANGELOG.md README.md SECURITY.md

  # Man pages
  install -Dm0644 docs/man/sudo.8.man "$pkgdir/usr/share/man/man8/sudo.8"
  install -Dm0644 docs/man/sudoers.5.man "$pkgdir/usr/share/man/man5/sudoers.5"
  install -Dm0644 docs/man/visudo.8.man "$pkgdir/usr/share/man/man8/visudo.8"
  ln "$pkgdir/usr/share/man/man8/sudo.8" "$pkgdir/usr/share/man/man8/sudoedit.8"

  # Ensure sudoers drop-in directory exists (without writing empty /etc/sudoers)
  install -dm0750 "$pkgdir/etc/sudoers.d"
}

# vim:set ts=2 sw=2 et:
