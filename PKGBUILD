# Maintainer: Benjamin Demetz <demetzbenjamin23@gmail.com>

pkgname=tooka-git
pkgver=1.0.4
pkgrel=1
pkgdesc="A rule-based automatic file sorter"
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url="https://github.com/tooka-org/tooka"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'jq')
provides=('tooka')
conflicts=('tooka-cli' 'tooka')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  # Fetch latest release tag from GitHub API
  local latest_tag
  latest_tag=$(curl -s "https://api.github.com/repos/tooka-org/tooka/releases/latest" | jq -r .tag_name)

  if [[ -n "$latest_tag" && "$latest_tag" != "null" ]]; then
    # Strip leading 'v' if present
    latest_tag="${latest_tag#v}"
    echo "$latest_tag"
  else
    # Fallback: count commits on main branch locally
    cd "$srcdir/$pkgname"
    git fetch origin main --quiet
    echo "r$(git rev-list --count origin/main).$(git rev-parse --short=7 HEAD)"
  fi
}


prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}


package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tooka"
}
