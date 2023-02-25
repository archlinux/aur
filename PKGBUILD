# Maintainer: lapinot <lapinot@sbi.re>
pkgname=lldap-git
pkgver=0.4.1.r80.g98acd68
pkgrel=1
pkgdesc="Light LDAP implementation"
arch=('x86_64')
url="https://github.com/nitnelave/lldap"
license=('GPL3')
depends=()
makedepends=('findutils' 'curl' 'git' 'rust' 'rollup' 'wasm-pack')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  xargs curl --remote-name-all --output-dir app/static/fonts < app/static/fonts/fonts.txt
  xargs curl --remote-name-all --output-dir app/static < app/static/libraries.txt
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release -p lldap

  cd app
  wasm-pack build --target web
  rollup ./main.js --format iife --file ./pkg/bundle.js --globals bootstrap:bootstrap
}

check() {
  cd "$srcdir/$pkgname"
  cargo test --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 -t "$pkgdir/usr/bin/" target/release/lldap

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -Dm644 app/index_local.html "$pkgdir/var/lib/lldap/www/index.html"
  install -Dm644 -t "$pkgdir/var/lib/lldap/www/static" app/static/{fonts.css,spinner.gif,style.css}
  install -Dm644 -t "$pkgdir/var/lib/lldap/www/static/fonts" app/static/fonts/*.woff2
  install -Dm644 -t "$pkgdir/var/lib/lldap/www/pkg" app/pkg/*

  install -Dm644 lldap_config.docker_template.toml "$pkgdir/var/lib/lldap/example_config.toml" 
}
