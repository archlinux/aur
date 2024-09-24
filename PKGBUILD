# Maintainer: willemw <willemw12@gmail.com>
# Contributor: n0vella <n0vella@outlook.com>

pkgname=cardo-git
pkgver=1.6.0.r2.ge71d0d2
pkgrel=1
pkgdesc='Podcast client inspired by the Antennapod Android app'
arch=(x86_64)
url=https://cardo-podcast.github.io
license=(GPL-3.0-or-later)
depends=(gtk3 sqlite webkit2gtk)
makedepends=(cargo git jq nodejs pnpm)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto') # See https://github.com/toeverything/AFFiNE/issues/6280#issuecomment-2041484627
source=("$pkgname::git+https://github.com/cardo-podcast/cardo.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  pnpm install --dir $pkgname
}

build() {
  pnpm run --dir $pkgname tauri build --bundles deb
}

package() {
  local version
  version="$(jq --raw-output '.version' $pkgname/package.json)"
  version="${version:-VERSION_NOT_FOUND}"

  cp -rT "$pkgname/src-tauri/target/release/bundle/deb/${pkgname%-git}_${version}_amd64/data" "$pkgdir"
}
