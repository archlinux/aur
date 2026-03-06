# Maintainer: willemw <willemw12@gmail.com>
# Contributor: n0vella <n0vella@outlook.com>

pkgname=cardo-git
pkgver=1.12.0.r36.g17219fb
pkgrel=1
pkgdesc='Podcast client inspired by the Antennapod Android app'
arch=(x86_64)
url=https://cardo-podcast.github.io
license=(GPL-3.0-or-later)
depends=(gtk3 sqlite webkit2gtk-4.1)
makedepends=(cargo git nodejs pnpm)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto') # See https://github.com/toeverything/AFFiNE/issues/6280#issuecomment-2041484627
source=("$pkgname::git+https://github.com/cardo-podcast/cardo.git" cardo.desktop)
sha256sums=('SKIP'
            '9d9b2d1bb6643f5940085e9df3f7853203f4b70a3ac1a94972284f565849f62b')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  pnpm install --dir $pkgname --frozen-lockfile
}

build() {
  pnpm run --dir $pkgname tauri build --bundles deb -c '{"bundle":{"createUpdaterArtifacts":false}}'
}

package() {
  install -Dm644 cardo.desktop "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
  cd $pkgname
  install -Dm755 src-tauri/target/release/Cardo "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 icon.png "$pkgdir/usr/share/icons/${pkgname%-git}.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
