# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.8.1
pkgrel=1
pkgdesc="Free implementation of the card game Doppelkopf"
arch=('x86_64')
url="http://free-doko.sourceforge.net/FreeDoko.html"
license=('GPL3' 'custom:InnoCard')
depends=('gtkmm3' 'freealut')
makedepends=('asciidoc' 'texlive-latexextra' 'texlive-langgerman' 'texlive-fontsrecommended' 'w3m' 'dos2unix' 'rsync')
source=("https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.src.zip"
        "https://downloads.sourceforge.net/free-doko/FreeDoko_$pkgver.Linux.zip"
        "freedoko-install-directories.patch")
noextract=("FreeDoko_$pkgver.Linux.zip")
sha512sums=('dab3b672c77f44f1053783c21c2e653268df2b7375414a190fc22ee9f601a4deb03a13a0ca2d26913f0951609f1bc693fb1ee9b676912254395646f0ee615775'
            'b8de33c1a037d4ab649f3bf7259d5cd9f5db6adbf7e0f607813bb92ecd1cd24f610fd64f11252e5c18758ea4278424608b46cd3308fafadd93b8871e9d69a358'
            '602f53bfd4c4c49824400a36e4655dc6f6d5692b7277489f8e5f9f9d9d4d90eb086a4d142736e76edc2c8864430d8cbf5fa403bb25497b2c6a510a1979fe7650')

prepare() {
  cd FreeDoko_$pkgver
  patch -Np1 < ../freedoko-install-directories.patch

  # disable manual binary stripping
  sed -i '/$(MAKE) strip/d' src/Makefile

  # extract InnoCard from binary release archive
  bsdtar -C data/cardsets --strip-components=2 \
    -xf ../FreeDoko_$pkgver.Linux.zip FreeDoko_$pkgver/cardsets/InnoCard
}

build() {
  cd FreeDoko_$pkgver
  make compile
  make documentation
}

package() {
  cd FreeDoko_$pkgver
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/usr/share/freedoko/cardsets
  cp -r data/cardsets/InnoCard "$pkgdir"/usr/share/freedoko/cardsets

  install -Dm644 data/cardsets/InnoCard/*.{txt,pdf} \
    -t "$pkgdir"/usr/share/licenses/$pkgname/InnoCard
}
