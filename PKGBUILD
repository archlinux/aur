# Maintainer: Hannes Körber <hannes@hkoerber.de>
pkgname='grm-git'
pkgver=0.7.21.r1.gfcd315b
pkgrel=1
pkgdesc='Manage git repos, worktrees and integrate with GitHub and GitLab'
arch=('x86_64')
url='https://github.com/hakoerber/git-repo-manager'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libgit2' 'curl' 'openssl')
makedepends=('cargo' 'git')
provides=('grm')
conflicts=('grm')
source=("${pkgname}::git+https://github.com/hakoerber/git-repo-manager#branch=develop")
sha256sums=('SKIP')
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto !debug)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export GRM_RELEASE_VERSION="${pkgver}"
  cargo build --frozen --release
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname/-git}"
}
