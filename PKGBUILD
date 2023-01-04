# Maintainer: robertfoster
pkgname=onetagger
pkgver=1.5.1
pkgrel=1
pkgdesc="Cross-platform music tagger with Beatport, Discogs, Musicbrainz, Spotify, Traxsource and many other services support."
arch=('x86_64')
url="https://onetagger.github.io/"
license=('GPL3')
depends=('alsa-lib' 'curl' 'libsndfile' 'openssl' 'webkit2gtk-4.1' 'wget')
makedepends=('cargo' 'npm')
source=(
  "https://github.com/Marekkon5/onetagger/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.desktop"
)

prepare() {
  cd "$pkgbase-${pkgver}"

  if [ ! -d client/dist ]; then
    mkdir client/dist
  fi
}

build() {
  cd "${pkgname}-${pkgver}"/client

  npm i
  npm run build

  cd ..
  cp assets/sndfile.lib .
  cargo build --release
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

sha256sums=('a7a1a44d4b1160cb29096c3c065fed42f507926c4e566584d0e5c9db9e5460f6'
            'be99e88408e985db3f6d9bf410fb812ea40065883a563b227abedea6aa0ae710')
