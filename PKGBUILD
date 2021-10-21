# Maintainer: Paul Mulders <justinkb at gmail dot com>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=sozu
pkgver=0.13.6
pkgrel=1
pkgdesc="HTTP reverse proxy, configurable at runtime, fast and safe, built in Rust"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/sozu-proxy/sozu"
license=('GPL')
depends=('openssl>=1.0.1')
makedepends=('cargo')
conflicts=('sozu-git')
backup=('etc/sozu/config.toml')
_commit=e4e7488232ad6523791b94ad201239bcf7eb9b30
source=(
  "git://github.com/sozu-proxy/sozu#commit=$_commit"
  'config.toml'
  'sozu.service'
)
sha256sums=(
  'SKIP'
  '350a1cd876d380c2fb64cf59858d922814c291c528e2a7688209150f71ded692'
  'b2799a98514bb284fbd10bdbac2d4b330145180fcf9fddede887807d6b08ff84'
)

_gitname='sozu'

build() {
  cd "$srcdir/$_gitname"

  cargo build --release --all
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 "target/release/sozu" "$pkgdir/usr/bin/sozu"
  install -Dm755 "target/release/sozuctl" "$pkgdir/usr/bin/sozuctl"

  install -d "$pkgdir/var/lib/sozu"

  install -d "$pkgdir/etc/sozu"
  install -d "$pkgdir/etc/sozu/ssl"
  install -d "$pkgdir/etc/sozu/html"

  install -Dm644 "$srcdir/config.toml" "$pkgdir/etc/sozu/config.toml"
  for file in certificate.pem key.pem certificate_chain.pem; do
    install -Dm644 "lib/assets/$file" "$pkgdir/etc/sozu/ssl/$file"
  done
  for file in 404.html 503.html; do
    install -Dm644 "lib/assets/$file" "$pkgdir/etc/sozu/html/$file"
  done

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm644 ../sozu.service "$pkgdir"/usr/lib/systemd/system/sozu.service
}

# vim:set ts=2 sw=2 sts=2 et:
