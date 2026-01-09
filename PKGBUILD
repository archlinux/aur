# Maintainer: Michael Straube <michael.straubej@gmail.com>
# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=freedoko
pkgver=0.8.2
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
sha512sums=('26300c51bc34070416361c5138639a7ac0aa9389705c4557bcb139b42cc4b6f29f0f0b6a30b222c87965398b0e9cdbe80252155a63896074c52c973da3da0994'
            '1bb08ee7d8631b890fad2eeb0641c043582dc114cca10303d7af01c61e5db4cb336114683ae4e91f06c26c094eaac1da0f5717d1386e4a136c13455adf349b20'
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
