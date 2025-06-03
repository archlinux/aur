# Maintainer: Jason Pena <jasonpena@awkless.com>

pkgname="ocd-git"
pkgver=0.8.0.r0.ga553a48
pkgrel=1
pkgdesc="Organize current dotfiles"
url="https://github.com/awkless/ocd"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=("MIT")
makedepends=('cargo' 'git')
depends=('gcc-libs' 'openssl' 'libssh2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("ocd"::"git+$url.git")
provides=("ocd=${pkgver%%.g*}")
options=(!lto)
b2sums=('SKIP')

pkgver() {
  cd ocd
  git describe --long --tags --abbrev=7 --exclude='*[A-Za-z][A-Za-z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ocd
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ocd
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd ocd
  export RUSTUP_TOOLCHAIN=stable
  cargo test
}

package() {
  cd ocd
  install -Dm755 "target/release/ocd" "$pkgdir/usr/bin/ocd"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  mkdir -p "$pkgdir/usr/share/man/man1"
  install -Dm644 "docs/ocd.1" "$pkgdir/usr/share/man/man1/ocd.1"
  install -Dm644 "docs/ocd-init.1" "$pkgdir/usr/share/man/man1/ocd-init.1"
  install -Dm644 "docs/ocd-clone.1" "$pkgdir/usr/share/man/man1/ocd-clone.1"
  install -Dm644 "docs/ocd-deploy.1" "$pkgdir/usr/share/man/man1/ocd-deploy.1"
  install -Dm644 "docs/ocd-undeploy.1" "$pkgdir/usr/share/man/man1/ocd-undeploy.1"
  install -Dm644 "docs/ocd-ls.1" "$pkgdir/usr/share/man/man1/ocd-ls.1"
  install -Dm644 "docs/ocd-rm.1" "$pkgdir/usr/share/man/man1/ocd-rm.1"
}
