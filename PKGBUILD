# Maintainer: Jiuyang Liu <liu@jiuyang.me>

_pkgname=nsncd
pkgname=nsncd-git
pkgver=r89.82dd540
pkgrel=1
pkgdesc='nscd-compatible daemon that proxies lookups, without caching.'
arch=('x86_64')
url='https://github.com/twosigma/nsncd'
license=('MIT')
makedepends=('git' 'cargo')
options=('!lto')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

  # systemd
  install -vDm644 $_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  sed -i "s:^ExecStart.*:ExecStart=/usr/bin/$_pkgname:" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
