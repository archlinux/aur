# Maintainer: Jason Pena <jasonpena@awkless.com>

pkgname="ocd"
pkgver="0.8.0"
pkgrel=1
pkgdesc='Organize current dotfiles'
url='https://github.com/awkless/ocd'
license=(MIT)
makedepends=('cargo' 'git')
depends=('gcc-libs' 'openssl' 'libssh2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+$url#tag=v$pkgver")
options=(!lto)
b2sums=('ffdd32e3e06618b92c0fab6c408dd99ab47f2a8e0542b8110978755e488e7c8ca97b1ca2d6c40f0019f0d7f4a320b9c7cf796bbaa84a36d9ea672c2e7c0a575e')

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
  cargo test --frozen --release
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
