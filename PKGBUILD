# Maintainer: Hannes Körber <hannes@hkoerber.de>
pkgname='grm'
_pkgname_full='git-repo-manager'
pkgver=0.12.0
pkgrel=1
pkgdesc='Manage git repos, worktrees and integrate with GitHub and GitLab'
arch=('x86_64')
url='https://github.com/hakoerber/git-repo-manager'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libgit2' 'curl' 'openssl')
makedepends=('cargo' 'git')
source=("https://github.com/hakoerber/git-repo-manager/releases/download/v${pkgver}/source.tar.gz")
sha256sums=('SKIP')
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto !debug)

prepare() {
  cd "${_pkgname_full}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname_full}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export GRM_RELEASE_VERSION="${pkgver}"
  cargo build --frozen --release
}

check() {
  cd "${_pkgname_full}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_pkgname_full}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}
