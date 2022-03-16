# Maintainer: CohenArthur <cohenarthur.dev@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>

pkgname=jinko-git
pkgver=0.3.0.jinx4.r112.g4d8bbc7
pkgrel=1
pkgdesc="Jinko is a small and safe interpreted language with fast Rust and C FFI"
arch=('any')
url="https://github.com/jinko-core/jinko"
license=('GPLv2')
depends=('wget')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --locked
}

check() {
  cd "${pkgname%-git}"
  cargo test --release --locked
}

package() {

  cd "${pkgname%-git}"

  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  echo -e "#!/bin/sh\nmkdir -p \$HOME/.jinko/libs/\ncp -r /opt/${pkgname%-git}/stdlib \$HOME/.jinko/libs/" > bootstrap.sh
  chmod +x bootstrap.sh

  install -Dm 755 "bootstrap.sh" -T "${pkgdir}/usr/bin/jinko-bootstrap"

  mkdir -p ${pkgdir}/opt/${pkgname%-git}/stdlib
  cp -r stdlib/* ${pkgdir}/opt/${pkgname%-git}/stdlib
}
