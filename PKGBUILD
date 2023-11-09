pkgname=symbolicator
pkgver=23.10.1
pkgrel=1
pkgdesc="A sentry symbolication service for native stacktraces"
arch=('x86_64')
url="https://github.com/getsentry/symbolicator"
license=('MIT' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake')
backup=('etc/symbolicator/symbolicator.yml')
source=("git+https://github.com/getsentry/symbolicator/#tag=$pkgver"
	"symbolicator.service")
sha512sums=('SKIP'
            '7b3c5a23e71bff108ab8ca850da960b6df800d157ebabd0c76f226abf1fd43b9b2b1eca9030666de1b0daa9f4fa5d5495b2e24c0a73ec4e0d176ba5b5a5a6ead')

prepare() {
  cd "symbolicator"
  git submodule update --init
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "symbolicator"
  cargo build --release --locked
}

package() {
  cd "symbolicator"
  for f in symbolicator symbolicli symsorter wasm-split; do
    install -Dm0755 target/release/$f "$pkgdir/usr/bin/$f"
  done
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/symbolicator/LICENSE"
  install -Dm0644 "${srcdir}/symbolicator.service" "${pkgdir}/usr/lib/systemd/system/symbolicator.service"
  install -Dm0644 local.example.yml "${pkgdir}/etc/symbolicator/symbolicator.yml"
}
