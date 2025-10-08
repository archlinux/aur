# Maintainer: kodatemitsuru <kodatemitsuru@sjtu.edu.cn>
pkgname='sjmcl'
_pkgname='SJMCL'
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=0.4.3
pkgrel=2
arch=(x86_64)
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
source=("https://github.com/UNIkeEN/SJMCL/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('67155b464062999c5e3d12c8236dd3374b5824e228cfcb9794c6836e446bf201226bb5e886967c42678d2f98fc9eeffea34f9f5e6df7fcafd63f0a6c4ef9c764')
depends=(webkit2gtk-4.1 gtk3)
makedepends=(pnpm npm cargo)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver" || return 1
  pnpm import
  pnpm install
}

build() {
  cd "$srcdir/$_pkgname-$pkgver" || return 1
  pnpm run tauri build --target x86_64-unknown-linux-gnu --bundles deb
}

package() {
  cd "$srcdir/$_pkgname-$pkgver" || return 1
  cp -r src-tauri/target/x86_64-unknown-linux-gnu/release/bundle/deb/${_pkgname}_${pkgver}_amd64/data/* "$pkgdir"
  install -Dm644 "LICENSE.EXTRA" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.EXTRA"
}
