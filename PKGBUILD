# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=topgrade-git
pkgver=9.0.1.r5.ga5e0128
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/r-darwish/topgrade
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git" pakku.diff)
sha256sums=('SKIP'
            '7a2c8ef69773feb01ba25faee4619377d42f32b70ca392f0710d29fd7e6b9ba6')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | cut -c2- | tr - .
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/pakku.diff
}

build() {
  cd ${pkgname%-git}
  cargo build --release --locked
}

package() {
  cd ${pkgname%-git}

  install -Dm755 target/release/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 ${pkgname%-git}.8 "$pkgdir"/usr/share/man/man8/${pkgname%-git}.8
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
