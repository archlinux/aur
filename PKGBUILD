# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy-git
pkgver=3.0.0+dev1+91+ga5704df
pkgrel=1
pkgdesc='SSH-alike that uses the Noise protocol (git)'
arch=(i686 x86_64)
url=https://github.com/oxy-secure/oxy
license=(BSD)
makedepends=(git rust-nightly)
provides=(oxy)
conflicts=(oxy)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo +nightly build --locked --release
}

check() {
  cd oxy
  cargo +nightly test --locked --release || continue
}

package() {
  cd oxy
  install -D target/release/oxy "$pkgdir"/usr/bin/oxy
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/oxy/LICENSE
}
