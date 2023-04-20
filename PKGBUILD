# Maintainer: robertfoster
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=onetagger
pkgver=1.6.0
pkgrel=1
pkgdesc="Cross-platform music tagger with Beatport, Discogs, Musicbrainz, Spotify, Traxsource and many other services support."
arch=('aarch64' 'x86_64')
url="https://onetagger.github.io/"
license=('GPL3')
depends=('alsa-lib' 'webkit2gtk')
makedepends=('cargo' 'pnpm')
options=('!lto')
source=(
  "https://github.com/Marekkon5/onetagger/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.desktop"
)

prepare() {
  cd "$pkgname-$pkgver"

  pushd client
  pnpm config set cache-dir "$srcdir/pnpm-cache"
  pnpm i
  popd

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"

  pushd client
  pnpm run build
  popd

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm755 "target/release/${pkgname}-cli" \
    "${pkgdir}/usr/bin/${pkgname}-cli"

  install -Dm644 "$srcdir/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 assets/128x128.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

sha256sums=('68612bf5f4674ae752850b85c30b2591cca5a73460bb256cd95a1b66e989b116'
            '4e6cba3f230f422f61ef42bfe0f21b2f6016987199cdfc79bccc5b1b8d6a1655')
