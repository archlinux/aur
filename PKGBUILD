# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# Builds kobe from the latest `main`. pkgver() derives the version from git,
# so this tracks unreleased/dev code — rebuild to update. The CLI lives in the
# `kobectl` workspace crate and installs as the `kobe` binary.
pkgname=kobe-git
pkgver=0.42.1.r421.g93ec1b0
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters (latest git main)'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('kobe')
conflicts=('kobe')
options=('!lto')
source=("kobe::git+https://github.com/kunobi-ninja/kobe.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kobe"
  printf '%s.r%s.g%s' \
    "$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo 0.0.0)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/kobe"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/kobe"
  CARGO_TARGET_DIR=target cargo build --frozen --release -p kobectl
}

package() {
  cd "$srcdir/kobe"
  install -Dm0755 target/release/kobe "$pkgdir/usr/bin/kobe"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
