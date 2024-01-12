# Maintainer: ml <ml@visu.li>
pkgname=vanity_gpg
# v0.3.2 build broken, requires dependency updates
_commit=4f6fcd4233d6b658b1b03622d8f6e768538ddf1c
pkgver=0.3.2.r3.g4f6fcd4
pkgrel=1
pkgdesc='Tool for generating and filtering vanity GPG keys'
arch=('x86_64')
url='https://github.com/RedL0tus/VanityGPG'
license=('MIT')
depends=(bzip2 gmp glibc gcc-libs nettle)
makedepends=(cargo clang git openssl)
#source=("$url"/archive/v"$pkgver"/"$pkgname"-"$pkgver".tar.gz)
source=("$pkgname::git+$url#commit=$_commit")
sha512sums=('SKIP')
options=(!lto)

pkgver() {
  cd $pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd $pkgname
  cargo fetch --locked --target "$CARCH"-unknown-linux-gnu
}

build() {
  cd $pkgname
  cargo build --frozen --release --all-targets
}

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
}
