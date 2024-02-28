# Maintainer: lapinot
pkgname=lldap-git
pkgver=0.5.0.r101.g3d8aafa
pkgrel=2
pkgdesc="Light LDAP Daemon"
arch=('x86_64')
url="https://github.com/lldap/lldap"
license=('GPL3')
conflicts=('lldap')
provides=('lldap')
backup=('etc/lldap.toml')
depends=('glibc' 'gcc-libs')
makedepends=('curl' 'findutils' 'git' 'gzip' 'rust' 'rust-wasm' 'cargo' 'wasm-pack')
source=("$pkgname::git+$url" 'lldap-git.toml' 'lldap-git.service' 'lldap-git-sysusers.conf' 'lldap-git-tmpfiles.conf')
sha256sums=('SKIP'
            'd0071b3707e80d910481f9c16b4da086cbb658ec1984e0ee8d1643b6c31b677d'
            'e8bf0ff25f6049d50cc881a9797f452912a22167879a1bab8edf9930e8b523b2'
            'b64c1bb4cdb4f8ebef439163e83b4ba0dc8d96649d7c545dc0739a3621fdb99c'
            'd8d054ebd88b78447519346933d3b191a499e18f3eba370533c959716d96923c')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  xargs curl --remote-name-all --output-dir app/static/fonts < app/static/fonts/fonts.txt
  xargs curl --remote-name-all --output-dir app/static < app/static/libraries.txt
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo build --offline --release --all-features -p lldap -p lldap_migration_tool -p lldap_set_password
  ./app/build.sh
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo test --offline --all-features
}

package() {
  install -Dm644 lldap-git-sysusers.conf "$pkgdir/usr/lib/sysusers.d/lldap.conf"
  install -Dm644 lldap-git-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/lldap.conf"
  install -Dm644 lldap-git.service "$pkgdir/usr/lib/systemd/system/lldap.service"
  install -Dm644 lldap-git.toml "$pkgdir/etc/lldap.toml"

  cd "$pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" target/release/{lldap,lldap_migration_tool,lldap_set_password}
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/lldap" README.md CHANGELOG.md
  mkdir -p "$pkgdir/usr/share/doc/lldap/docs"
  mkdir -p "$pkgdir/usr/share/doc/lldap/example_configs"
  cp -r docs "$pkgdir/usr/share/doc/lldap/docs"
  cp -r example_configs "$pkgdir/usr/share/doc/lldap/example_configs"
  install -Dm644 app/index_local.html "$pkgdir/usr/share/lldap/app/index.html"
  install -Dm644 -t "$pkgdir/usr/share/lldap/app/static" app/static/*.{css,js,gif}
  install -Dm644 -t "$pkgdir/usr/share/lldap/app/static/fonts" app/static/fonts/*.woff2
  install -Dm644 -t "$pkgdir/usr/share/lldap/app/pkg" app/pkg/*
}
