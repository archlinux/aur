# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=linescroll
_binary=${pkgname}
pkgver=0.1.2
pkgrel=1
pkgdesc="linescroll, monitor log file activity"
url="https://gitlab.com/edneville/linescroll"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('5eb10ec75ca7eec559da06c24ae48bc9c8b567ee605399aa050513b149fead53491a3f729ed01f7b412d6ae578620fc7c87ef0935246e1d59e4980646265bf36')

prepare() {
  cd ${pkgname}-v${pkgver}
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd ${pkgname}-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd ${pkgname}-v${pkgver}
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd ${pkgname}-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m0755 target/release/${pkgname}
  install -Dt "$pkgdir/usr/share/man/man1" -m644 ${pkgname}.1
}

