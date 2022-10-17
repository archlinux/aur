# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=topgrade-git
pkgver=9.0.1.r1084.8dd4559
pkgrel=2
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/topgrade-rs/topgrade
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf %s.r%s.%s $(grep ^version Cargo.toml|cut -d\" -f2) $(git rev-list --count HEAD) $(git describe --always)
}

prepare() {
  cd ${pkgname%-git}
  [[ -d target/release ]] || mkdir -p target/release
}

build() {
  cd ${pkgname%-git}
  cargo build --release 
}

package() {
  cd ${pkgname%-git}
  
  install -Dm755 target/release/${pkgname%-git}-rs "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 ${pkgname%-git}.8 "$pkgdir"/usr/share/man/man8/${pkgname%-git}.8
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
